--- 
wordpress_id: 173
layout: post
title: Qgyen.ExtendedUrlMapping for CS v2.1
wordpress_url: /archive/qgyen-extendedurlmapping-for-cs-v2-1/
---

<h3>Qgyen.ExtendedUrlMapping v2.1.60714</h3>
<p>With the release of <a href="http://qgyen.net/archive/2006/07/14/Community-Server-v2.1-Beta-1-released_2100_.aspx">Community Server v2.1 Beta1</a>, I've now packaged up a new version of my extended url mapping add-on.&nbsp; This add-on allows you to very easily map one URL within Community Server to another.&nbsp; For instance, it allows you to safely and easily move a blog in CS to the root of your site.&nbsp; You simply map / to match up to /blogs/myblog/.&nbsp; Or you can use it to move your photos to /photos/ from /photos/mygallery/.&nbsp; This allows for a quick and easy way to get CS from its default multiple blog, multiple gallery configuration to a single blog or single gallery setup, with a lot of flexibility.</p>
<p>This new version doesn't contain any new features, but the API for how it works changed just slightly with Community Server v2.1.&nbsp; So, the previous release will not work on CS v2.1, and the new build of this module will not work with CS v2.0.&nbsp; Additionally, with CS v2.0, we'd found an issue with the ASP.NET 2.0 framework where pages were redirecting improperly, causing sites to disappear from search engines like Google and MSN.&nbsp; The work around to this was a different overload of a method in the .NET 2.0 framework, and this was implemented in CS v2.1.&nbsp; However, this module takes over that piece of code.&nbsp; To resolve this, the new release contains both an ASP.NET 1.1 build and an ASP.NET 2.0 build that correctly addresses the problem.&nbsp;</p>
<p><a href="http://qgyen.net/download/cs/Qgyen.ExtendedUrlMapping-2_1_60714.zip">Download here</a> (<i>Updated the download URL</i>)</p>
<p>This contains both a compiled binary for ASP.NET 1.1 and ASP.NET 2.0, as well as the source code/solution files for ASP.NET 1.1 and ASP.NET 2.0.</p>
         
