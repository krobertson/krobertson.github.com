--- 
layout: post
title: Announcing Gemstache
---

Pleased to announce [Gemstache](http://gemstache.com), a new service to enable teams and companies to build and distribute their own private gems with security and ease of use in mind.

Gems are an incredibly simple way to package up code and distribute it, making it available to multiple code bases or just a great way to encapsulate functionality.  However, the way gems are traditionally distributed doesn't lend itself well to securing the gems and controlling access.  The default "gem install" command you run doesn't provide any support for authentication against the gem source, so most sources are open to the public.

<div style="text-align: center"><img src="http://invalidlogic-blog.s3.amazonaws.com/2011-06-30-gemstache.png" width="399" height="323" /></div>

Gemstache works by giving you your own private gem source you can use.  In order to download any gems from it, you must have the accompanied "gemstache" gem installed locally or on your servers.  When talking to your private gem source, it interlaces to add authentication to the request as well as ensuring it is happening over HTTPS.  With this, your gems are only downloaded over SSL and any interaction requires authentication.

To make managing your gems easier, the gem adds the ability to easily upload a gem to your private gem source and make it available.  From your command line, just run "gem stache [your gem file]" and it is uploaded and ready for use.

Within the service, you can give users varying roles to define whether they can just download gems, are able to publish new gems, and are able to yank/delete gems.

Gemstache was born out of a need we had been facing at [Involver](http://www.involver.com), where some of our own internal code is enclosed in gems and used between a few of our codebases, as well as we have some gems we have forked to either add customizations or our own fixes.  Traditional methods left them exposed and also more painstaking to release.

We're just about ready to launch a public beta.  Visit [gemstache.com](http://gemstache.com) and sign up to be notified.
