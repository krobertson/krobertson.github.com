--- 
wordpress_id: 413
layout: post
title: "TC5.0 Email Templates: An Overview"
wordpress_url: /code/tc5-0-email-templates-an-overview/
---

<p>In the newest version of Telligent Community and Telligent Enterprise, we've completely rebuild the way email templates are handled to unlock a new level of possibilities and performance.  I'm planning on going over several aspects of it, including highlights, usage, and extending the new templating with a series of blog posts.</p>

<p>Up until now, we've always used the build in System.Net.Mail.MailMessage support which is baked into the framework.  While it has served us well, it had a couple of limitations that we had been bumping up against in trying to grow Mail Gateway's functionality.</p>

<p>The new templating is based on nVelocity templates and borrows a lot from Graffiti.  If you've ever created a Graffiti theme or written a Chalk extension, you'll see a lot of similarity with the new templating.  With the messages now, you actually generate the raw MIME messages.  MIME stands for Multipurpose Internet Mail Extensions and it is the standardized format of email messages.  By working with MIME directly, aided by a series of helpers, we are able to control aspects of the message in a fine grained manner.</p>

<p>First, in ability to control who we're emailing independent of the message headers.  With email, who the message shows in the To headers who it isn't necessarily sent to, such as with mailing lists.  Previously, Mail Gateway always sent the messages to the user, from the sender, and with the list as a special "Sender" header.  This is how messages showed up in Outlook as from the user "on behalf of" the list.  This type of set up didn't work well with all client, particularly the iPhone.  The iPhone would always reply to the user who sent the message, not the list.</p>

<p>Building on the last point, since we couldn't set who a message is to independent of the message, Telligent Community would have to generate a message for each person it was emailing.  So if a forum had 100 subscribers, when a new post is made, it would generate the email 100 times, queue 100 messages, and then send it out as 100 individual emails.  With the new handling, we can actually generate the message just once and have it go to everyone in one swoop.  Also, since mail servers often limit the number of recipients per message, we can take that message and configure it to allow 20 recipients per message.  So instead of sending 100 messages, we could safely get it down to just 5.</p>

<p>Additionally, the variety of messages can be greatly expanded.  It is now super easy to include an HTML and a plain text version of the body in the same message, then allow the email client to chose which one it will show based on its preferences.  Or we can generate both at once, and then chose which one gets sent out after wards depending on user preference.</p>

<p>With the old support, we didn't have the ability to support subsets of functionality like meeting requests.  Meeting requests are basically an attachment with the ical event, and special headers indicating a response is supported/expected.  With the built in functionality, Mail Gateway could read the attachment, but not handle or send it back out as a meeting request.  We still haven't added this functionality, but now the limitation from MailMessage is removed so we're one step closer.</p>

<p>And finally, the old templates were limiting with what was available within messages.  You only had a fixed set of tokens that could be used within the email, such as [SiteName], but it was really limiting in additional fields or field manipulation.  Do you want to change the format a post date is displayed in?  Want to only show a certain excerpt of the post body?  Want a field that wasn't available in the standard set?  These things would often require code changes before, but now with nVelocity templates, you actually get the Post object, not just the common post tokens.  Want to change the date format?  Just use $post.PostDate.ToShortDateString().  Want the post author's display name?  Use $post.User.DisplayName.</p>

<p>Aside from new functionality that is enabled, there are several benefits to what we already use emails for.</p>

<p>First, email templates themselves are greatly simplified.  You no longer have a gigantic XML file with all templates, they're now template-per-file.  Templates are no longer in XML, so you don't need to worry about escaping certain characters of using <br/> instead of <br> or using an amperstand (&) or other characters that need to be escaped in XML.  These minor things often confused users who didn't know about XML, or even seasoned developers who had a knee-jerk moment.</p>

<p>Second, when you need to do something more complicated, there are now some solid extensibility points.  This makes it much easier to integrate advanced functionality in a simple way.</p>

<p>More advanced pieces of email generation is now simpler to test.  With the extensibility, code is compartmentalized and easier to break down and test certain subsets.  Additionally, we also plan on making it easier to unit test specific email templates, to ensure the template is rendered without errors and with the right content.  I'll be covered the ways to extend the templating in upcoming posts.</p>

<p>Finally, for portions like forum notifications, the number of messages generated is reduced which helps to improve overall performance.</p>

<p>In the next post, will give an overview of ways to extend the functionality of the templates.</p>
         
