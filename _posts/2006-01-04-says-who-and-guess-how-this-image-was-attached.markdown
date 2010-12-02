--- 
wordpress_id: 60
layout: post
title: Says who?  And guess how this image was attached...
wordpress_url: /archive/says-who-and-guess-how-this-image-was-attached/
---

<p><img alt="IMAGE_010" src="http://www.qgyen.net/files/1189/download.aspx" align="left" border="0" /></p>
<p>In this shopping center by my place, there is this Chinese restaurant whose name is literally &ldquo;Wonderful Chinese Restaurant&rdquo;.&nbsp; I am supposed to take their word for it?&nbsp; Perhaps sometime we will be brave enough to try it out, but I am a little weary.&nbsp; I could say my poop smells like roses, but that doesn&rsquo;t mean it is true.</p>
<p>So, as you can probably see, I got the blog/gallery all fixed now.&nbsp; <a href="http://www.scottwater.com/">ScottW</a> and I came up with a nifty idea earlier tonight about an even better way to handle single blogs/galleries.&nbsp; It absolutely kicks ass.&nbsp; But more about that tomorrow... I got to space out some of my cool news (already have one to talk about in this post).</p>
<p>Ok, so what could be so cool about this post aside from the nice picture on the left from the picture from my camera phone?&nbsp; Well, this post was made in <a href="http://blogjet.com/">BlogJet</a>, using the MetaWeblog API.&nbsp; And no, I did not previously posted the picture and put a link to in here.&nbsp; While the picture is in my gallery, the picture that is loaded by this blog post was uploaded using <a href="http://blogjet.com/">BlogJet</a> through the MetaWeblog API in Community Server.&nbsp; Last night, I was hacking away for a while and wrote an extension to the standard MetaWeblog implementation in CS and implemented the newMediaObject method which allowed you to upload files with a blog post and link to them directly.</p>
<p>How does it work?&nbsp; Currently in Community Server, we have extended attachments support to the blogs, but we are still limited to only one attachment per post.&nbsp; So this module circumvents that just a little bit by actually inserting the files into a pre-determined Files Gallery and then linking directly to the file there.&nbsp; That way, you can include as many pictures/files as you wish.</p>
<p>This feature will not be included with CS itself.&nbsp; Because it requires you to first setup a File Gallery for the blogs and tell it which one, it isn&rsquo;t a very clean/out-of-the-box way to do it.&nbsp; We are planning to implement multiple attachments support, and when that is done, this functionality will be moved into the Community Server core, but this work will not be done for v2.0.&nbsp; I am going to release this module third-party once we release Beta3 though (soon).&nbsp; So keep tuned and it will be available shortly.</p>
         
