--- 
wordpress_id: 365
layout: post
title: Issues with mono, temporarily on IIS
wordpress_url: /software/issues-with-mono-temporarily-on-iis/
---

<p>I had <a href="http://qgyen.net/software/i-ve-got-mono/">previously mentioned</a> that I had moved my site over to Mono, however last night I actually moved it back to IIS.  The main reason is that I was experiencing some CPU spikes where Mono would take 100% of the CPU.  I had tried tracking it down over the weekend, though wasn't able to find the cause, and mean while, my site was going up and down as far as accessibility.  Since I wasn't able to narrow down the cause, and wasn't able to dedicate a whole lot of time to it just yet, I figured I might as well switch it back to IIS for the time being so I can get it resolved without having my site down, or having to go onto the server and kill/recycle the mono process.</p>

<p>Hopefully in the next couple of days, I'll get it nailed down.  I had a list of a couple of potential causes, and have crossed off a few of them.  This morning, think I might have figured it out, but haven't had a chance to test it yet.</p>
         
