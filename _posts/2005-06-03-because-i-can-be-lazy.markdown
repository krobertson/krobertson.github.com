--- 
wordpress_id: 41
layout: post
title: Because I can be lazy...
wordpress_url: /archive/because-i-can-be-lazy/
---

<P>One thing I always hate on a personal website is doing the about page.&nbsp; It is always that forgotten section that you never know what to put on it, and it eventually falls out of date.</P>
<P>Specifically, I hate putting my age on there.&nbsp; I don’t care about telling people my age (I am 24, by the way), but I never update it.&nbsp; My birthday was 2 months ago, and yet I got to updating it rather early this time.&nbsp; Normally, it’ll be as long as 6 months behind.</P>
<P>So, I took a better step at ensuring it is more accurrate.&nbsp; Changed the page to use this to show my age:</P>
<BLOCKQUOTE>
<P>&lt;%=new DateTime(DateTime.Today.Subtract( new DateTime(1981, 4, 10) ).Ticks).Year-1 %&gt;</P></BLOCKQUOTE>
<P>It will work ok, but it is kind of ugly.&nbsp; For one, TimeSpan doesn’t have a Year parameter (and I can see why, as months have a different number of days, and years have different numbers of days [leap year]).&nbsp; This will work ok, but it can have a margin of error… mainly just updating to the next value a few days early or a few days late.</P>
         
