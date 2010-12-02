--- 
wordpress_id: 130
layout: post
title: Paying attention to dynamic dependencies
wordpress_url: /archive/paying-attention-to-dynamic-dependencies/
---

<p>I recently stumbled upon an interesting issue that is so easily overlooked when coding applications that run in the background.  On boot up, Windows starts up all the registered services one by one, taking into account which ones depends on the others.  In this way, any services it is dependent upon will be ensured to be running before it is started.  With Mail Gateway, all the configurations we've seen have had MSMQ running on the same machine, and there was an issue where the server could start Mail Gateway before MSMQ is running, causing it to not start up properly.  So, we made a change so that Mail Gateway had a dependency upon MSMQ.</p>

<p>Then, we recently discovered an issue were the News Gateway add-on failed to start on boot up.  The problem this time was that the SQL Server it uses is on the same box, and on start up, the News Gateway gets a list of available sites and their settings.  It is quite common for SQL Server to be on the same machine, and for an application to need to connect to it on start up.  The problem is that the machine could start the application before SQL Server has been loaded.  So, we could just have the installer create a dependency on SQL Server, however in CS, we don't require the database to be on the same machine.</p>

<p>So the problem is, we would need to create the dependency on installation, but at install time, we don't know where the database is going to be.  We could ask the user, and then create the dependency if needed, but they could change their mind, and uninstall SQL Server, which could leave News Gateway in limbo.  The same issue is prevalent with Mail Gateway and its dependency on MSMQ.  With most configurations, it is on the same box, but we don't actual require that.  Our main reason for choosing to use MSMQ was to enable a more diverse and distributed configuration.</p>

<p>Another issue is that background applications don't have any interface with the user.  So when it fails to start up, sure it writes a message to the log, but there isn't anyone continuously checking the logs.  So it will go unnoticed until someone says "hey, I haven't gotten any emails for a few days" or "I can't connect over NNTP".  Then you are kind of caught with your pants down.</p>

<p>The solution is not to use a dependency, but to change the programs so that if they fail to connect on startup, they will continue on (instead of exiting and aborting), and to continue to retry until it is able to connect.  So, the main point of my post, is to be aware of what your application is using that is beyond your control, and to code it so you can control them... in a way.</p>
         
