--- 
wordpress_id: 355
layout: post
title: When documentation is a wee bit off
wordpress_url: /software/when-documentation-is-a-wee-bit-off/
---

<p>Humans are never perfect, and since humans write documentation, it isn't always 100% accurate.</p>

<p>Take the documentation on MSDN regarding <a href="http://msdn2.microsoft.com/en-us/library/0ka9477y.aspx">Managed Thread Pools</a>, in the "Maximum Number of Thread Pool Threads" section (emphasis mine):</p>

<p><blockquote>The number of operations that can be queued to the thread pool is limited only by available memory; however, the thread pool limits the number of threads that can be active in the process simultaneously. By default, the limit is <b>25 worker threads per CPU</b> and 1,000 I/O completion thread.</blockquote></p>

<p>25 threads per CPU?  Not bad, pretty good.  Except it is a little bit off.  In fact, it is missing a 0.  Yes, it isn't 25 threads per CPU, it is 250 threads per CPU.  An error of 10 fold.</p>

<p>This has reared its head a few times with the Community Server add-on Mail Gateway.  It makes use of the thread pool to process email messages as they come in and send them to the CS site.  One problem was that when there is a backlog of messages, it can hammer the site quite a bit.  If you have some issues connecting to the mail server, or configuration issues, etc, and messages build up in the mailbox (ie, couple thousand, or some clients 50k+ messages), then when things get resolved, it tries to process the whole back log, but ends up hitting the site so hard it will fail processing messages and continue to retry them, making it work through the messages very slowly.</p>

<p>When Mail Gateway was written, I had read about the "25 threads per CPU" and figured CS could surely handle a maxed out thread pool no problem... essentially 25 users on a site?  That's not bad.  And if they had a dual CPU machine, thats 50... that's maybe pushing it, but still should work ok.</p>

<p>However, we first starting using the managed thread pool like 2 years ago.  Since then, we've seen a major change with multi-core machines.</p>

<p>So now, look at the issue of hammer a site with Mail Gateway.  250 threads?  All hammering on a site?  Ohh yeah, I could see that one causing a problem.  But what if the client has a multi-core machine?  Say it is a dual quad-core CPU box... you're looking at 8 CPUs as far as it is concerned.  You're talking 2,000 threads.  Think 2,000 messages being submitted concurrently to a site would bring it to its knees?  Yeah, I think so.</p>

<p>The 25 vs 250 thing is pretty big, especially when you take into account the "per CPU" bit.</p>

<p>So the solution?  Override the number of threads available by specifying it in the application on start up using <a href="http://msdn2.microsoft.com/en-us/library/system.threading.threadpool.setmaxthreads.aspx">ThreadPool.SetMaxThreads()</a>.  This way, we can also avoid the scaling per CPU issue as well... we don't want to send more messages because there is another CPU, we want a fixed number.  .NET 1.1 (when we originally wrote the code) didn't have a method available to set the number of threads, but with .NET 2.0, we now can.  Expect an updated build of the Mail Gateway service soon with the change.  It will now default to only 15 threads, but can be configurable in the mailgateway.config file.</p>
         
