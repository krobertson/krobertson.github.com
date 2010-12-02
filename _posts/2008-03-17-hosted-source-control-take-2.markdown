--- 
wordpress_id: 366
layout: post
title: Hosted source control take 2
wordpress_url: /software/hosted-source-control-take-2/
---

<p>A few weeks ago, I made <a href="http://qgyen.net/technology/search-for-hosted-subversion/">a post</a> evaluating options for hosted Subversion services.  At the time, I was basically drawn to an empty conclusion.  Now, I'm relabeling it "hosted source control" rather than "hosted subverison", since my end goal is to have a nice solution for both subversion and <a href="http://git.or.cz/">git</a>.  The more I look at git, the more interesting it looks, but mainly for non-Windows development, since using it on Windows isn't quite as refined.</p>

<p>I tried using git with hosted-projects.com, since they offer WebDav space according to their site, though I couldn't get it working.  I tried running <a href="http://www.webdav.org/neon/litmus/">litmus</a> against it, a webdav testing program, and it failed pretty bad.  So that was out.</p>

<p>So I was considering the likelihood that I may just need to set up my own virtual server for it on one of my servers. Then just a few days ago, as I was looking at using a git plugin for Trac, I found this program called <a href="http://warehouseapp.com/">Warehouse</a> which was almost exactly what I was looking for.  It is an application you install rather than a service, and it allows you to manage repositories, browse the source, and doesn't have the bloat of wiki/forums/tickets/etc, but it has a plugin architecture so it could eventually, if they were available.  And better yet, on its forums, there was talk of git support in the next version.</p>

<p>Around this time though, I got a beta invite to <a href="http://github.com/">Github</a>.  I had signed up there around the time of my previous post, but at the time, I thought it mainly did public/open source hosting, but it does allow private repositories.  You can't create/manage your own users, but rather just grant access to other users on the site.  It is appealing, but again, there is no clear subversion AND git solution as of late.  They also announced their <a href="http://github.com/plans">pricing</a> recently for post-beta, which looks pretty decent.  One main advantage to git is its portability.  You can move it, sync it in multiple places, or just about anything you want.</p>

<p>Shortly after my first post, Josh Frappier, the co-founder of <a href="http://unfuddle.com">Unfuddle</a> contacted me and I talked with him some.  First, as I've mentioned before, I find it very appealing when those in charge of the companies whose services I use contact me.  He was a very nice guy and talking with him made me like Unfuddle even more.  He told curious why I hadn't considered Unfuddle more, and it was mainly because I was after personal repositories and Unfuddle has a 1-1 relationship for repositories-to-projects.  Not sure if all the stuff he was talking about is public knowledge, but in short, he said they're working on some stuff that will make Unfuddle much more suitable.</p>

<p>Where do things lie now?  As of yet, still undecided.  Short term, it looks like using Github for git and Warehouse on my own is where I'm at.  Long term, it looks like I'll have two options.  I could run it myself and handle both with Warehouse, or have it hosted and managed by someone else with Unfuddle.  Only time will tell.  Part of it is primarily that git only went "mainstream" recently.  As it catches on more, I'm sure more options will crop up.</p>

<p>In the meantime, going to continue evaluating options.  I may just try and using Git 100% for personal stuff, even on Windows stuff, simply to see whether the tools under Windows really do interfere too much.  You graphically view a repository on Windows with <a href="http://sourceforge.net/projects/qgit">QGit</a>.  There is also a cygwin-less port of Git called <a href="http://code.google.com/p/msysgit/">msysgit</a> in the works.  So might not be as bad as one would think.</p>
         
