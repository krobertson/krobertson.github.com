--- 
wordpress_id: 57
layout: post
title: Simple CS mod...
wordpress_url: /archive/simple-cs-mod/
---

<p>Last night, I was up working on a simple little CS mod for the Galleries&nbsp;that I may release once v2.0 comes out.</p>
<p>I've been roaming a number of photography forums lately digging around for info on photography terminology and practices and such.&nbsp; One thing you frequently find is people posting pictures to share with others or get feedback on.&nbsp; Often times, especially if they are asking "how can I improve xyz in a picture like abc?", one of the first responses is to post the stats of the image they are trying to improve (stuff like aperature, ISO, shutter, focal length), as this info is sometimes over looked when first posted.</p>
<p>So, I thought, why not include it directly within the image when crossposting?&nbsp; And that is exactly what I wrote a mod for.</p>
<p align="center"><img src="http://test.qgyen.net/photos/images/1175/exif.aspx" /></p>
<p>Pretty simple.&nbsp; You just go view one of the scaled versions of the image and change the trailing part of the path to 'exif'.&nbsp; Nice and simple.&nbsp; It is configurable too, for the width/height of the scaled image, the location of the text, and the properties that it will show.</p>
<p>As a side note, think I am going to start a side project to overhaul the EXIF support in CS.&nbsp; Haven't found a good strong C# based EXIF library with XML based resource files.&nbsp; Have one, but it is a little overly complicated, and pictures from my new camera cause a stack overflow exception in it. :)&nbsp; Galleries could use more elaborate EXIF support (IPTC, manufacturer specific, value-definition... wtf is flash value of 73?&nbsp; it is supposed to represent something else).</p>
         
