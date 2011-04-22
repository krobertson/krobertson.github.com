---
layout: post
title: Amazon and what it means to you
---

Unless you were under a rock, you probably heard about the major issues in Amazon's US-East region yesterday.  Needless to say, a lot businesses had a rough day yesterday.

One of the most interesting aspects of yesterday was realizing how big Amazon's reach is.  Numerous well known startups and businesses were down, but beyond that, services not even on Amazon themselves were affected.  We [moved off EC2](http://invalidlogic.com/2011/02/11/how-we-did-a-datacenter-migration-with-no-downtime/) back in December, however we integrate with APIs from several other services, including some that are running on EC2.  We still felt the impact and were closely watching Amazon tracking status.

The event lead to some interesting discussions though.

<div style="width: 100%; text-align: center; margin: 10px 0;"><a href="http://twitter.com/#!/rtomayko/status/61132582489817088"><img src="http://invalidlogic-blog.s3.amazonaws.com/2011-04-22-rtomayko-tweet.jpg" width="588" height="260" border="0" style="border: 0" /></a></div>
There has been a lot of blame going back and forth, with some leaning on the side of "you should have planned for it".  While it can be particularly harsh, in that most best practices for Amazon stressed leveraging multiple availability zones, while yesterday, it was nearly an entire region that was out.  There is an element of truth in the argument... *have a plan*.

Typically that is known as a Disaster Recovery plan.  They easy to be overlooked until you realize you need one.  They're always one of those "we should do that someday" or maybe even something a company doesn't think its big enough to need.

I am no expert on disaster recovery (and there are plenty of consultants out there to help build a professional one), but there are some pretty basic things you can look at to at least have *a plan* rather than *no plan*.  Some services recovered pretty well yesterday, albeit with partial functionality, but they got something back up.  Others realized they were at the mercy of another provider and were stuck until then.

There are some simple questions you can begin to answer for yourself for a simple plan:

**What data is important?**  Your service runs on code, but it is powered by data.  What data is it dependent on?  Image assets, file uploads, databases?

**Where does my data live, and how can I have it in multiple places?**  Take regular database backups and store them off site.  Keep a backup of assets.  It is important for them to be in more than one location since if that location disappears, you are SOL.

**How much data loss is acceptable?**  If stuff goes down, you may lose some data.  If you want to limit the loss, you need to keep fresher copies of data.  More frequent backups, perhaps a live DB slave hosted somewhere else.  You need to either accept that some data loss is acceptable, or architect so that you won't have any data loss.

**How fast can you provision servers and where?**  Geo distribution all the time can be expense and not necessary (unless you deem it is), but being able to have somewhere to quickly set up emergency servers is a major plus.  If you use AWS East, then maybe use AWS West for DR.  Make sure your account limits give you enough capacity, and have scripts and basic stuff in place and ready to be used.  We leverage Chef for all our systems, so we can quickly launch some new servers and get right to work configuring them pretty quickly.

**What is your order of priorities?**  A service is often comprised of many smaller components.  Know which ones are the highest priority.  Know which functionality without your app is most important.  You'll be racing against the clock and have only so many people.  This lets them focus their attention to help get core functionality up as quickly as possible.

**Do a fire drill.**  This is something I think we'll be doing pretty soon.  Out of the blue one day, do a mock fire drill.  You are down, your datacenter disappeared.  Get the service back up in an alternative place.  How long does it take you?  What were the pain points?  Beyond simply having a plan, you need to know the plan will work.

And lastly, **know your application**.  Know its requirements, constraints, and understand its bare minimums, most important pieces, etc.
