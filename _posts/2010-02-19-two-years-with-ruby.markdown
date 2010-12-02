--- 
wordpress_id: 475
layout: post
title: Two years with Ruby
wordpress_url: http://invalidlogic.com/?p=475
---
Tonight I realized that its now been two years since I first started working with Ruby.  Back in February of 2008, I'd posted about my <a href="http://invalidlogic.com/2008/02/21/experimenting-in-rails/">first experiments with Rails</a>.  Lo and behold, its now been two years.  I do say two years with Ruby though, not Rails.  I've been using Merb for about the past year and a half.  Although I have started messing around with Rails 3 and really like what I see so far.

So in the past two years, what have I done?  Sadly, a lot of it is sorely behind and out dated, but take a bit of a trip down memory lane...
<ul>
	<li>The SkitchDav I originally blogged about, but now no longer use</li>
	<li><a href="http://github.com/krobertson/dm-dbslayer">DM-DBSlayer</a>. I was using it in a personal app, but the app didn't need scale, so eventually removed it.</li>
	<li><a href="http://github.com/krobertson/dm-paperclip">DM-Paperclip</a>.  I really need to dust this off, it needs some TLC.</li>
	<li>Some hacking on <a href="http://github.com/krobertson/warehouse">Warehouse</a>, which eventually led to my ideas for Trunks.</li>
	<li><a href="http://github.com/krobertson/branches">Branches</a>, which was basically a ruby port of Gitosis.  I wrote it anticipating using it for Trunks so I could interact with the DB in Ruby.  I did in the first incarnation of trunks, but am now on "Branches 2.0" which was done from scratch and super simplified so it is Trunks-only and structured to do both Git and Mercurial.  Would actually be nice to pull it out of Trunks and release it.  Damn, another project for my list.</li>
	<li><a href="http://github.com/krobertson/tigger">Tigger</a>.  Really bad name.  When I first wrote Trunks but was unsure about launching it, tried to redo the interface as a better read-only web interface to git repos.  The app should still work... was on Merb 1.0.</li>
	<li>And of course, <a href="http://trunksapp.com/">Trunks</a>.  Merb 1.1-pre.</li>
</ul>
And I've also had several apps that haven't seen the light of day and were more for my personal use or tinkering.
<ul>
	<li>For a while I was into <a href="http://eveonline.com/">EVE Online</a> and wrote an app to parse and process item reports from <a href="http://www.eve-central.com/">Eve Central</a>.  It allowed me to locate items that were selling under market rate quickly, compare prices across markets, and I could somewhat defer what items were selling most at different market hubs.  Really geeky.  Probably put several months into it.  Merb app.</li>
	<li>Also wrote an app to track my sales by location, by item, and comparing sales volumes based on price as I played with prices.  Merb app.</li>
	<li>And another for EVE Online... came up with the "Jita Mineral Index" which tracked mineral prices in the main market hub in the game.  I left it up for several months after I stopped playing, until I found that the app that processed the emails from Eve Central broke and had like 200k+ unprocessed messages in its inbox.  Merb app.</li>
	<li>Some time ago, was playing with different virtualization APIs and wrote an app that would provision and deploy virtual servers in KVM and in XenServer.  I'm probably too much of a nut about virtualization.  Mixture of stuff... Ruby, <a href="http://github.com/ezmobius/nanite/">Nanite</a>, Merb.</li>
	<li>A really basic Sinatra app to handle my domains that just have static pages.  Rather than having multiple sites, I have just one and it determines which template to render based on the host header.  Was my first Sinatra app.</li>
</ul>
And of course some other stuff on <a href="http://github.com/krobertson">Github</a> and <a href="http://gist.github.com/krobertson">Gist</a>.

And I have some that will likely be coming soon:
<ul>
	<li><a href="http://smugpic.heroku.com/">This</a>, which I'll likely blog about once I get a name for it and a domain.  And update the incorrect launch date in the News part, oops.</li>
	<li>Was actually thinking of dusting off my original SkitchDav as a Sinatra app.  What triggered me to write this.</li>
	<li>Also thinking of dusting off an app I prototyped a while ago involving Rack and Solr.</li>
	<li>Always got ideas brewing in my head... just a matter of parsing out which are really worth my free time.</li>
</ul>
All this Ruby has also helped me to grow so much more as a .NET developer.
<ul>
	<li>More languages you know the better.</li>
	<li>Exposure to new methodologies and mindsets, new more progressive community.</li>
	<li>Exposure to testing.  Testing is far easier in dynamic languages, and grasping the concepts in a dynamic language makes it easier to apply to a static language.</li>
	<li>MVC.  Thank god for MVC.  Unlearned all the webforms crap and re-learned plain and simple HTTP and a logical structure for your app.</li>
	<li>Making programming fun again.  Its nothing against .NET, but sometimes you need to break out from the familiar and learn something new to remind you why you love programming.  Before Ruby, I was stuck in what I knew and don't really think I was coding for fun much.</li>
</ul>
