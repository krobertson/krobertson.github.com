--- 
wordpress_id: 565
layout: post
title: Tracing controller filters in New Relic
wordpress_url: http://invalidlogic.com/?p=565
---
Yet another New Relic goodie today.

One thing I was kind of surprised that New Relic didn't already have instrumentation around out of the box was controller filters.  We had noticed some occasional gaps after the main processing of an action, where all the templates would be rendered, but the execution still went on for a few hundred milliseconds (or sometimes more).  Finally, it dawned that it is probably one of the after_filters.

So we aded tracing around filter execution, and lo and behold, we had one that from time to time would misbehave and execute slow.

To instrument the filters, the simplest way seemed to be by tacking on to the 'call' method of each filter type.

{% highlight ruby linenos %}
::ActionController::Filters::BeforeFilter.class_eval do
  add_method_tracer :call, 'Custom/BeforeFilter/#{method.to_s}'
end

::ActionController::Filters::AfterFilter.class_eval do
  add_method_tracer :call, 'Custom/AfterFilter/#{method.to_s}'
end

::ActionController::Filters::AroundFilter.class_eval do
  add_method_tracer :call, 'Custom/AroundFilter/#{method.to_s}'
end
{% endhighlight %}

And one more goodie while I'm looking at my list of New Relic tracers... ActionMailer.  Have seen this time and time again, that sending email synchronously with the HTTP request can drastically slow down performance.  SMTP server can be slow, can be mailing a number of recipients, submission fails, etc.  For us, most email delivery is asynchronous in the background, but one or two are triggered in line.

To trace ActionMailer delivery:

{% highlight ruby linenos %}
::ActionMailer::Base.class_eval do
  add_method_tracer :deliver!, 'Custom/ActionMailer/deliver!'
end
{% endhighlight %}

Will maybe sometime look at email processing more, but email templates are often far simpler and their action methods do less loading.
