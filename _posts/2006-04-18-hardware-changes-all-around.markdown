--- 
wordpress_id: 135
layout: post
title: Hardware changes all around
wordpress_url: /archive/hardware-changes-all-around/
---

<p>Lately, I have been making a number of hardware changes around the house...</p>

<p>First up, I am no longer using the Toshiba m200 tablet and I am back to my old Thinkpad T40.  After a while, I realized I was hardly using it in tablet mode.  I almost had to force myself to use it in tablet mode, and most of the time, it was just for reading my RSS feeds and what not.  About the same time, the backlight on my wife's old old old Toshiba laptop burnt out, so she is now using the tablet like we had originally planned, but didn't plan on her backlight giving out.</p>

<p>I haven't yet set the tablet up for her to take to school, since it still has things like Visual Studio, SQL Server, and other stuff she doesn't need on it.  Plus, I need to get all her documents off of her old machine still.</p>

<p>As for myself and getting a tablet, going to pass.  I am glad to be back to the larger screen of my Thinkpad, and my wife likes the m200 with the font size turned up.</p>

<p>[photo:1636]</p>

<p>Next, made some changes to the network here.  Got rid of my old Netgear ProSafe VPN/Router (since it occassionally would give up) and my old Netgear 802.11g access point (which simply sucked) and upgraded to something a little more reliable and robust.  After listening to <a href="http://www.hanselminutes.com/">Hanselminutes</a> <a href="http://www.hanselminutes.com/default.aspx?showID=7">podcast on the Linksys WRT54GL</a>, I decided it might be a nice upgrade.  So went out and got one and put <a href="http://www.dd-wrt.com/dd-wrtv2/index.php">DD-WRT</a> on it and have been quite happy.  Having it be the router, DHCP server, access point (using WPA2), and VPN server.  Definitely very nice... especially with the VPN server, so that I can get on the network when I'm not home.  Also upgraded to gigabit with the <a href="http://www.linksys.com/servlet/Satellite?c=L_Product_C2&amp;childpagename=US%2FLayout&amp;cid=1115416906341&amp;pagename=Linksys%2FCommon%2FVisitorWrapper">Linksys EG008W</a> 8-port gigabit switch.  Gigabit is definitely very nice, especially with some of the other changes I'm making (see below).</p>

<p>[photo:1637]</p>

<p>I recently stopped colocating my own server and instead I'm now hosting with one of my coworkers, <a href="http://eduncan911.com/default.aspx">Eric</a>.  He has a beast of a machine colocated at <a href="http://datapipe.com">DataPipe</a> (probably amung one of the best) and runs a small hosting business.  Network speeds are a little better than before, and pings are definitely lower.  My server was so underutilized, and I wasn't ready to invest into all the software I'd need to sell hosting space on the right way.  So I picked up the server last time I was down in San Jose and have it sitting around here for now.  Set it up with Windows Server 2003 R2 the other day for the heck of it (was running Small Business Server 2003 before).  Probably going to be throwing it up on Ebay, but not looking forward to it as it may not sell right away, and shipping will be a PITA.  Hate to get rid of it, since it is a beauty, but better than collecting dust.</p>

<p>[photo:1638]</p>

<p>And finally, my new pride and joy.  I'll be posting more about this box shortly, but it is my new test environment.  It is a dual Opteron 246, 4gigs of RAM, and 2x 250gb in RAID1 on an Intel SRCS14L PCI-X SATA RAID card, running <a href="http://www.vmware.com/products/esx/">VMware ESX Server</a>.  Basically, a pure virtual machine operating system.  Instead of something like Microsoft's Virtual Server, which runs on a separate host operating system, with ESX Server, the host operating system is basically built in.  It is essentially a modified Linux install, but the virtualization is integrated at the kernel level and it separates the resources from the host OS.  I'll post some more on this in the next couple of days, once I get all my virtual machines built up.  But it works quite nice... can run and entire network all on this one box.</p>
         
