--- 
wordpress_id: 608
layout: post
title: Involver Team and Matz
wordpress_url: http://invalidlogic.com/?p=608
---
Yukihiro "Matz" Matsumoto was speaking yesterday at the <a href="http://www.twilio.com/">Twilio</a> offices in San Francisco on what is coming in Ruby 2.0.  Was a great time and was a pleasure to meet Matz in person.  I love to meet people who have changed the industry, but still remain humble.  He was very polite, thanking us for coming, shaking hands, meanwhile everyone was thanking him for Ruby.

One of the great question after the presentation was someone asking him what it is like having, basically, changed development and how it felt when he first realized it was catching on.  Matz said that time was around when the first picaxe book came out.  It was having someone other than himself writing an English book about Ruby and it selling well.  But his general answer to what it was like was "its nice".

<img src="http://invalidlogic-blog.s3.amazonaws.com/100_0098_2.jpg" alt="" title="100_0098_2" width="640" height="480" class="aligncenter size-full wp-image-609" />

The Involver team had the opportunity to take a bit of a team photo with him.  This represents about a quarter of the total Involver Engineering team.  Here we have <a href="http://twitter.com/zedlander">@zedlander</a>, Jaime our System Overlord, myself, Nina our QA queen, and <a href="http://twitter.com/zquestz">@zquestz</a> (aka Josh) who just started this week.  <a href="http://twitter.com/nolamn">@nolman</a> was also there, but had to take off right after the talk.

Ruby 2.0 will have a number of small but very nice language improvements, such as keyword arguments (similar to what .NET 4.0 added), as well as the ability to namespace things, including monkey patching that is scoped to only the namespace.  That there is something that seems like it will bring a lot of power.  Use two libraries that use two different versions of a gem?  What if you could load them in separate namepaces, each utilizing the separate gem versions.  Perhaps you could get really crazy and have a Rails 2 and Rails 3 app running together using separate namespaces.  I don't know why anyone would do that, but you could, and that I like.

Ruby 2.0 will see a large emphasis on embedded and an alternative VM/interpretter for more targeted implementations.  I would love it if we could have a setup similar to the Arudio or Neturdio that ran Ruby.  Matz was talking about bringing Ruby to places like digital appliances, more RTOS environments focusing on latency instead of throughput.  Or having Ruby implementations for the cloud that utilized a smaller subset of the language to run on more targeted hardware.  Distributed processing where perhaps computational power is more important than IO or what not.

My first thought... in a few years, could my DVR be running a Rails web interface?
