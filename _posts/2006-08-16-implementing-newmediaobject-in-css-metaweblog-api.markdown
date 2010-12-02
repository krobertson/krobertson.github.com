--- 
wordpress_id: 186
layout: post
title: Implementing newMediaObject in CS's MetaWeblog API
wordpress_url: /archive/implementing-newmediaobject-in-cs-s-metaweblog-api/
---

<p><a href="http://qgyen.net/archive/2006/01/04/1190.aspx">Quite a while ago</a>, I'd made a reference that I'd written an extension to Community Server's MetaWeblog API to enable the use of the newMediaObject function, but to my recent realization, I never released the code for it!</p>

<p>With the recent release of <a href="http://windowslivewriter.spaces.live.com/blog/cns!D85741BB5E0BE8AA!174.entry">Windows Live Writer</a> by Microsoft, I've gotten a couple requests for this module and I could have sworn I had packaged it up and posted it, though haven't been able to find it... so I guess I never did!</p>

<p>Anyway, for all you who are looking for it, I will be posting it either tomorrow or Friday.  I've gone through and made a couple of updates to it and will be retesting it before releasing it.  Main change is that before, it put the files in the File Gallery, though I figured that could quickly get used up by sites using the Express version of Community Server, so instead, it will simply write it to the filesystem.  Figure might as well keep it simple.  It'll also support creating individual folders for each blog so that a site using it with multiple users won't run into naming conflicts on the filenames.</p>
         
