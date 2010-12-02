--- 
wordpress_id: 437
layout: post
title: Migrated to Wordpress
wordpress_url: http://invalidlogic.com/?p=437
---
Last night, I managed to migrate my blog from <a href="http://graffiticms.com/">Graffiti CMS</a> to <a href="http://wordpress.org/">Wordpress</a>.  I'd been planning on migrating for a while now, but was just a matter of finally deciding to sit down and do it.

Now, why did I migrate?  I know a few months ago, I caught some slack on Twitter for stating that I didn't see what all the drama of Graffiti was (this was pre-open sourcing).  And I still agree.  Graffiti is a great tool, I liked it and enjoyed it, however I ended up deciding to migrate for a few reasons.  Most notably is the plugin availability/community.  Wordpress has tons of plugins for different tasks, and Graffiti simply doesn't compare.  The developer in me may say "hey, I can write my own" but the reality is that I don't have the time to or really want to.  I wanted a drop dead easy way to include code in posts and didn't want to fiddle with it.  I wanted easier media management, and didn't want to come up with something new on my own.

I had tossed around the idea of writing my own blog, since I wanted it off of my servers, but other services like <a href="http://tumblr.com">Tumblr</a> didn't have <em>quite</em> what I wanted.  I thought it'd be nice to write a simple one in <a href="http://sinatrarb.com/">Sinatra</a> and use <a href="http://mongodb.org/">MongoDB</a> (via <a href="http://mongohq.com/">MongoHQ</a>), but it again came back to prioritizing my different projects, and I've called <a href="http://invalidlogic.com/2008/12/22/blogging-apps-are-the-new-hello-world/">blogging apps the new Hello World</a>.

In the move, I also wanted to bring over all the content from my original blog, qgyen.net.  Now I have basically merged the two blogs and everything from my original domain redirects here.  Gain more Google juice, and sadly, my old dead domain had <em>still</em> more subscribers than my new domain.  Yes, sad.

How was the process?  Not too bad.  For a good guide, I'd recommend <a href="http://jeftek.com/520/migrating-blog-from-graffiticms-to-wordpress/">Jef's post</a>.  I made a few changes through:
<ol>
	<li>I used the original VB.NET version of the GraffitiToBlogML tool (<a href="http://darkfalz.com/post/2009/04/14/Graffiti-To-BlogML-Exporter.aspx">link</a>).  I simply found it before the C# port.</li>
	<li>Both the VB.NET and C# version have the potential of producing invalid XML.  They basically just write out XML directly rather than use the XML libraries within .NET.  One place it broke for me is they produce the old post uri by basically taking the post title and replacing spaces with dashes, it doesn't strip invalid characters.  I had some posts with quotations in the title (").  This broke the XML.  I changed it to use category.LinkName and post.Name, since those are the url-able portions used directly by Graffiti itself.  I also had it not append .aspx, since Graffiti didn't actually do that.</li>
	<li>BlogML seems to treat the post's creation date as when it was published.  This can be an issue if you had migrated from to Graffiti from something else, like Community Server.  I had 300 or so posts who up in December 2007 at first.  The migrated data had a creation date of December 2007, but Graffiti had a separate Published field that marked when it was published.  I changed the tool to handle that so I could migrate my data right.</li>
	<li>At least in the VB version, it was missing some null checks, I ran into one with TagList being null instead of empty.</li>
	<li>I imported using the BlogML importer rather than MoveableType one.  For a really simple walk through, see <a href="http://www.kjctech.net/2010/01/06/how-to-import-blogml-file-to-wordpress/">this guide</a>.</li>
</ol>
I will definitely miss Graffiti, since it was so drop dead simple to use.
