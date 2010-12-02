--- 
wordpress_id: 39
layout: post
title: ObfuscateEmails Module for CS v1.1
wordpress_url: /archive/obfuscateemails-module-for-cs-v1-1/
---

<div><font face="Arial" size="2">Spending my holiday weekend trying to catch up on some little side projects I've been wanting to do.&nbsp; There was some discussion in another thread the other day (can't find the thread right now, but there was one) about a way to prevent spam bots from getting email addresses out of messages.</font></div>
<div><font face="Arial" size="2"></font>&nbsp;</div>
<div><font face="Arial" size="2">Then I found a nifty little free control from <a href="http://www.advancedintellect.com/">Advanced Intellect</a> called EmailSpoofer.NET.&nbsp; So I wrote a little CSModule to wrap around it and allow email ofbuscation in posts.</font></div>
<div><font face="Arial" size="2"></font>&nbsp;</div>
<div><font face="Arial" size="2">It only works by encoding the email addresses using &amp;#123; style html encoding.&nbsp; I tried doing the JavaScript, but EmailSpoofer.NET spits out an entire &lt;A HREF=""&gt; tag for the email address, while I just wanted the plain text address itself.&nbsp; I couldn't get it to strip it right using the JavaScript, but will continue to try.</font></div>
<div><font face="Arial" size="2"></font>&nbsp;</div>
<div><font face="Arial" size="2">You can get the module at:&nbsp;&nbsp;&nbsp; <a href="http://www.qgyen.net/csaddins/obfuscateemails/">http://www.qgyen.net/csaddins/obfuscateemails/</a></font></div>
         
