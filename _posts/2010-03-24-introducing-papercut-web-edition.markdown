--- 
wordpress_id: 506
layout: post
title: Introducing Papercut Web Edition
wordpress_url: http://invalidlogic.com/?p=506
---
I've <a href="http://invalidlogic.com/?s=papercut">talked about</a> the Papercut tool I've written before.  I <a href="http://invalidlogic.com/2008/10/29/introducing-papercut/">initially wrote</a> it to scratch an itch I had with previewing and testing emails during the development process.

Recently though while working on Trunks, I've been feeling the need for an email testing tool for staging environments.  Since Trunks involves several moving components, I have a staging environment set up so I can do live testing on features.  Often times that testing involves emails.  Since I run the staging environment with a snapshot of the live database, I want the emails to be sent and viewed for testing, but don't want them going out to live accounts.  Would hate for a user to mistakenly receive an email from my staging environment!

In comes Papercut Web Edition.

<img class="aligncenter size-full wp-image-513" title="Papercut" src="http://invalidlogic-blog.s3.amazonaws.com/Papercut.jpg" alt="" width="621" height="527" />

Papercut Web Edition provides you with an SMTP account that you can connect to, authenticate with, and send emails two.  It works just like the desktop Papercut where messages sent to it are only stored locally, not sent on to their destination.  It then allows you to view the messages through the website.

<img class="aligncenter size-full wp-image-512" title="Papercut Account" src="http://invalidlogic-blog.s3.amazonaws.com/Papercut-1.jpg" alt="" width="621" height="527" />

With this, when you set up a staging environment, you simply point it to the SMTP server and off you go.  In something like Telligent Community, just a matter of quickly checking the Email Settings, or with a Rails app, just need to edit your "staging" environment configuration.

The service is provided free of charge.  It is simply ad supported, so while using it you will see an AdSense banner on the side.  I've tried to make it unobtrusive while at the same time striving for the service to generate something in return.  I may be changing it to use some different ads if it gets some sponsors, as I don't expect AdSense to really draw in a whole lot.

Currently, it will delete messages after they are 2 hours old.  It is intended for testing emails, not retaining them, so the idea is you trigger the email, view it online, and then are done with it... or simply proving a way for emails to be safely sent while you test other aspects of your app.

I have several more features that will be coming down the road.  Right now, it is rather simplistic as I created it quickly to solve my problem.  But it has some big things coming to help tackle some other emails testing annoyances I've felt.  It'll also have support for attachments, embedded images, forwarding messages onto a live account, and much much more.

So the most important piece?  The URL!
<h1 style="text-align: center;"><a style="color: #047; text-decoration: underline;" href="http://dummysmtp.com">dummysmtp.com</a></h1>
All good names with Papercut in them were taken... and as a site URL, "papercut" has more connotations with paper and pain than email.  Dummysmtp is very descriptive of what it does... may the SEO gods look fairly upon it.

<b>Sign up today and try it out!  Go forth and test emails... safely!</b>
