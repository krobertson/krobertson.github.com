--- 
wordpress_id: 382
layout: post
title: First open source contributions
wordpress_url: /code/first-open-source-contributions/
---

<p>Probably nothing to really go screaming about, but with wanting to become more publicly active as a developer, part of that involves getting code out there, and also contributing to other projects.</p>

<p>At <a href="http://telligent.com/">Telligent</a>, we do yearly performance reviews and goal setting as way to grow as a developer in experience/knowledge and bring it back into the company.  One of my goals for this year was to contribute to open source as a way of expanding outside of our own internal stuff.  Part of it is while I enjoy <a href="http://communityserver.com/">Community Server</a>, I've been looking at that code for about 3.5 years.  Open source is a great way to get involved with other initiatives and make contributions where you can, or to write some small piece of code and put it out there for others to consume, contribute, and grow.  Can be small, short departures from the norm, and gain experience that you can roll into future works.</p>

<p>As a comparison, it is interesting the difference between the Ruby world and the .NET world when it comes to open source.  There are tons of components/extensions in both worlds, but in the .NET world, the majority are commercial components, from companies like <a href="http://devexpress.com/">DevExpress</a>, <a href="http://telerik.com">Telerik</a>, or <a href="http://xceed.com/">Xceed</a>.  While in Ruby, almost all are open source.  .NET does have excellent open source projects, such as the first one to come to mind being <a href="http://subsonicproject.com/">SubSonic</a>, but not nearly as many.</p>

<p>Some others like <a href="http://www.hanselman.com/">Scott Hanselman</a>, with his <a href="http://www.hanselman.com/blog/CategoryView.aspx?category=Source+Code">Weekly Source Code postings</a>, will use/work with other existing code to better their own knowledge.  I'd much more like the approach of writing code to put out there and contribute to other projects.  In this way, it is more actively writing code instead of working with code.</p>

<p>At any rate, I recently made my first open source contribution.  I've been doing some work with <a href="http://merbivore.com/">Merb</a> and <a href="http://datamapper.org/">DataMapper</a>, and was working on a little project to port the <a href="http://www.thoughtbot.com/projects/paperclip">Paperclip</a> extension by <a href="http://www.thoughtbot.com/">Thoughtbot</a> to DataMapper.  While working on it over some PTO time I had, I needed <a href="http://github.com/sam/dm-core/commit/0e283f878c5bd0a3cb241a553ba2c967e17b3e91">to</a> <a href="http://github.com/sam/dm-core/commit/adecabc80c625c9473613f69ec4c83729336bb05">add</a> a feature to DataMapper so I could make a custom type more contextually aware.  So if your attachment is in a user model and named avatar, you want to know that when saving it onto the filesystem.  And just yesterday, my fork got merged back into the core.</p>

<p>As for the Paperclip port (I've called DM-Paperclip), I will hopefully get it polished off this weekend.</p>
         
