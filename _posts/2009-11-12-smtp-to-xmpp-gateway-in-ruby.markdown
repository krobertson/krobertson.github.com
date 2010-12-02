--- 
wordpress_id: 422
layout: post
title: SMTP to XMPP gateway in Ruby
wordpress_url: /code/smtp-to-xmpp-gateway-in-ruby/
---

<p>Sometimes its just fun to write an app for the sole purpose of playing around with something new.</p>

<p>I'd heard of <a href="http://www.mailhooks.com/">Mail Hooks</a> before, which is a service that turns an email into an HTTP POST.  I'd been wanting a reason to play with XMPP, and found a way to.  I'd been wanting to find a better way to test email functionality in Telligent Community/Enterprise but with live messages.  Typically, this is annoying to set up since you need live email accounts, and need to set up the Windows service for them, and so on.  On a dev machine, often want to do it quick and easy, and will have to regularly re-do the configuration as you switch or rebuild databases.  Using HTTP POSTs for messages also wouldn't work, because most of the developers are behind firewalls or NAT routers (like myself).  I needed something else to send the message.</p>

<p>So what better than an SMTP to XMPP gateway, and then have a simple desktop app I fire up when I want to test messages that acts as an XMPP client.  ~120 lines of ruby and more lines than that in a WPF app, and I got an easy to use solution.</p>

<p>The SMTP server is a very simplistic implementation, but it maintains a list of contacts that are online and allows anything@username.domain.com to be routed to them.  I set it up with ejabberd and have it allow new user registration, and it auto-notifies the SMTP service user.  When the SMTP service gets a notification of a new user, it automatically subscribes to their presence updates, and the client is set up to auto-accept the request.</p>

<p>When whenever the desktop app receives a new message, it sends it over to Telligent Community just as if our normal Windows service did.</p>

<p>Feel free to use the Ruby code as you wish.</p>

<script src="http://gist.github.com/233480.js"></script>
         
