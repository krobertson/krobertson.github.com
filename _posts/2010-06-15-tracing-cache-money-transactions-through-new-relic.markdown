--- 
wordpress_id: 558
layout: post
title: Tracing Cache Money transactions through New Relic
wordpress_url: http://invalidlogic.com/?p=558
---
At Involver, we've been starting to make heavy use of <a href="http://newrelic.com/">New Relic</a> to start monitoring performance and track down bottlenecks.  I've been working to add method tracers around components that utilize external APIs or services, and some of the major components we leverage to know how much time is spent in various areas.

We use <a href="http://github.com/nkallen/cache-money">Cache Money</a>, a gem that helps transparently cache models in Memcached.  Out of the box, New Relic supports tracing calls for Memcached, however on traces we'd see a long list of Memcached calls but no information as to which request they were associated with.

For a lot of our additional traces, we've added an rpm_extras.rb file.  To include tracing for Cache Money, just need to define it as follows:

{% highlight ruby linenos %}
::ActiveRecord::Base.class_eval do
  class << self
    add_method_tracer :transaction, 'Custom/CacheMoney/transaction'
    add_method_tracer :find_every, 'Custom/CacheMoney/find_every'
    add_method_tracer :find_from_ids, 'Custom/CacheMoney/find_from_ids'
  end
end
{% endhighlight %}

New Relic itself uses add_method_tracer around transaction and find_by_sql, however Cache Money works by alias_method_chaining transaction, find_every, and find_from_ids.

One thing worth noting is that since both New Relic and Cache Money make use of transaction, order of loading could be important.  In our environment.rb, we load our rpm_extras.rb in the after_initialize block.  When RPM is loaded, it wraps the actual ActiveRecord#transaction call, then Cache Money chains it, and our own tracer wraps the chained call.

Initially, I tried putting the tracer around Cache Money's own transaction_with_cache_transaction, however that didn't show up in traces.
