--- 
wordpress_id: 424
layout: post
title: "Trunks: Pricing plans and features"
wordpress_url: /code/trunks-pricing-plans-and-features/
---

<p>With every new online service, the question on everyone's mind is always &quot;what is it going to cost?&quot;  Or perhaps these days, &quot;how much will I get for free?&quot;  The &quot;freemium&quot; model has become very prevalent in online services, where you get a basic set of services for free and then pay for the really good stuff.</p>
<p>Trunks is a bootstrapped service on a small budget.  Trunks will run off hardware I already own, in datacenter space I already have space in.  No cloud wizardry here.  It is cheaper for me to shift around stuff I was already running to free up a few servers than to do anything else.</p>
<p>My goal with Trunks is to grow it organically (sweet, got in a buzz word).  As it grows, I want to ensure it is covering the costs it generates.  If it grows slowly, that is fine.  That would actually be better.  I'd love to see the hardware gradually grow in utilization than to have explosive growth and be beyond capacity.</p>
<p>In my view, there are two problems with the freemium model to where it won't fit with my goals.</p>
<p>First, conversion ratios are unknown.  At the time you launch your service, you have no idea what your conversation ratio will be, and thus your profitability and financial stability.  Good ratios are often considered to be 4% or greater.  Some companies get awesome conversion ratios.  But it can go very bad too.  You may end up with only 2%, 1%... or 0.  With my budget, I don't have the capital to risk on a bad conversion ratio.</p>
<p>Second, your paid users are carrying your free users.  A conversion ratio of around 5% is often considered good, but with that you have one paid user covering 19 free users.  The argument for freemium is that with most online services, the cost per user is so minimal that it doesn't matter.  But with hosted source control, I'm essentially selling storage which has a much more noticeable cost.  Storage is made up of capacity and throughput, and you can only have one of the other.  Throughput is definitely better since otherwise you'll get poor performance before you use all your capacity.</p>
<p>So where is all this leading?</p>
<p>Trunks will be a &quot;premium&quot; service.  When you sign up, you will get a 30 day trial.  At the end of the trial, you either upgrade to a paid plan or your repositories get locked.  If your account gets locked, the repositories won't be accessible, but will be kept around for a while in case you decide to come back.</p>
<p>The cost of a paid plan?  The entry level plan will be $20-30/year for 250mb storage.  Yes, you read that right if it sounds too low.  Since my target audience is individual developers, I wanted to keep it to a reasonable price.  Developers often love getting toys, but need to get spouse approval too.  Since everyone using the service beyond 30 days is paying, users are paying for themselves and not themselves and 19 others.  I can have a lower price while still maintaining a decent profit margin.  Additionally, I sell based on space.  You get 250mb, which will likely be acceptable for most.  If you need more space, then that is when you upgrade.</p>
<p>Other features will include:</p>
<ul>
    <li>Unlimited repositories</li>
    <li>Unlimited collaborators</li>
    <li>SSL Encryption</li>
    <li>Dual Remote Backups</li>
</ul>
<p>With collaborators, one thing that will be possible is for you to collaborate with others, where you can give them commit access to one of your repositories.  They don't need a paid account either.  After your trial period, if you don't pay for an account, you will be classified as a collaborator.  You can't have your own repositories, but you can still commit to other user's repositories that have been shared with you.</p>
<p>SSL Encryption is obvious: keep your communications secure.  The website is entirely over HTTPS.  SVN access is entirely over HTTPS.  And all mercurial and git access is over SSH.</p>
<p>The dual backups is where data is backed up to two offsite locations.  One site is backed up to with every commit, the other one is backed up to nightly, and maintains a history of repositories.</p>
         
