--- 
layout: post
title: Serving Static Content Via POST From Nginx
---

Recently, a change was made on Facebook's end where their <fb:iframe> FBML tag started doing POST request to get content.  Their documentation seemed to indicate their "Post for Canvas" change wouldn't affect the <fb:iframe> tag, however our error logs spoke quite to the contrary.  We saw an influx in errors in places where we used <fb:iframe> to pull in static content.  Nginx would simply return a 405 error for "Method Not Allowed".  Nginx can't serve static content on a POST request.

Some quick googling seems to reveal some quick answers, but the problem is none of them worked.

The most popular, [this thread](http://forum.nginx.org/read.php?2,2414,47301), talks about a work around by manipulating the error page for nginx.  First, there is some mixed syntax depending on the nginx version.  Some references seem to be to old 2007 syntax which doesn't work on the nginx 0.7 build we use.  But they all indicated that this *should* have worked:

{% highlight nginx %}
error_page 405 =200 @405;
location @405 {
  root ...;
}
{% endhighlight %}

This basically tells nginx to change the response code to 200 for 405 messages, and to use the @405 location entry to handle it.  Setting the root it is supposed to pull the requested document.  It didn't work though.  At best, I got it to return a 200 code, but no response body.  Essentially, it was still doing a POST request and it still didn't like it.

I could however, get it to be served by proxying it to our Rails application, if I enabled serving static content from Rails.  But that was less than ideal.

But then, I was scanning through nginx's [proxy documentation](http://wiki.nginx.org/HttpProxyModule) and found what seemed like an ideal solution.  I could configure nginx to serve static content on another port, have the main server proxy it to the other port, and when proxying, change it into a GET request:

{% highlight nginx %}
upstream static_backend {
  server localhost:89;
}

server {
  ...
  error_page 405 =200 @405;
  location @405 {
    root ...;
    proxy_method GET;
    proxy_pass http://static_backend;
  }
}

# POST STATIC CONTENT
server {
  listen 89;
  server_name _;
  root ...;
}
{% endhighlight %}
