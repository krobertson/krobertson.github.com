--- 
wordpress_id: 141
layout: post
title: Keeping track of time
wordpress_url: /archive/keeping-track-of-time/
---

<p>Not too long ago, <a href="http://www.tankete.com/">Jose</a> pointed me to this <a href="http://msdn.microsoft.com/coding4fun/inthebox/TimeTrack/default.aspx">Coding4Fun Time Tracker</a> article/code sample that he had started using to help keep track of his time spent on different projects every week.</p>

<p>I used to use this program called <a href="http://www.magsoftwrx.com/">Timeless Time &amp; Expense</a>, but eventually grew tired of the program, since it had some annoyances like never remembering to minimize to the taskbar when I first boot up, and it reports were a little flunky, etc.  All I really needed was a very plain and simple application.</p>

<p>So today I started using the application Jose pointed me to and quite liked it.  Was nice, easy to use, and incredibly simple.  Though right away, noticed a few minor annoyances.  Though the nice thing is it is free, and it comes with the source.  Its architecture is nice and simple, so when chatting with Jose, in the course of like 20 mins, we basically solved all of our annoyances.  Added a number of things:</p>

<ul>
<li>Made it so it changes its task bar icon when you are Punched In vs. Punched Out (though my icon editing skills are weak)</li>
<li>Made it so when you change projects while punched in, it will punch you out of the old one, switch, then punch into the new one</li>
<li>Updated the "View Time Info" tree view to anchor to the bottom when resizing</li>
<li>Added a "Clear Time" button to the "View Time Info" screen
<ul>
<li>For this, we actually made it so if you were punched in, it will punch you out, save the data to backup file, clear the data, then punch you back in if needed.</li>
</ul></li>
<li>Added a node to the "View Time Info" screen that has the total time, with all the projects as child nodes and the total node defaults to being expanded.</li>
</ul>

<p>The Coding4Fun article is definitely worth checking out.  If anyone is interested, I could probably post some of our modifications.</p>
         
