--- 
wordpress_id: 199
layout: post
title: Qgyen.AllCommentRss with Spam Filtering
wordpress_url: /archive/qgyen-allcommentrss-with-spam-filtering/
---

<h3>Qgyen.AllCommentRss v1.0.60918</h3>  <p>A while ago, I had <a href="http://qgyen.net/archive/2006/08/04/Qgyen.AllCommentRss-for-CS-v2.1-RC1.aspx">released</a> my module to add an RSS feed for comments across an entire blog, geared for blog owners.&nbsp; One of the frequently requested enhancements was for it to support filtering out of spam comments.&nbsp; Lots of people have been getting a ton of spam, and the spam rules within CS can be a huge help in tackling them, but they would still pollute the owner&#39;s comment RSS feed, keeping them from just seeing the actual comments made by their adorning audience.</p><p>So, over the weekend, I had some spare time and added in support for filtering spam from the comment RSS feed.&nbsp; The feed link included on the review comments page will now match the currently selected spam filter.&nbsp; So if the list of comments you are viewing is filtered to Not Spam, the feed link will be the Not Spam filtered feed.&nbsp; Also, any existing feed URL that doesn&#39;t include the spam filter segment will default to the Not Spam feed.</p><p>Total list of changes in this version:</p><ul><li>Added spam filtering</li><li>Reworked in-feed commands (moderate/approve and delete) to work through the exist comments page, rather than by the feed&#39;s handler.&nbsp; A little bit cleaner, less duplicate code, and like the security around it more.</li><li>Fixed possible cache issue with using the feed across many blogs.<br /></li></ul><p><strong><a href="http://qgyen.net/r.ashx?6">Download</a></strong> <em>(Requires on Community Server v2.1)</em></p>
         
