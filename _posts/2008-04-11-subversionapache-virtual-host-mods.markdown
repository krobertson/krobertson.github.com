--- 
wordpress_id: 379
layout: post
title: Subversion+Apache virtual host mods
wordpress_url: /code/subversion-apache-virtual-host-mods/
---

<p>On my servers, I recently added some support for a few others to centrally store some Subversion repositories.&nbsp; Instead of each of them having to install the Subversion server on their own, I figured I'd set up a basic shared one, hosted through Apache.</p>
<p>One thing I was after was virtual host/host header support in the way it served repositories.&nbsp; I wanted to be able to do krobertson.svn.domain.com, or jdoe.svn.domain.com, etc.&nbsp; By default, Subversion will only look for repositories in the specified directory with SVNParentPath, and the directive for specifying an authz access file worked similarly.</p>
<p>I decided to dust off some of my C skills and take a look at making the modification myself.&nbsp; Admitedly, it wasn't some master work, but someone else might like to do the same thing.</p>
<p>Code is available here:&nbsp; <a href="http://github.com/krobertson/tidbits/tree/master/svn_mods">http://github.com/krobertson/tidbits/tree/master/svn_mods</a></p>
         
