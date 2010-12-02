--- 
wordpress_id: 407
layout: post
title: XenServer now free, but what's its future?
wordpress_url: /technology/xenserver-now-free-but-what-s-its-future/
---

<p>A while ago, I'd read a prediction about <a href="http://www.brianmadden.com/blogs/brianmadden/archive/2008/06/30/prediction-citrix-will-drop-the-open-source-xen-hypervisor-for-hyper-v-the-rest-of-the-open-source-world-drops-xen-for-kvm.aspx">Citrix eventually dropping the Xen hypervisor</a>.  The article and site mostly focus on aspects of XenApp and VMware's VDI.  The prediction was that Citrix drop Xen in favor of Hyper-V and focus more on tools, saying they're selling the tools already, not the hypervisor.  Today, it looks like that prediction may be on its way to becoming true.</p>

<p>Today, <a href="http://community.citrix.com/blogs/citrite/simoncr/2009/02/23/Free%2C+as+in+Virtual+Infrastructure">Citrix announced</a> that XenServer will now be free, and that Citrix is now focusing on building tools... but not just for Xen, but also for Hyper-V.</p>

<p>Additionally, today <a href="http://www.internetnews.com/software/article.php/3806136/Red+Hat+Lays+Out+Its+Virtualization+Play.htm">RedHat unveiled</a> some of its virtualization plans.  They have some big plans for its acquisition of <a href="http://qumranet.com/">Qumranet</a>, developers of KVM (Kernel Virtual Machine), last September.  Its plans include in elimination of Xen and migration to being a strong contender with KVM.</p>

<p>It looks like 2009 will be a pretty big year for virtualization.  In reading online, a lot of general opinion is that for open source server virtualization, people will be dropping Xen in favor of KVM.  When RedHat acquired Qumranet, their intent was obvious.  Since then, Fedora has also dropped Xen from its standard support, as well as Ubuntu 8.10, which seems to be focusing on KVM now as well.  If the major distros are dropping mainline Xen support, and Citrix is making XenSource free, what will drive innovation with Xen?  Citrix will be focusing on tools.  They can let Microsoft innovate on Hyper-V and then they just need to do the tools.  One of the main confidence boosters for people is that KVM is already in the Linux kernel, making almost all distributions instantly compatible, while Xen has struggled to get into the kernel.</p>

<p>A few weeks ago, I'd installed <a href="http://pve.proxmox.com/">Proxmox Virtual Environment</a> and was quite impressed with it.  Proxmox is a free packaged system that supports KVM virtualization.  I didn't really benchmark its Windows guest performance, but it fired up and ran quite smoothly.  Had virtual environment installed and running VMs in only 15 minutes.</p>

<p>For me, I'm somewhat unsure about the Xen vs KVM debate.  XenServer is fairly nice and has a rich API to go along with it and a pretty decent management app.  KVM is less mature, but gaining a lot of momentum.  Virtualization is a market I'm always interested in and like to dabble with each release that comes out of VMware, Citrix, and Microsoft, though KVM is certain catching my eye.</p>
         
