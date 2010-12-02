--- 
wordpress_id: 389
layout: post
title: DM-Paperclip released!
wordpress_url: /code/dm-paperclip-released/
---

Title: DM-Paperclip - Paperclip for DataMapper

<p>Tonight I posted the official release of the <a href="http://datamapper.org/">DataMapper</a> port of Paperclip that I've been slowly working on for while.  Paperclip is a Rails plugin by <a href="http://thoughtbot.com">Thoughtbot</a> which makes it really easy to attach files to your models.  I've been interested in doing some Merb and DataMapper projects, and one of them was going to make use of Paperclip, so I dived into making a port of it.</p>

<p>DM-Paperclip works exactly like the existing Paperclip plugin, with the same options, features, validations, and it even uses the same tests!  Rather than rewrite Paperclip, I instead just went in and changed what was necessary for compatibility with DataMapper, slowly working on the number of passing tests.</p>

<p>The module is currently targeting DataMapper 0.9, which is still unreleased.  The main reason is because 0.9 is quite different than 0.3, and the current source includes a few fixes and features that were added while I was working on the port.  It is also intended to be used with <a href="http://merbivore.com/">Merb</a>, as the paths make use of Merb.root and Merb.env.  It should work with any of the 0.9.x Merb releases, though with 0.9.3 recently being released, that is the build I've been using it against.</p>

<p>Last night, I finally got the last couple of tests passing, updated it to be in sync with Paperclip 2.1.2, polished some documentation, and now it is ready for mass consumption!  Even managed to <a href="http://giantrobots.thoughtbot.com/2008/5/15/paperclip-tips-and-updates">get a mention</a> on <a href="http://giantrobots.thoughtbot.com/">Thoughtbot's blog</a>.</p>

<p>You can browse the source tree here:  <a href="http://github.com/krobertson/dm-paperclip">http://github.com/krobertson/dm-paperclip</a></p>

<p>Download the source yourself:</p>

<pre><code>git clone git://github.com/krobertson/dm-paperclip.git</code></pre>

<p>Install it as a gem:</p>

<pre><code>sudo gem install dm-paperclip</code></pre>

<p>For more information, check out some of the <a href="http://invalidlogic.com/dm-paperclip/">documentation</a>.  And of course, check out the <a href="http://www.thoughtbot.com/projects/paperclip">original Paperclip</a>.</p>
         
