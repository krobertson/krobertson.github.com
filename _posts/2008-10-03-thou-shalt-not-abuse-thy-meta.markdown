--- 
wordpress_id: 394
layout: post
title: Thou shalt not abuse thy meta
wordpress_url: /code/thou-shalt-not-abuse-thy-meta/
---

<p>I was browsing some code for utilizing webservices in Ruby the other day when I stumbled upon something that made me raise my eyebrow in a WTF moment.</p>

<p>This library, which will remain nameless, was pretty simple in nature, but it included some extensions to core types like File, String, Fixnum, and Symbol, which made it so you could do this:</p>

<pre><code class="ruby">def get(obj)
  siteroot = 'mydomain.com/api'
  open(http://siteroot/obj.xml) do |res|
    ...
  end
end</code></pre>

<p>I found it quite odd... creating URLs without making them strings?  Ok, kind of cool to look at.  But not very practical.  Sure you can tack some values together easily, but how useful is that?  Don't really gain any productivity.  Could easily just write it like this:</p>

<pre><code class="ruby">def get(obj)
  siteroot = 'mydomain.com/api'
  open("http://#{siteroot}/#{obj}.xml") do |res|
    ...
  end
end</code></pre>

<p>Not that much harder, and much clearer that it is a string!  The other way is far less readable, since you might get tripped up on what is a variable and what isn't.  Upon first glance, might not realize 'obj' is a variable and not a wannabe string.  But the .xml?  That isn't a variable, that is a wannabe string.</p>

<p>But it made me think... should a library take the liberty to extend the core, unless that is the purpose of the library?  Should a small (this was ~50 lines) library for aiding with webservices be extending the core classes?  You include this library and then the extensions are in your whole app, potentially colliding with others.  Since it made use of the method_missing method, what if another library you are using takes the same liberties on the same class, then you could get some odd behavior.</p>

<p>It is important to distinguish between a framework and a library though.  ASP.NET/ASP.NET MVC, Rails, Merb are all frameworks.  This one I was looking at was a library.  Frameworks are more encompassing.  You build a program on them, not with them... to put it visually, a library is a piece of a building, while a framework is the foundation.</p>

<p>I love Ruby, but one of the side effects of a dynamic language like it is that people can go overboard with the metaprogramming and can alter behavior in ways that don't always make sense or that could interfere with each other.</p>

<p>Moral of the story: Simple libraries shouldn't modify core classes.  Nifty meta tricks aren't needed.</p>
         
