--- 
wordpress_id: 396
layout: post
title: Warehouse open sourced, and forked
wordpress_url: /code/warehouse-open-sourced-and-forked/
---

<p>Last week, <a href="http://entp.com/">ENTP</a>/<a href="http://activereload.net/">Active Reload</a> <a href="http://hoth.entp.com/2008/9/30/warehouse-is-now-open-source">open sourced</a> their web-based Subversion browser <a href="http://warehouseapp.com">Warehouse</a>.  I've been using Warehouse on my own box for about six months for my personal Subversion repositories and had been anxiously awaiting their next release, since it was supposed to add support for Git.</p>

<p>With it being open sourced, and on Github, I went ahead and <a href="http://github.com/krobertson/warehouse">forked it</a> almost right away.  One of the first things I wanted to do was to port some of my customizations from 1.1.6 over to the latest code.  I had made a number of tweaks to make it so that Warehouse itself managed the Subversion repositories, rather than you pointing it to an existing repository.  Also fixed up a few incomplete/unused parts like its dashboard, added the ability to display README files inline with the directory listing (like Github) and so on.</p>

<p>With the open sourcing, it looks like a lot of their support for Git was half done.  It supports browsing and changesets, but has nothing for adding Git repositories, and have had a few issues with syncing changesets.  I've fixed it up so that things basically work, though unsure about how much effort it would take to finish it.  If you're using something like <a href="http://scie.nti.st/2007/11/14/hosting-git-repositories-the-easy-and-secure-way">Gitosis</a> (which I am), don't know if a lot of the management is needed.  Gitosis takes care of most of creating repositories, SSH keys, and permisisons, but it is still nice to have the repositories browsable on the web and easily manageable.  If collaborating with some others on a project, it is nice to create an account for them and add their SSH keys themselves.  Could have Warehouse write to and commit the gitosis.config, though that seems a little funky.</p>

<p>Overall, I am not sure how far I am going to take my improvements on Warehouse.  But in general, the code could use a lot of clean up, as the <a href="http://twitter.com/technoweenie/statuses/940866500">author admits</a>.  What would be really nice would be a rewrite in Merb/DataMapper, and designed to be more SCM agnostic, so it could also work with Bazaar or Mercurial.</p>

<p>Another thought is to have built in WebDAV support, so it isn't dependent upon outside processes for serving the actual files.  Right now, it basically assumes mod_dav_svn in Apache, likely Gitosis for git, or possibly WebDAV.  But with those, taking the management of passwords and permissions takes additional steps to set up... you can't just install and run.  Though rewriting would be a big undertaking, which I'm not sure if I am up for.  I tend to jump between extracurricular projects, as they tend to mound up.</p>

<p>If you do clone <a href="http://github.com/krobertson/warehouse">my code</a>, be aware the installer is currently broke.  My changes introduced some new configuration settings that the default installer doesn't create.  Going to be fixing that.</p>
         
