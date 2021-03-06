--- 
wordpress_id: 359
layout: post
title: Search for hosted Subversion
wordpress_url: /technology/search-for-hosted-subversion/
---

<p>I recently decided to look into using a hosted Subversion service.  I used to always use Subversion locally using a method I've <a href="http://qgyen.net/archive/using-subversion-without-a-subversion-server/">mentioned before</a>, however recently, I was going to be doing some coding while out of town and wanted to be able to make regular check ins, but couldn't since all my repositories were local.  So I decided to look into actually using a live Subversion server.</p>

<p>Initially, I thought I'd simply set up a Subversion server on my own servers and go with that, but I wanted to have an interface for managing the repositories, so I could easily create new ones or access/browse them through the web and didn't want to have to set all that up on my own.  Additionally, there are a number of inexpensive Subversion hosing services, so sometimes it just isn't worth the effort.</p>

<p>I couldn't use something like <a href="http://code.google.com/">Google Code</a>, because most of these are personal projects and not open source.  Though my three main contenders are <a href="http://hosted-projects.com">hosted-projects.com</a>, <a href="http://beanstalkapp.com/">Beanstalk</a>, and <a href="http://codespaces.com">Code Spaces</a>.  Briefly, here are the pros/cons so far:</p>

<p><b>hosted-projects:</b><br/>
<ul>
	<li>Pros:
		<ul><li>Cheapest</li>
		<li>Unlimited repositories (I prefer individual repositories over a generic "projects" repository)</li>
		<li>Includes WebDAV space (see end)</li>
		<li>Includes <a href="http://trac.edgewall.org/">Trac</a> install with each repository</li></ul></li>
	<li>Cons:
		<ul><li>Butt ugly.  Seriously, their website is unappealing and the control panel is even worse.  It makes me question how much they've invested in their business, how they'd handle failure/failover/recoverery.</li>
		<li>While Trac is nice, it is a bit overkill for personal projects.  I just want to view source/revisions, don't <em>need</em> tickets and a wiki.  Can use Basecamp/Unfuddle if I needed those features.</li></ul></li></ul>
</p>

<p><b>Beanstalk:</b><br/>
	<ul><li>Pros:
		<ul><li>Rich interface, very nicely done</li>
		<li>Just does source/revision viewing, but offers integration with Basecamp for more functionality (not Unfuddle, unfortunately)</li></ul></li>
	<li>Cons:
		<ul><li>Costs more</li>
		<li>Limits based on number of repositories.  I could group projects, but don't really want to.</li></ul></li></ul>
</p>

<p><b>Code Spaces:</b><br/>
	<ul><li>Pros:
		<ul><li>Good interface, offers work items, forums, and a wiki, similar to Trac, but busier for basic change log type viewing.  Code browser is a bit too busy too, too AJAXy.</li>
		<li>Unlimited repositories with their "Small Team" package, which is only a little bit more than Beanstalk</li></ul></li>
	<li>Cons:
		<ul><li>Though you can get unlimited repositories, for the package level I am looking at of the three, it is the most expensive.</li>
		<li>While the interface isn't horrendous like hosted-projects, I don't like the over use of AJAX and modals.</li></ul></li></ul>
</p>

<p>Overall, I am pretty torn.  Plain, simple, and unlimited (while ugly) with hosted-projects, or strong interface but limited repositories with Beanstalk.  That is pretty much where I am at.  If Beanstalk were unlimited repositories, it'd be a no brainer.  If they were to double the repositories, I'd definitely stay there.  For me, disk space is unimportant.  I really don't need that much disk space, so with Beanstalk, the limiter is repositories and not space, so I'd be just as happy with 1/2 the disk space and twice the repositories.</p>

<p>I did mention something about WebDAV, though that is a very minor point.  One system I am particularly looking to move towards is using <a href="http://en.wikipedia.org/wiki/Git_(software)">git</a>.  I am thinking of just skipping a hosted Subversion solution and just going to using git.  Git is basically a distributed version control system, where you have full history local to you and can commit and use it entirely while disconnected.  Then you merely have multiple branches of the same code that can get merged together.  In my recent case, of doing some coding while out of town, I was at my parents and they have (until they move in 2 months) crappy satellite internet since they are out of reach of regular utilities.  Their connection is barely ok for web browsing, horrid for RDC, and I wouldn't trust it much with version control since it isn't always consistent or sustainable.  With git, I could sync to my laptop before I leave, make checkins while gone, totally offline, then merge back when I get home.  With a Tortoise-like clone being developed for Git, it will likely be a lot easier to use on Windows soon, and it looks like there is a Git bundle for TextMate, so I'd be set in my OS X + TextMate bliss.</p>

<p>If I went with git, I wouldn't really need a central repository site like hosted-projects, since you don't really create a repository that you then load everything into.  Git doesn't have to be online at all.  But what would be nice would be a simple web application to browse the history (even though I could do all that locally).</p>
         
