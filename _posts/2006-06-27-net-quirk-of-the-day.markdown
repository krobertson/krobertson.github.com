--- 
wordpress_id: 164
layout: post
title: .NET quirk of the day
wordpress_url: /archive/net-quirk-of-the-day/
---

<p>Here is something that might save you some hair.  The <a href="http://msdn2.microsoft.com/en-us/library/72wdk8cc.aspx">identity element</a> in the system.web section of the web.config takes an optional username and password parameter.  It is good to note that the username parameter is actually "userName" and it is case sensitive.  So, if you try using "username", it will fail.</p>

<p>Also, it is interesting that when you do this by accident and are accessing the site remotely, you will get an ASP.NET "yellow screen of death" about customErrors needing to be set to Off.  The odd thing is that it will show you this screen even when customErrors already is set to Off.</p>
         
