---
layout: post
title: Transparency and status
---

One thing that I think can really be highlighted from the recent AWS issues is the value of a status dashboard for your platform/service..  However, simply having one isn't quite enough.  Plenty of services already do.  What really matters is how effectively it is used.

Just think why a customer would be coming to your status dashboard and what they'd be looking for.  If they're coming to it, it is likely because they're having a problem.  What they'd be looking for is confirmation that the company is aware of the issue and a rough idea of when it would be fixed.

This sounds quite simple and plainly put, however rarely done.  I don't know if its some management/PR intervention of not wanting to sound unstable or unreliable, or if it is just that level of transparency isn't encouraged/practiced at these companies, but simple information often never makes it public, or seems to after the fact.

<div style="float:right; margin-top: 5px; margin-left: 10px; margin-bottom: 5px"><a href="http://invalidlogic-blog.s3.amazonaws.com/2011-04-28-aws-large.png"><img src="http://invalidlogic-blog.s3.amazonaws.com/2011-04-28-aws-small.jpg" width="68" height="400" title="holy cow that sucker's long" border="0" style="border: 0" /></a></div>
One our major gripes with Amazon when we were hosted with them was how we'd become aware of an issue, but in some cases it would be hours before an *acknowledgment* of it went onto the status dashboard.  The 1am EBS outage of last week has repeated itself before, and interestingly around 1am several times.  It affected Reddit just a month or so ago, and it affected us back in October.  One of our other guys was up at 1am, aware immediately of the EBS issue since it was impacting our master database server.  It took Amazon *two and a half hours* to post about it on their status site, even stating it began the same time we were paged.

An additional aspect often missed is the value of the post-mortem.  When you have a major issue, customers lose confidence.  The post-mortem is a chance to try and gain some of that back.  It doesn't need to divulge every single detail and shouldn't look at it as an embarrassment.  When I think of a post-mortem, I look for 3 things: what happened, why it happened, and how it won't happen again.  It can very effective at reassuring users if you can clearly show that you understand what went wrong and have a solid plan to ensure it won't happen again.  Glossing over the chance by simply saying "we've fixed *it*" (without saying what *it* is, in some fashion) can simply detract users even more.

Example of a post-mortem done wrong?  Look at [Tumblr's downtime in December](http://staff.tumblr.com/post/2127872280/downtime) or their [security leak in March](http://staff.tumblr.com/post/3959106211/update-regarding-security-issue).  Look at the majority of AWS issues.  Typically, they don't do them.  They only do them when they [majorly](http://aws.amazon.com/message/65648/) [screw up](http://status.aws.amazon.com/s3-20080720.html).  And when they do, there is an air of "architect for us" attitude.

Here are a few quick things that would make any status dashboard serve its purpose well.

* Update early, update often.
* Don't downplay the severity.
* Give ETAs on resolutions.
* Be very generous with ETAs (go worst case).
* Choose a good layout!  Look at the image to the side for Amazon's site during their issue.

Above all though, look at the status site from the perspective of their users.  Think about why they would come there and what information they're looking for.