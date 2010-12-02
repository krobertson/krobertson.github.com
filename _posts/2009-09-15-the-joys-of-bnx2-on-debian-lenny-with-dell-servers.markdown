--- 
wordpress_id: 418
layout: post
title: The joys of bnx2 on Debian Lenny with Dell servers
wordpress_url: /technology/the-joys-of-bnx2-on-debian-lenny-with-dell-servers/
---

<p>Last weekend, I was working on reinstalling Debian Lenny on one of my servers when I want into the same issue I've encountered time and time again.  I have a couple of Dell PowerEdge 1950s which use Broadcom network cards, and the Broadcom firmware is classified as non-free by Debian and not included on the network install CD (maybe others, thats the only one I use).  For some reason, Ubuntu includes the drivers, but Debian doesn't.  My eye-rolling aside, in this case I preferred Debian over Ubuntu.</p>

<p>Now the problem... I'm about 45 minutes away from my servers.  On all my own servers, one thing I had decided is an absolute must to have the remote management cards (DRAC5 in my 1950s) which supports remote console and virtual media.  This is awesome for remotely reinstalling an operating system, but not so good when it asks you for an additional driver by removable media... and of course, when it is your network card driver.</p>

<p>I don't quite recall how I got through it last time, though it involved a fair amount of coursing, particularly because the installer asks for the .fw file when it really just wants the .deb.</p>

<p>This time around, I found a <a href="http://docs.cellblue.nl/2009/04/10/getting-the-bnx2-driver-to-work-with-debian-lenny/">nicely prepared ISO with the deb on it</a>, however the DRAC only support one virtual CDROM, and it didn't seem to find it if I unmounted the installation media and mounted the ISO with the deb on it.</p>

<p>There was also some information about <a href="http://www.ducea.com/2009/03/02/debian-lenny-pxe-installation-on-dell-poweredge-19502950-servers-bnx2-annoyances/">PXE booting with the driver</a>, but that sounded like an overly complicated solution.</p>

<p>My route?  If it can't find it on the virtual cdrom, try the virtual floppy!  The deb is only 102kb, so just fire up <a href="http://magiciso.com/">Magic ISO</a>, create a new floppy image, copy it in, and save it.  Mount it to the virtual floppy and problem solved.</p>

<p>Encounter the same issue?  <a href="http://invalidlogic.com/files/downloads/firmware-bnx2_0.14-lenny2_all.zip">Download my floppy image!</a></p>
         
