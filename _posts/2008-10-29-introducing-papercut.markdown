--- 
wordpress_id: 397
layout: post
title: Introducing Papercut!
wordpress_url: /software/introducing-papercut/
---
<p><img width="64" height="64" alt="" style="float: left; padding: 10px" src="http://invalidlogic-blog.s3.amazonaws.com/papercut_64x64.png" /></p>
<p>I am pleased to introduce a new utility I've been playing around with... <b><a href="http://papercut.codeplex.com/">Papercut</a></b>.</p>
<p>Papercut is an SMTP tool designed for testing email functionality in a program.  Ever want to test the email functionality of a program/site, but don't want it to send an actual email?  Maybe you have a bunch of test data, or it is a snapshot of data from a live site.  Papercut is your answer.</p>
<p>Papercut implements an SMTP that is only capable of receiving messages, not sending them.  It has no recipient policy or anything, just accepts whatever it gets and writes it out as an EML file.  Then on top of the SMTP server, it has a GUI that allows you to view the messages it has received in either raw MIME format, plain text, or as rendered HTML.</p>
<p align="center"><img width="350" height="200" alt="screenshot" src="http://invalidlogic-blog.s3.amazonaws.com/screenshot1s.jpg" /></p>
<p>This is something I run into on an almost daily basis.  I might need to check something works, or verify some formatting, and Papercut makes it easy, with no hassle of pointing it to a live SMTP server and verifying my email addresses are correct.  To be honest, I was surprised I couldn't find a program like this already out there.  When I came up empty, decided to write one for myself!</p>
<p>It also makes use of WPF, so should have a pretty small memory footprint on newer OSes (found XP/2003 use more memory than Vista/2008), and the SMTP server is asynchronous and uses the managed thread pool, so it doesn't tie up a lot of resources and should also work well with high message volumes (though the list of messages will get full).</p>
<p>Head on over and <a href="http://papercut.codeplex.com/">get it now!</a></p>
         
