--- 
wordpress_id: 398
layout: post
title: Changing a Window's Service runtime user
wordpress_url: /software/changing-a-window-s-service-runtime-user/
---

<p>Came across a quick tip I thought others might find useful.</p>

<p>A couple of weeks ago, I was sent out onsite to a client in Arizona to diagnose an issue with one of our products and to help with a major upgrade.  During the course of the upgrade, we needed to change the runtime user of the Windows service for Mail Gateway.</p>

<p>In short, even though the installer manifest for Mail Gateway specifies it should use the Network Service account, it looks like that doesn't guarantee it will be set to that when the service is registered.  However, when using Windows Authentication on a site, Mail Gateway must authenticate against IIS, and it needs to be using the same user that the Application Pool is running as.  The main reason for that is because then Community Server will recognize it as a service account.</p>

<p>However, when you change the runtime user, it then asks you for a password!</p>

<div align="center"><img src="http://img.skitch.com/20081209-es7u4uk2t4iniu5sp83eh77a1u.jpg" src="It wants a password!" /></div>

<p>If you click OK or Apply there, it will then prompt you to enter a valid password.  But what is the Network Service user's password?  Network Service isn't really a user, it is a service account.</p>

<p>The answer?  <strong>Leave the password fields blank!</strong>  Yes, just leave them blank, hit OK/Apply, and it will accept it.</p>

<p>This may seem simple, but it wasn't as obvious.  We just had a "well, what if we leave it blank" moment and it worked.  Hopefully in the future, this little top will help someone else.  Will likely put it into a KB article on the Community Server site as well.  And I'll likely look into why the install didn't register it right...though (hopefully) we'll dump Visual Studio setup projects for the MSIs.</p>
         
