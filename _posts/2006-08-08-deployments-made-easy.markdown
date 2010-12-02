--- 
wordpress_id: 182
layout: post
title: Deployments made easy
wordpress_url: /archive/deployments-made-easy/
---

<p>One thing I've been after for a while is a nice and easy way to roll out new builds of Community Server to my website.  Though my site isn't 100% stock.  I don't employ any custom code changes to the core libraries.  All of my customizations are leveraged through external libraries and adjustments to the configuration and skins.</p>

<p>I like keeping my site up to date, so I wanted to find an easy way to apply the necessary changes as painlessly as possible.</p>

<p>My first way was to create a small console application in .Net that copies the files/folders and opens the XML configuration files and makes the changes/adds the new pieces.  The problem with this way was when I wanted to make changes to the modifications it made.  Did I copy the new binary over?  Did I remember to update the version?  Did I build it in Debug or Release?  So the problem became that while it made the necessary changes, it wasn't as easy to change what it did.  If while deploying a new build, I remembered I needed to have it copy a new file, it wasn't necessarily a simply 30 second change.</p>

<p>Then recently, I saw <a href="http://www.hanselman.com/blog/">Scott Hanselman's</a> <a href="http://www.hanselman.com/blog/ScottHanselmanDeveloperProductivityToolsVideoPart3.aspx">video #3 on developer productivity tools</a> featuring PowerShell.  I was immediately impressed with how you can interact with XML files in an almost object-oriented manner.  I thought perhaps I could write a small PowerShell script to handle the deployment and changes.  Though after trying it out, I realized that it was easy to change existing elements, but not quite as easy to add new elements (maybe it would be if we had a true schema, but we don't).</p>

<p>I recently got a license to <a href="http://www.scootersoftware.com/">Beyond Compare</a> and had been checking it out.  It dawned on me that perhaps I could utilize beyond compare to generate a CVS or unix diff style patch file.  Unfortunately, Beyond Compare doesn't seem to support generating patches.  However after some searching, I found the <a href="http://unxutils.sourceforge.net/">UnxUtils</a> project which is to port a number of unix utilities to Windows.  In includes ports of the diff and patch utilities.  And with this, I was on my way to an easy deployment that is flexible to alterations...</p>

<p>First, I needed to create a series of patch files for all the files I needed modified.  For this, you use the diff command to create a file detailing the changes.  Two important things to note when using it is that we want the context, or some of the lines around it included to help it locate where the change is.  Also, we want it to ignore whitespace.  The reason is that between builds, the spacing and line numbers can very easily change, causing it to then patch wrong.  But if I have it include the 2 lines above and below, it would be less prone to patch incorrectly and more likely to fail, which will let me know to take a quick look at it.</p>

<blockquote>
<pre><code>diff -c -w orig\communityserver.config mine\communityserver.config &gt; communityserver.patch
diff -c -w orig\siteurls.config mine\siteurls.config &gt; siteurls.patch
diff -c -w orig\web.config mine\web.config &gt; web.patch
</code></pre>
</blockquote>

<p>This will generate all the necessary patch files that I'll need.  These are the main files I need changes to and cover some simple things like adding some CSModules and disable database storage in the communityserver.config, updating my connection string, and adding the ExtendedUrlMapper settings to the SiteUrls.config.</p>

<p>After that, I just need to have my filesystem arranged.  My live site is always in the 'wwwroot' directory, while the new build is always put into a Web.rar file that gets extracted to a 'web' folder.  And then alongside that, I have a 'patch' folder which stores all my patch files.  The changes themselves are scripted out in a 'update.bat' file at the root of all of this.</p>

<blockquote>
<pre><code>/wwwroot    = Live site
/web        = New site, extracted from an archive
/patches    = Stores all the patch files
/update.bat = Batch file containing all the commands to run
</code></pre>
</blockquote>

<p>Once you have all of that laid out, all you need to do is create the batch file itself.  It is essentially going to perform two tasks... copy the files/directories you need, and apply the patches to the config files.</p>

<blockquote>
<pre><code>rem root
copy wwwroot\robots.txt web\

rem bin
copy wwwroot\bin\FlickrNet.dll web\bin\
copy wwwroot\bin\Qgyen.ExtendedUrlMapping.dll web\bin\
copy wwwroot\bin\Qgyen.Lightbox.dll web\bin\

rem utility
xcopy /e /y /r wwwroot\utility\lightbox web\utility\lightbox

rem patch config files
patches\patch.exe -l web\communityserver.config patches\communityserver.patch
patches\patch.exe -l web\siteurls.config patches\siteurls.patch
patches\patch.exe -l web\web.config patches\web.patch
</code></pre>
</blockquote>

<p>You can simply use the copy command to copy individual files, and use the xcopy command to copy entire directories.  It copies some of the files from my 'wwwroot' directory of my old build to the 'web' directory containing the new build.  After that, it will use patch to apply the patches in the 'patches' directory to the files in the 'web' directory.  Also specify the -l option for it to ignore whitespace as well.</p>

<p>Now, once you have batch file and have run it, all you need to do is move the files into the wwwroot directory.  This could be added to the batch file as well, though I prefer to manually flip the switch and give a quick glance at the files to make sure they all succeeded.  Then I usually archive the 'wwwroot' folder, delete its contents, and then move the contents into it from the 'web' folder.</p>

<p>This process is mostly useful if you have your own server or access to the console, though it could be useful even when a webhost.  It is always a good idea to keep a local mirror of what is on your webhost, so you could always run the batch file on the files locally, and then copy them to your webhost.  It would still eliminate, or at least easy, the changes needed.</p>
         
