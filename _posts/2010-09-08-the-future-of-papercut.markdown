--- 
wordpress_id: 596
layout: post
title: The Future of Papercut
wordpress_url: http://invalidlogic.com/?p=596
---
It has been three months since I moved to doing Ruby full time, and it has been three months since I've written any .NET.  This is a trend that will likely continue as I'm no longer writing .NET day to day.  However, I don't want one of my babies, <a href="http://papercut.codeplex.com/">Papercut</a>, to die a neglectful death.

Papercut isn't really a large codebase and doesn't have a laundry list of problems or anything, but it does have a list of feature requests that I know I won't have the time to get to.  So I am looking for someone to take over maintenance of it.

With open source, it is easy enough for anyone to fork the code and run with it, but people still tend to be drawn to the official codebase and site for the latest updates.  The problem with looking for people to take over is that you can't necessarily hand it off to just anyone.  In many ways, it is like applying for a job.  You can't just say "ohh, I'll do it!" since the bigger question is are you capable of doing it.

The ideal person would be someone who:

<ul>
	<li>Has experience with .NET socket development.</li>
	<li>Understands the SMTP protocol, or can read and make sense of protocol RFCs.</li>
	<li>Understands MIME format enough to work with it.</li>
	<li>Be good to have a basic understanding of asynchronous IO and threading/managed thread pools.</li>
</ul>

This isn't an absolute list, but more of a wish list or a list of what you should expect.  Most of the feature requests for Papercut involve extending it to support more MIME functionality and bugs will often require troubleshooting the networking code or threading, which can be very different than traditional web or GUI apps.

Anyone who is interested, please email me at ken@invalidlogic.com.
