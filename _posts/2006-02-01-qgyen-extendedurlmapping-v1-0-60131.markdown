--- 
wordpress_id: 80
layout: post
title: Qgyen.ExtendedUrlMapping v1.0.60131
wordpress_url: /archive/qgyen-extendedurlmapping-v1-0-60131/
---

<p>I was going to wait to post this in the morning, but since I had it all packaged and ready to go, I figured why not do it now.</p>
<p>I found the issue that was concerning me about my URL mapping module for Community Server.&nbsp; As it turns out, it was an issue in Community Server and not with the module.&nbsp; The problem was with the URL rewriting under <em>just</em> the right circumstances.&nbsp; It has been fixed and will be a part of the next release.</p>
<p>So as for my module, it is now ready for release!&nbsp; I made a few improvements to how it will handle blogs/galleries in the root, so that it won&rsquo;t always attempt to rewrite URLs twice (since everything is a candidate for checking when you have a root one configured) and to avoid coming back with a false response.&nbsp; In short, to try and make it quicker and more fool proof.</p>
<p>So without further ado: <a href="http://qgyen.net/files/1356/download.aspx">Qgyen.ExtendedUrlMapping.zip</a></p>
<p>To install and configure the module, please follow the instructions included in the readme.txt in the ZIP file.&nbsp; A brief synopsis of the instructions is mentioned in one of my <a href="http://qgyen.net/archive/2006/01/09/1196.aspx">previous posts</a>, but when installing, follow the readme as it is more specific.</p>
         
