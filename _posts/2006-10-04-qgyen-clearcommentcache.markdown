--- 
wordpress_id: 208
layout: post
title: Qgyen.ClearCommentCache
wordpress_url: /archive/qgyen-clearcommentcache/
---

<p>Recently, I had an idea for a new CSModule that would make it so that comments to blog posts would show up immediately after being posted, instead of having to wait for the cache to be cleared.&nbsp; As such, my new ClearCommentCache module was born.</p> <p>This module does not prevent the caching of comments in any way.&nbsp; It simply waits for a new comment or trackback to made, and after it is submitted, it will clear the current cache of modules, so that on the next request, it will go to the database and get a fresh list.</p> <p>A few other little things it does includes:</p> <ul> <li>Will only clear the cache when the comment passes spam filters</li> <li>Will allow you to configure it to clear the cache across all posts, or only certain posts</li> <li>Use a [ ClearCommentCache ]&nbsp;text part (no spaces around the [ ]) will cause the cache to be cleared on new comments for that particular post.&nbsp; It will also strip the text part from the message so it doesn&#39;t show.</li></ul> <p>Yes, the module is being used on this post (though only this post, not across my whole site).</p> <p><a href="http://qgyen.net/r.ashx?7"><strong>Download</strong></a> <em>(Requires Community Server v2.1)</em></p>
         
