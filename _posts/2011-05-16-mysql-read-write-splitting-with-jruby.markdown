--- 
layout: post
title: MySQL Read/Write Splitting in JRuby
---

I was rather surprised about the lack of information out there about how to do read/write splitting with MySQL and Rails on JRuby.  This is a pretty key part of our infrastructure, and has been a major point of our attention when performing large platform upgrades.

Having recently gone through one such upgrade and subsequent breaking of our read/write splitting, I had to dive into the code that was doing it more and get a better understanding of how it works.

With JRuby, there are two things to be aware of when trying to enable read/write splitting:

* Does it route the queries to the right box?
* Does it do it without sucking all available connections up on MySQL?

The second one sounds weird, however we have actually seen it and had it cause major issues.  I am not totally sure what to attribute it to, but somewhere between ActiveRecord, ActiveRecord-JDBC, and the MySQL JDBC driver, there is some weird connection handling going on where a connection will still be established, however viewed as dead and a new connection will be opened up.  Eventually, it just sucks up all available connections to MySQL.

This is a pretty big problem, but can work around it.  Most of the existing information out there about how to do read/write splitting with ActiveRecord doesn't always apply cleanly to JRuby.  In particular with one, we ran into the connection-sucking issue while in the benchmarking process.

Fortunately, there isn't a whole lot that needs to be done to enable splitting.  The MySQL JDBC driver [already has support for it](http://dev.mysql.com/doc/refman/5.1/en/connector-j-reference-replication-connection.html) with its ReplicationDriver, you just need to enable it when using Rails.  Then you can leverage a plugin which sets a "read\_only" property on the raw connection when it recognizes a 'SELECT' query.  When read\_only is flagged, the driver knows it can send the query to servers other than the master.

Steps to configure read/write splitting:

### 1) Get activerecord-jdbcmysql-adapter

If you're going to use MySQL on JRuby with ActiveRecord, this is rather a given.  We're currently using v1.1.1 and happy.  All the JDBC adapters are basically rolled up in [one repo](https://github.com/nicksieger/activerecord-jdbc-adapter) which produces multiple gems.

### 2) Get my version of the active-record-jdbc-mysql-master-slave plugin

There is a plugin that takes care of setting the read\_only property on the connection for 'select' queries.  The [original version](https://github.com/mccraigmccraig/active-record-jdbc-mysql-master-slave) of the plugin was originally written for Rails 2.2 and hasn't been updated in 2 years.  We originally used it on Rails 2.2.2 and had a lot of success with it.

It doesn't work on Rails 2.3 through, primarily because of the load order changing.  It previously worked by alias\_methoding the initializer on JdbcAdapter, and in its initialize, would alias\_method the \_execute method if using mysql.  However, load order changed in Rails 2.3 and the database connection is initialized before the plugin is loaded, causing its own version of initialize to not run.  I've [updated it](https://github.com/krobertson/active-record-jdbc-mysql-master-slave) to use a slightly different method to ensure it happens regardless of load order.

To install the plugin, can just use ./script/plugin:

{% highlight text %}
$ ./script/plugin install git://github.com/krobertson/active-record-jdbc-mysql-master-slave.git
{% endhighlight %}

### 3) Ensure active connections are reset in ActiveRecord

You can still experience some issues with stray connections.  The best way we have found to combat this is through an after filter on controllers that does some cleanup.  Add this portion to your ApplicationController:

{% highlight ruby %}
after_filter  :clear_database_connections

def clear_database_connections
  ActiveRecord::Base.clear_active_connections!
end
{% endhighlight %}

By calling <tt>ActiveRecord::Base.clear\_active\_connections!</tt>, it ensures connections are reset.  It is best to try and ensure it is the last after\_filter defined.

### 4) Configure your database.yml

The key in the database.yml is to set up activerecord-jdbc to use MySQL's replication driver and to configure the "url" for it.

{% highlight erb %}
production:
  adapter:  jdbcmysql
  username: myuser
  password: secret
<% if $0 =~ /(rake|irb)/ -%>
  host:     masterdb
  port:     3306
  database: myapp
<% else -%>
  driver:   com.mysql.jdbc.ReplicationDriver
  url:      jdbc:mysql://masterdb:3306,slavedb:3306/myapp?roundRobinLoadBalance=false&autoReconnect=true&failOverReadOnly=true
<% end -%>
{% endhighlight %}

You may be looking at it and thinking I've got erb in my yaml... and yes.  Rails lets you mix the two, and the reason in this case is because we opt to disable the read/write splitting in the Rails console (irb) and when running rake.  Two very important reasons to. First, in console, we've had it suck up all connections just when doing simple debugging.  Not fun.  The normal adapter doesn't do it.  And second, we want it off in rake for when we deploy and it does db:migrate.  We don't want to allow replication delay in there, such as when querying the schema\_migrations table.

For the read/write splitting part, the bulk of the settings are in the "url".  The first host specified is the master, and any others are slaves.  It is *supposed* to support multiple slaves and have the option to load balance between them, though we found in practice it never really worked.  Instead we direct our web app and background processing to separate slaves.  After the hosts comes the database name, and the query string parameters are a number of the driver options.

### How the stuff works

At first, looking at the code for the plugin seemed rather confusing.  Less than 100 lines of injecting into ActiveRecord did our read/write splitting?  But the truth is it is fairly simple, as most of the work is handled by the underlying driver (MySQL's JDBC driver).  All we really need to do is populate that read\_property on the driver's connection.  Shortened up, it does this:

{% highlight ruby %}
alias_method :_execute_without_master_slave, :_execute
alias_method :_execute, :_execute_with_master_slave

# if we're in auto-commit mode and about to execute a select statement, 
# then set the connection in read-only mode for the duration of
# the query... which will permit the query to be load-balanced
# amongst the slaves by the mysql connector/j ReplicationDriver
def _execute_with_master_slave(sql, name=nil)
  # Need to set the read_only option on the raw connection
  # to tell the underlying driver whether the request can
  # go to slaves.
  cro = raw_connection.connection.read_only
  begin
    raw_connection.connection.read_only = 
      raw_connection.connection.auto_commit &&
      JdbcConnection::select?(sql)

    self._execute_without_master_slave(sql, name)
     
  ensure
    raw_connection.connection.read_only = cro
  end
end
{% endhighlight %}

To sum it up, the adapter has an \_execute method which does the real execution and is passed in the raw SQL.  The plugin injects itself in the middle.  First, it captures the current read\_only value, because after it executes the given query, it wants to ensure it is set back to that.  Next, it sets the read\_only property based on whether MySQL itself has auto\_commit on and if it is a 'select' query.  It then calls the original \_execute method, and after it runs, sets read\_only back.

The actual plugin has several additional things, like allowing you to run some statements within a block to ensure it goes to the master, and to only work with the MySQL adapter.