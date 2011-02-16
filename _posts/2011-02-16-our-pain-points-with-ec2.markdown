---
layout: post
title: Our pain points with EC2 and how our moved solved them
---

As I mentioned in my last post, we made the move off of EC2 in December to our own cluster of machines.

While EC2 had served us very well and helped get our systems to the
place they are today, we started reaching a point where we were
running into three main bottlenecks with the EC2 ecosystem and we couldn't find any way around them.

Will start off by saying the AWS is an awesome service and we couldn't
have grown to the level we are at today without them.  Amazon should
be a easy contender for any service just starting out.  Some of the
services they provide, especially things like Elastic Load Balancer
(ELB) and Elastic Block Storage (EBS) are services that are simple to
start using, help tremendously as you grow, and simply aren't common
with traditional VPS hosting.

However, here are some of the bottlenecks we faced and how we've
solved them in our new setup.

### IO Performance

Anyone who is doing anything intensive on EC2 will tell you that IO
performance is horrendous.  We were battling EBS constantly on our
database servers and had serious questions how we could continue to
operate yet alone scale our DBs while in the cloud.  We met with AWS engineers to review our configurations, but
were already doing all the best practices.  We had tuned MySQL
configuration as much
as we could, had the "high-memory" instances and higher IO priority
and newer CPUs,
and were running 4 EBS volumes in RAID10.

They tried to push Amazon RDS, however RDS is simply EC2 and EBS with
the same best practices.  While it might be slightly better, it wasn't going to
totally solve our problems.

The biggest issue was IO latency.  We had database servers where it
was normal for them to average 20-30% IO wait.  We frequently had
spikes upwards of 60% to sometimes 90%.

And it wasn't always disk performance, but IO as a whole.  We would at times provision a
new database server that would simply struggle to stay fully
replicated with no query load on it.  Either struggling with IO
latency, or sometimes even keeping a connection up to the master.

There is unfortunately no solution.  Everything in AWS is a shared
resource.  With that comes variable performance and bad spikes due to
hot-spots.  It is difficult to predict or ensure consistent
expectations.

### Support

At one point, we encountered an issue where we were seeing extreme IO
latency on our EBS volumes on our master MySQL DB server.  One of our
other ops guys was up for several hours in the middle of the night,
along with our CTO and Director of Product.  Unfortunately it was an
EBS issue throughout the entire zone and we had a large footprint in
that zone, including our master database server.

The biggest thing we took issue with was that it was almost 3 hours
before it actually made it to Amazon's status dashboard.

After that incident, we started looking at Amazon's Premium support,
however the support packages are really quite weak when you dig into
them.

First of all, Premium is a straight 20% added to your bill.  You can't
select it per instance or anything.  We didn't care about premium
support on our staging systems, so we'd have to move those to another
account if we signed up.

But the big thing... you get 24/7 phone support and a 1 hour
acknowledgement SLA.  Meaning they'll confirm you are having an issue
within 1 hour.  However, resolution is another thing.  Because
everything in AWS are shared resources, they can't offer any sort of
priority resolution at all.

So that EBS latency issue?  It took 3 hours to make their status
dashboard, and a total of 11 hour from when we noticed it to them
posting it was totally resolved.  

Paying for Premium support wouldn't have helped much.  It would still
be fixed for us at the same time.  At telling the CTO/Director "AWS
has acknowledged it, it'll be fixed when its fixed" isn't the type of
message we like to deliver.

### Scaling Costs

Amazon is great for services just starting out.  It is simple pay-as-you-go, you get availability of a lot of nice functionality with S3,
Elastic Load Balancer, and others, and it is quick to get bigger instances
as you grow and need more.

However there comes a threshold where the costs start growing more
quickly than your scale.

Want support?  Bam, extra 10%-20%.

IO bottlenecks?  Amazon's answer is to use bigger instances (higher IO
priority) and spread the load across multiple instances.  Both of those mean
more money.

Once you start reaching bottlenecks, the only answer within AWS is to
work around them, and that usually means more costs.

Additionally, since it is so easy to provision new systems, it is easy
to get carried away without realizing how much the changes are costing you.

### Insight

This is actually a bottleneck we didn't really realize until after we
moved.  It is amazing how little insight you have into your
architecture until you have full control over it.

For instance, on the new setup we had nice zone separation between
systems and were seeing massive spikes in concurrent connections
through the firewall, 3x more than we expected.  They all ended up
being DNS traffic.  Since it was UDP, the "connection" count was
skewed, but we hadn't realized how much DNS traffic we generated.  In
AWS, we couldn't monitor low level traffic metrics in the same way,
track our aggregate DNS traffic, or anything.

### Our Solutions

Our solutions to all of these were actually quite simple and are a
nice blend between old school architecture and modern pragmatism.

Nowadays, you start to hear all this stuff about "private clouds".
First of all, drop the bullshit.  "Cloud" is slapped on anything it
can be these days.  There is nothing new to the concept of "private clouds".

All it is is a virtualization cluster on equipment dedicated to you.
Its been around for 10+ years.  Clouds caught on because they were
simple to get started with and great at the small scale.  Now its just
a marketing buzzword.

Our approach was simple.  We separated our environment out into a
hybrid of dedicated systems for some things, and a large SAN backed
virtualization cluster for everything else.

#### Databases

Dedicated hardware is the perfect solution for IO intensive
workloads.  With this, we could actually specify what we wanted.
Types of disks, RAID configuration, capacity, etc.  We could go as
simple as RAID 10, up to SSD or even FusionIO.

We moved all our MySQL and MongoDB systems to dedicated hardware, each
built to their own needs and planned ahead for a certain timeline.  We
then looked at several growth metrics.  For instance, MySQL would
likely need more CPU or disk capacity in the future.  MongoDB would
likely need more RAM in the future.

#### Virtualization

Almost everything else was virtualization.  We got several very big,
bulky virtualization systems.  12 cores, 24 threads, 128gb RAM, ohh
yeah.  However we slice and dice it is up to us.  We have everything
configured for full failover of the base chassis.

At the SAN level, we left that up to the guys at Network Redux.  They
monitor the workload levels and plan for it accordingly.  The IO
doesn't scale infinitely, but rather we try to maintain an average
expectation so that growth is predictable.

#### Support

Support is probably one the biggest and most dramatic changes.  AWS is
a complete black box.  Now, we have two people dedicated to our
account, as well as a 24 support desk we can call and have a tech pull
up all the details on our account.  We have the cellphone numbers of
the people dedicated to our account.  We have yet to call them at 2am,
however having it is more than we ever had with Amazon.

We now have people proactively working to help us.  If IO load is
growing on the SAN, they reach out to us ahead of time, before it
becomes a problem on our end.

If a hardware node throws an alert, they get paged at the same time
and will hop online to help us to investigate.

This is probably one of the biggest pros and our new provider, [Network Redux](http://networkredux.com/) has been truly awesome in that regard.  They are proactive, we deal with the same people over time so they are familiar with our deployment, our change history, etc.

#### Costs

Costs though... surely all this raw hardware goodness, scalable IO,
and choice in your deployment costs a whole lot extra, doesn't it?
Not so.  You might actually be surprised how much cheaper it is.  I
can't give numbers, but I will say it was _significant_ and after the
move one of the main bullet points added by the CFO was _how much_
cheaper it was.

To make the CFO even happier, we had planned ahead for growth, where
we could handle spikes and add some additional systems without extra
costs, and had solid figured on how much the costs would increase.
"When we need more capacity here, the next step is X, and the cost
will be $Y."  As more time goes on, we're getting better at predicting
when the growth will be needed, and showing the benefits.

### Conclusions

Overall, Amazon is great service.  Don't get me wrong.  It is truly
excellent for companies/services just starting out and has an awesome
growth path for scaling early on.

However nothing scales infinitely.  Not your applications, and not the
benefits of a service like AWS.

Once you each a certain threshold, you benefit more from full control
over your environment and you get to the point where it is actually
cheaper than the cookie cutter services AWS provides.  Where that
threshold is depends on each case.  But it is important to know where
it is, even if you aren't there yet.

For us, we improved our performance several times over, have more
control than ever, and did it all while actually saving money.
