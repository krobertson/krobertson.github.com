--- 
wordpress_id: 9
layout: post
title: Painful Windows 2003 install...
wordpress_url: /archive/painful-windows-2003-install/
---

<p>Yesterday, I was tangled up in what has to be my worst Windows install ever.&nbsp; I&rsquo;ve been wanting to put Windows 2003 on my desktop for a while, since I&rsquo;ve been doing more with multiple websites lately, and it is a pain to have to start/stop them multiple times during the day.&nbsp; I had found one solution that allowed multiple ones at the same time with a special extension, but its configuration seemed less pretty.</p>
<p>To make a long story short, it took me 8 hours just to get the system to boot the installation.&nbsp; The installation went fine, the first boot sucked.&nbsp; Since my PC has SATA and no floppy, I had to create a custom install CD with the drivers.&nbsp; No problem, done it before plenty of times.&nbsp; So did it, and then installed fine, but would just infinitely reboot when the &ldquo;starting 2k3&rdquo; screen came up.&nbsp; After <em>many</em> reinstalls, repairs, reburned CDs, finally tracked it down to the fact that the installer wasn&rsquo;t copying the INF file for the drive to the Windows\INF folder.&nbsp; Copied it, yay.&nbsp; Eight hours lost from one file.</p>
<p>Now tonight I am dog tired.&nbsp; Mind you, I started the install last night at ~7:30pm.&nbsp; Didn&rsquo;t get it to boot until shortly after 3am.&nbsp; Bed at 4:30am.&nbsp; Up for work/go back to installing at 8:30am.&nbsp; Yeah, I am going to bed early for once&hellip; damn, actually it isn&rsquo;t, its 2am?&nbsp; WTF!</p>
<p>Side note/question:&nbsp; Is Visual Studio 2005 going to come on DVD by default?&nbsp; I know beta1 did (though I got the CDs since I was downloading it from MSDN subscription)&hellip; but man do I hate installing Visual Studio 2003.&nbsp; Six CDs and it takes so long.</p>
         
