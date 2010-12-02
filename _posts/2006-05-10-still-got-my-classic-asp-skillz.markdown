--- 
wordpress_id: 142
layout: post
title: Still got my classic ASP skillz
wordpress_url: /archive/still-got-my-classic-asp-skillz/
---

<p>Those skills I thought I would never use again actually came in handy tonight.  I was checking out this program and a piece of it was in the form of an ASP script that would pass some commands from the web onto a command line interface (yes, not a very secure thing, but that is besides the point).</p>

<p>The problem was it wasn't working!  I had searched online for the error message and found someone with the exact same error, but no one with a fix, update, or anything.</p>

<p>So, since I used to do classic ASP at my job before Telligent, figured I'd dive in (past the line that says "Do not change anything else") and was quickly able to figure out the problem.  It was passing commands onto the system that were overly escaped.  It was passing &#34; when it just needed " and &#34; when it just needed &#34;.  A little replace(strCommand, chr(92) &amp; chr(34), chr(34)) action and it was good to go!</p>

<p>The one thing that was troubling me was I am used to using "\&#34;", but that wasn't flying.  Had to fall back on chr().  My ASP is a little rough... been two years and haven't even touched anything ASP since.</p>
         
