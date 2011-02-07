--- 
layout: post
title: How to do a datacenter migration with no downtime
---

Last week, saw a blog post by New Relic about their datacenter migration and felt inclined to do my own personal one about our own.  Aside from the title, not to show them up in any way (we love New Relic and use it quite extensively, and they have far more data than us), but we were very pleased with how our move happened and I thought others might like reading about it too.

Starting in October, we at Involver decided to take on a project migrate our entire infrasture off of Amazon EC2.  AWS had served us well, however there comes a point where the limitations of some of their services were coming a bottleneck.  The bottlenecks and how we've resolved them in our migration is a big enough topic for a follow up post.

After two months of evaluating providers, doing benchmarks on some test systems, and some major refactoring of our operations management and application code, we flipped the switch the night of December 23rd.  We did an entire datacenter migration with no user downtime.  Even more, we didn't even have all of our production systems until that morning.

So how did we pull it off?

It boils down to an excellent team, delicate planning, and an awesome toolset.  Our operations team is only 3 people, but we manage what is now 8 environments where our code lives and about 100 systems.

Everything in our environment is fully configured with chef.  With the migration, we refactored a lot of our recipes put a strong emphasis on everything in chef.  Each system was provisioned, cooked and recipes tweaked, then destroyed, reprovisioned, and recooked.  Repeated until it was ready to go right after cooking.

Our production database servers were the first to get set up on the production side.  We'd already validated all our chef recipes for both our MySQL and our MongoDB clusters on our staging environment beforehand.  With MySQL, we run a master-master setup with multiple read-only slaves.  We cooked each of the boxes and configured all of the slaves to point to what would be the new master.  We made a change to ensure that the new master and the EC2 master had different auto-increment offset and we also ensured log_slave_updates was enabled.  We then imported a backup of our production database onto the new master.  It automatically replicated out to the passive master and read-only slaves.  We then set it up so our new master would replicate from our EC2 master.

With this configuration, writes would be coming in on our EC2 master, get replicated to the new master, and since it has log_slave_updates on, those changes would then replicate our to the other database servers.  This also enabled us to switch over the site and easily allow writes to start coming in to the new environment.  If there were some lagging requests to the old site, they would replicate to the new environment without any collisions.  We also documented the position of the new master when the switch happened, so if we needed to revert, we could potentially set the EC2 master to replicate from the other master any writes it might have received.

The MongoDB databases were migrated in a different fashion.  We were moving from a single replica set configuration to a sharded setup with two replica sets.  Because of this, we could do the same early replication process we did with MySQL.  Mongo is primarily used for our analytics data, so with it, there is a primary collection that is most important and then others used for the calculations.  We cooked the database servers ahead of time and got the sharding configuration and everything fully setup before hand.  Then the data migration was scripted out so that with a quick command, we would pull the most important data over first by exporting the data, transferring it, then importing it.  This way, it was migrated and sharded at the same time and fully automated.

The morning of the 23rd, we came in, having just had the bulk of our production virtualization cluster setup the night before (thanks for the delay Dell).  This is where the awesomeness of chef and our team truly shined.  We set to work and provisioned all of the production systems, cooked them, set them up in load balancing, verified security rules, and completed some of the final code tweaks and testing.  We didn't even deploy our final monitoring systems until that morning.   We did a few test deploys, verified all the parts of the app would come up, and that monitoring on them was accurate.  

Finally, around 10:45pm, we made the switch.  The actual cut off boiled down to just a DNS change.  TTLs had been changed to 60 seconds weeks earlier.

Right after we made the DNS change, we also removed all of our old app servers from ELB except for two.  We turned nginx off on those two and turned on [rinetd](/2010/02/12/migrating-datacenters-how-to-forward-traffic), which was already configured to forward any traffic to port 80 or 443 to our new environment.

The benefits of the migration were almost instantly visible.  Noah, our CTO, was in the office with us to do acceptance testing right afterward.  We made the switch, verified DNS had updated, and when he loaded the first page, his first reaction was "Holy shit... this is so much faster!"  That there was all the validation we needed for the 2 months of work we had put in.
