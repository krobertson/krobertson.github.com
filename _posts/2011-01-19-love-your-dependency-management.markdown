--- 
layout: post
title: Love your dependency management
---

Dependency management is a pain in the ass, but it doesn't have to be.

Last month we went through a full migration of all of our systems to a new provider.  This is truly awesome to do when you have all your systems spec'd out and managed with chef, however it can also highlight those areas you might have been lazy or where you didn't enforce your chef specs enough.  We managed to catch a few places where a smaller satellite app had newer system gems installed and not documented in its readme or in our chef specs.

Managing gems is one of those areas that you find varying opinions, but I've definitely fallen in love with [bundler](http://gembundler.com) over the past year.  I use it on all my personal projects, but it becomes even more valuable when used within a team of developers.  Need to change a gem?  Just do it and notify everyone to run bundle install.  Often times, bundler will actually tell them they need to update if it sees changes.  Time to deploy your changes?  That is all you do... deploy them!

Before, we had a mixture of vendored gems and system gems depending on whether some were using C extensions or needed to have system binaries.  But by moving these applications to use bundler, the only gem chef needs to install is bundler itself.

The easing of the process for both sides is awesome... both for the devs and for operations.

Tired of your own gem deploy or dependency management woes?  Take a look... wouldn't hurt.
