--- 
wordpress_id: 572
layout: post
title: Using server aliases with Capistrano output
wordpress_url: http://invalidlogic.com/?p=572
---
One thing we often run into without deploys is "what server is that executing on?"  After updating code, we actually a fairly elaborate process to remove servers from load balancing, restart, wait for load to drop off, then add it back in to load balancing.  We also just use the AWS hostnames rather than our own since our server list pretty much changes weekly.  Wouldn't it be nice to have the ouptut show "app10" instead of "ec2-123-123-123-123.compute-1.amazonaws.com".

Luckily adding an alias to Capistrano is pretty easy!

{% highlight ruby linenos %}
class Capistrano::ServerDefinition
  def to_s
    @to_s ||= begin
      s = @options[:alias] || host
      s = "#{user}@#{s}" if user
      s = "#{s}:#{port}" if port && port != 22
      s
    end
  end
end
{% endhighlight %}

Simply add that to your deploy.rb, or another file that is included with your recipes for utility methods.  It works simply by overriding the ServerDefinition.to_s method, which is used for the logger output.  The only change to the default method is line 4.

Then for your role definitions:

{% highlight ruby %}
role :app, 'ec2-123-123-123-123.compute-1.amazonaws.com', :alias => 'app10'
{% endhighlight %}

Then you see much better output:

{% highlight text %}
 ** [out :: app10] Alive
{% endhighlight %}
