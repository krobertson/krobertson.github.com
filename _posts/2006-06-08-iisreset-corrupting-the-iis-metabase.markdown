--- 
wordpress_id: 151
layout: post
title: IISReset corrupting the IIS metabase
wordpress_url: /archive/iisreset-corrupting-the-iis-metabase/
---

<p>Recently, I'd been having an issue where running iisreset would cause the SSL certificate I had assigned to a site I was developing to stop working.  There wouldn't be any error message or anything to indicate something bad happened.  All that would happen is I'd try and access the page over SSL and the browser would hang for a while before timing out.</p>

<p>I'd posted about the issue over at <a href="http://forums.iis.net/thread/1308440.aspx">forums.iis.net</a> and had received some useful feedback.</p>

<p>For starters, I'd found the useful <a href="http://www.microsoft.com/technet/prodtechnol/windowsserver2003/technologies/webapp/iis/ssldiags.mspx">SSL Diagnostic Utility</a> and it told me that the private key for the certificate had been corrupted.  A little workaround was to open mmc, add the certificate snap-in, delete the certificate, reimport it, open IIS snap-in, and reassign the certificate to the site.  Kind a pain, but did fix it.  Though I was still curious if iisreset was actually the cause, or if it was something else.</p>

<p><a href="http://blogs.msdn.com/david.wang/default.aspx">David Wang</a>, refers to <a href="http://blogs.msdn.com/david.wang/archive/2005/04/27/IIS_Configuration_Mysteriously_Disappear.aspx">a blog post</a>, which intern links to <a href="http://www.msusenet.com/archive/topic.php/t-1869432174.html">a newsgroup post</a> about some of the potential caveats to using iisreset and its potential to lose configuration information.</p>

<p>In short, iisreset is bad.  Running it on production servers is especially bad, since it'd be best to just recycle the app pool.  But even on development machines using just Windows XP (and IIS 5.1), it can still cause problems.  You maybe fire off iisreset to quickly restart an application and get back to work, only find it is now not responding and you have to stop your coding marathon to now figure out what happened and how to resolve it.</p>
         
