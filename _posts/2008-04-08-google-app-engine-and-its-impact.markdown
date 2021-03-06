--- 
wordpress_id: 374
layout: post
title: Google App Engine and its impact
wordpress_url: /technology/google-app-engine-and-its-impact/
---

<p>I've been doing some reading about Google's announcement of their "App Engine" platform for hosting scalable applications.  Some of the reactions so far are pretty interesting.  Partially of note, I see a number of places saying it will be the "Amazon killer", or "hosting killer", and even that it is "Geocities 2.0".  In my opinion, all of them are wrong.</p>

<p>Google isn't going to kill anything.  The hosting market is very vast, with diverse offerings, new consumers every day, and players always coming and going.  They'll add a new dynamic for sure, but they'll be perfect for some, and won't be a good fit for others.</p>

<p>Easy scalability is now an issue.  Up until recently, sites that needed to scale usually followed this (or a similar route): come up with idea, start site, begins to catch on, get VC (or money from somewhere), build (or pay someone for) a scalable infrastructure.  Now, a super small (even single developer) can build an application that goes from zero to hero in mere weeks, especially with the advent of sites like Facebook.</p> 

<p><b>Google vs. Hosting Companies</b></p>

<p>Google's target is different than your average hosting company.  Google's specifically called out they're targeting developers and scalable web applications.  At your regular $3.95/mo hosting company like <a href="http://www.godaddy.com/">GoDaddy</a>, <a href="http://www.dreamhost.com/">Dreamhost</a>, or other small companies, this isn't something their customers are after.  Sure, Google has some nice offerings for free, but many of them are not developers with those kind of needs.  Many of the customers aren't developers, or have more generic needs like wanting a small site, blog, forum, etc.  Google could make it easier for them to deploy, but I don't foresee Google targeting this.  Common hosting is often high support and low profit.  They don't really need BigTable, cloud computing, or anything like that.</p>

<p>Then there are your larger scale hosts who do big deployments, managed support, etc.  Places like <a href="http://www.rackspace.com/">Rackspace</a>, <a href="http://orcsweb.com/">OrcsWeb</a>, <a href="http://engineyard.com/">Engine Yard</a>, or <a href="http://bitpusher.com/">BitPusher</a> (the main ones I know of).  Often times the people who go to them are larger scale sites who might benefit from what Google offers, but they could also be turned off by the restrictions or need functionality outside of them.  Some of the constraints like no direct disk access, no background processing, locked into BigTable/GQL, etc., could be too much.  Google understandably places restrictions, since that is how they will offer the cloud they are, but any time you place a restriction, you eliminate some people who can use it.  It is a game of give and take.  High end managed hosting will still thrive.  Often, their biggest asset is the level of personal support they can offer, especially when they do targeted expertise (OrcsWeb does Windows, Engine Yard primarily does Ruby).  I don't see Google being able to match that.</p>

<p><b>Google vs. Amazon</b></p>

<p>Some people have said Google App Engine could kill Amazon EC2/SimpleDB/etc, but the reality is they focus on different markets.  There is some cross over, both have their own restrictions, but one fills needs the other can't.  Google is only web apps and specifically says they aren't offering virtual machines or grid computing.  Amazon offers virtual machines and can do web app hosting, but does have restrictions on guaranteed availability and storage.  Google promises simple web apps, Amazon doesn't, but you get a full system with Amazon.  Companies that need background processing will definitely still use Amazon, and that likely represents a good portion of their usage.  Companies like <a href="http://www.smugmug.com/">SmugMug</a> offload a lot of their image processing to EC2, and something like that could not be solved by GAE.  With Amazon's recent availability zones and elastic IPs, it is certainly possible to have high availability web apps.  Google is more technically restrictive, while Amazon has a higher technical barrier.  Additionally, Amazon is more diverse, with EC2, S3, Simple DB, and SQS.  They can be used together, or separate.</p>

<p>Someone in a blog comment claimed uptime with Google would be better, but that is pure speculation.  All systems fail, in one way or another.  Making uptime claims for GAE when it is out less than 24 hours is very optimistic.  EC2 has its issues, but Amazon makes that clear, and well designed systems on EC2 should adapt just fine.  GAE will almost certainly, at one point or another, have an issue, degraded performance, momentary outage, etc.</p>

<p><b>On going impact</b></p>

<p>Probably the most powerful offering with GAE that hopefully develops further is their database.  Scaling the database is often the biggest issue for large sites.  The web tier almost never the bottle neck, but the database.  Scaling a database can be very costly, especially with traditional RDBMs.  In the future, we'll likely see much more with BigTable and products targeting distributed scalable databases made easy.  Microsoft recently announce <a href="http://www.microsoft.com/sql/dataservices/default.mspx">SQL Server Data Services</a>, but I expect much more to be coming.</p>

<p>There will likely be other "cloud computing" offerings coming from others.  Some speculate Microsoft will be, others have thought HP.  I think there will still be more to come.</p>
         
