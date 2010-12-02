--- 
wordpress_id: 169
layout: post
title: Some changes around here
wordpress_url: /archive/some-changes-around-here/
---

<p>Since Scott already kind of mentioned it, I guess it is ok for me to kind of mention it.  Anyone who has been around Community Server for our past few releases might come to know that once <a href="http://scottwater.com/blog/">Scott</a> <a href="http://scottwater.com/blog/archive/2006/07/05/Site-Update-_2D00_-CS-2.1.aspx">updates his site</a> to the latest source, then that probably means a public release isn't too far off in the future.  Unfortunately, that is all I can say. :)</p>

<p>Have made a few changes around here though...</p>

<p>First, I've started using <a href="http://www.feedburner.com/">FeedBurner</a>.  I'm not doing much with it, but it is nice to use it to track some statistics and what not.  Since <a href="http://scottwater.com/blog/archive/2006/07/07/Feedburner-and-CS-2.1.aspx">Scott did it</a>, I figured I'd try it out.  For the basics, there isn't a huge advantage, but you can do some things like extend your feed with their "flare," or can get some good stats on subscribers and clicks.  So for the record, my new feed URL is: <a href="http://feeds.qgyen.net/krobertson/">http://feeds.qgyen.net/krobertson/</a>.</p>

<p>Second, I've updated the build on my site again.  I try to keep it fairly up to date, as actually using the software live is the best way to flesh out bugs and annoyances.  The latest batch includes a series for fixes for CS in ASP.NET 2.0 under Medium Trust.  We now have a built in emails job that uses System.Net.Mail instead of System.Web.Mail, fixed a few bits of code that were causing SecurityExceptions under medium trust, added full support for site-wide proxies and web.config defined proxies, and fixed a few issues with reader/roller when running under Medium Trust.  Will likely be doing a write up on how to configure a server for Medium Trust with CS soon.</p>

<p>Third, updated my <a href="http://qgyen.net/archive/2006/02/01/1357.aspx">Qgyen.ExtendedUrlMapping</a> library for single-blog sites in CS v2.0.  This update is dependent upon CS v2.1, so will release it once v2.1 goes public.  The update is related to <a href="http://communityserver.org/forums/thread/537006.aspx">an issue</a> with CS and ASP.NET 2.0 causing sites to disappear from Google and other search engines.  The bug was actually in ASP.NET, but there is a workaround that has been applied to CS v2.1, and I've updated the library to leverage it as well.</p>

<p>And finally, you may notice my site's skin changed and is no one of the default skins from v2.1.  Yes, I dropped my previous skin.  To get it to work right (ie, skin the blogs, galleries, and files), I had to make changes to the root, side wide skin.  Since I do fairly regular builds to my site, I don't always keep up to date on skin changes.  I know all about the pains of updating skins with new versions, trust me.  A lot of skinning improvements will be made with v2.2.  But for me, I update my build frequently, and skinning issues hinder that.  Perhaps after v2.2, if we reach some of our goals, skinning issues will go away.  In the meantime, one of the stock (but still very nice) skins is what I'll have.</p>
         
