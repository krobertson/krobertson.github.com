--- 
wordpress_id: 364
layout: post
title: I've got Mono
wordpress_url: /software/i-ve-got-mono/
---

<p>No, not the <a href="http://en.wikipedia.org/wiki/Infectious_mononucleosis">bad kind</a> of mono, but the <a href="http://www.mono-project.com/Main_Page">good kind</a>.  The kind that lets me run .NET applications on Linux.</p>

<p>Some time ago, <a href="http://graffiticms.com/blog/graffiti-to-run-on-mono/">it was announced</a> that <a href="http://graffiticms.com">Graffiti CMS</a> would run on Mono, allowing for easy cross platform compatibility.  Well, I think I am now the first one to have their blog up on Graffiti using Mono.</p>

<p>So there you have it.  My blog is running on Gentoo Linux 2007.0, using <a href="http://nginx.net/">nginx</a> + FastCGI with a build on Mono from subversion (from today) and using VistaDB, and also running a Ruby based processor monitor called <a href="http://god.rubyforge.org/">God</a>, which is set up to make sure the service stays available and watches memory and CPU consumption.</p>

<p>What does it take to get Graffiti up on Mono?  Really, not a whole lot.  First, you need Mono.  Graffiti currently requires Mono 1.9, and it looks like the <a href="http://mono.ximian.com/monobuild/preview/download-preview/">Mono 1.9 Preview 4</a> was just released today.  Then download and extract Graffiti, go into its main directory, and to test it locally, just fire up xsp2.  xsp2 is basically a mini-webserver, kind of like the light built in webserver you can fire sites up in with Visual Studio.  Nothing else is really needed.  By default, Graffiti will use the small sample VistaDB database.</p>

<p>You would more than likely need Preview 4 to use all of Graffiti's functionality.  There were some bugs in Mono that would have made Preview 3 a requirement, but if you have a Graffiti license, there was a bug with the some of the methods our licensing uses that was fixed either the day of the Preview 3 release, or the day before, and might not have made it in.</p>

<p>Probably the most common configuration to go with for a live site would be <a href="http://apache.org/">Apache</a> and mod_mono, however I like to be a little different.  I run some little <a href="http://qgyen.net/technology/experimenting-in-rails/">Rails apps</a> from this same virtual server, and in the Rails community, Apache is often viewed as a little bloated.  A popular combo is to use nginx, and since nginx supports FastCGI, figured I might as well try and get the two to work together.  <a href="http://www.lighttpd.net/">Lighttpd</a> is another popular web server, but I already had nginx in place, so figured would just keep that.</p>

<p>I'll probably post some more details soon, including my configuration scripts for nginx and for god.  I also think I might try and do some basic benchmarks.  Set up a couple of virtual machines here on a spare system and test Graffiti's basic performance under IIS6, IIS7, nginx, lighttpd, and Apache+mod_mono.  Could prove interesting, so will maybe make it a weekend project.</p>
         
