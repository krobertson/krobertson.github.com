--- 
wordpress_id: 32
layout: post
title: Late night CS hacking, few new things for Galleries
wordpress_url: /archive/late-night-cs-hacking-few-new-things-for-galleries/
---

<P>Didn't plan on it, but ended up having a bit of a late night hacking a few things into CS Galleries for v1.1.</P>
<P>Started out as going through some of the pictures users had emailed me that failed to be added.&nbsp; Few of them were things I'd already fixed, caused by cameras that support adding the picture's date/time, but still add the tag with all zeros (which is below .NET's DateTime.MinValue).&nbsp; That was already fixed early on post-1.0.</P>
<P>Then this other one was more tricky.&nbsp; It was a picture that was failing the check to see if it was a valid image, even though Windows and everything else could still open it.&nbsp; The code CS uses to check images without using System.Drawing is a class I ported from java (called <A href="http://www.geocities.com/marcoschmidt.geo/image-info.html">ImageInfo</A>).&nbsp; In digging through it, I found the APP0 marker (typically has the identifier, version, DPIs, and embedded thumbnail size), which is normally 14 bytes, was only 8.&nbsp; At first, I figured it was a cheaper camera that wasn't good with standards, but the EXIF info said it was a Canon PowerShot.&nbsp; So I dug deeper.&nbsp; Then in going through the JPEG spec, I found that 8 could be valid if it didn't have a DPI specified.</P>
<P>Then decided to dive into adding support reading the EXIF comments directly into the picture's description.&nbsp; Then, I found that in Windows XP, when you add the title/subject/comments (by right clicking and going to Properties on the picture), that doesn't go into the jpeg comments, but the EXIF data.&nbsp; So, I added support to the EXIF reader to get the Windows title/subject/keyword/author/comments tags.&nbsp; Also, if you don't specify a title for the entry, it will first look for the Windows title, then the Windows subject, and then settle on the picture's filename.&nbsp; For the description, if you didn't enter one, it'll first look for JPEG comments, and then settle on the Windows comments.</P>
<P>Have had a couple of users ask for reading comments from the picture, and now v1.1 will do that.</P>
<P>Now, it is 2am, and it is too late to watch Deadliest Catch.&nbsp; It'll have to wait until tomorrow.</P>
         
