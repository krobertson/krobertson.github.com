--- 
wordpress_id: 467
layout: post
title: "Migrating datacenters: How to forward traffic"
wordpress_url: http://invalidlogic.com/?p=467
---
I have some of my own datacenter space with a couple of servers that I use for a little bit of hosting that I do.  This weekend, I'm finishing a migration and having done this type of thing a couple of times, thought I'd share a few tips.

First of all, one thing that is very nice to do, if you have a presence in both places at the same time, is to configure IP forwarding from your old site to your new site.  While it is a best practice to set the TTL on your DNS records really low (mine are currently 60 seconds), ISPs don't always honor the TTLs and some will be more aggressive with caching.  As a rule, its usually 8-24 hours before you can really count on old caches being expired.

To combat this, forwarding any traffic that might be going to the old addresses to the new ones can be very helpful, and fairly easy to do.

There can be several ways to do this, but can often times end up more complicated.  The pure and simple way to do it is to use an application called <a href="http://www.boutell.com/rinetd/">rinetd</a>, which is basically an "internet redirection server".  You simple edit its configuration file, specify the old IP address and port, and the new IP address and port.  Run it and you're good!

I run ESXi on some of my systems, so I simply created a new virtual machine with a very basic configuration and installed Ubuntu on it.  I gave it a base IP that I wasn't going to be forwarding, installed SSH on it (to remotely manage it), and then went to town setting up what I needed forwarded.  First, I added the IPs to be forwarded as aliases in /etc/network/interfaces:

{% highlight text %}
auto eth0:0
iface eth0:0 inet static
     address 192.168.1.111
     netmask 255.255.255.0
{% endhighlight %}

Now, I need rinetd.  On Ubuntu, it is readily available as a package, so just run <tt>sudo apt-get install rinetd</tt> and you're set.  Edit the /etc/rinetd.conf to list out how you want things forwarded:

{% highlight text %}
# old ip         old port    new ip          new port
192.168.1.111    80          172.16.1.222    80
{% endhighlight %}

Afterwards, all you need to do is restart networking and rinetd.  So run <tt>sudo /etc/init.d/networking restart</tt> and <tt>sudo /etc/init.d/rinetd restart</tt>.

Few things worth noting.  rinetd binds to the address/port you specify, so if you are trying to forward port 80, you can't have something else bound to port 80 on that IP, such as a webserver.  So if you need to forward something that you might have in use, you may have to tweak things.  If you need to forward SSH, it might be best to configure SSH to use another port for a little while.  Second, I'd sometimes just reboot the virtual machine instead of restarting networking.  I'd migrate some stuff one night and have it forward for 24 hours, then next night migrate something else and have it forwarded.  It'd sometimes get a little hairy adding/removing/reconfiguring aliases a lot, so I'd just reboot.

Another plus with rinetd is that a port of it exists for Windows!  A download exists on <a href="http://www.boutell.com/rinetd/">its site</a> and it is also possible to configure it as a Windows service using <a href="http://serviceex.com/">ServiceEx</a>.  I haven't tried it myself, but I did find some pretty <a href="http://blog.ehuna.org/2009/10/an_easier_way_to_access_the_wi.html">detailed instructions</a> about configuring it on Windows.
