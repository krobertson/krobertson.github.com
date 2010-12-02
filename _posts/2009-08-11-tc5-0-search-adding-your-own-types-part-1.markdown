--- 
wordpress_id: 416
layout: post
title: "TC5.0 Search: Adding your own types, part 1"
wordpress_url: /code/tc5-0-search-adding-your-own-types-part-1/
---

<p>Although I am still on paternity leave (have 2 more weeks), I am still trying to get a few things done to stay in the swing of things.  Earlier today, I saw <a href="http://twitter.com/brunomlopes">Bruno Lopes</a> post <a href="http://twitter.com/brunomlopes/status/3245526991">on Twitter</a> enquiring about how to add your own types to the new search in Telligent Community/Telligent Enterprise 5.0.</p>

<p>This will be a series of posts about some of the components of the new search and some of the things you need to do to add your own objects to the index and get them back in the results.  This post will focus on just the components of the new search at a high level.</p>

<p>In previous versions of Community Server, search had a very narrow purpose.  Search Barrel and the Enterprise Search were almost entirely separate, meaning if you tried to add support for additional types, it would be specific to the form of search you were using.  It had very few extensibility points for integrating, and the implementation was very specific to posts.</p>

<p>The new search is built more like a framework, without any specific ties to certain types of objects.  It is also built to be easily extended and even replaced.  It is made up of several components: mappers, content handlers, an index provider, and a search provider.</p>

<p>Mappers define what objects and values on those objects will be stored in the index.  The index is made of a series of "search documents," which basically outlines what object it represents (eg, a ForumPost), what is original ID was (as a string, such as PostID "1234"), and a collection of fields like Subject, Body, Author, etc.</p>

<p>Content handlers are simple things that are used to find content that needs to be indexed, makes a call to map it to search documents, passes it over to the index provider, and then somehow stores a setting to know that piece was already indexed.</p>

<p>Then the index provider and search provider implement the specifics of the search backend.  Included in Telligent Community is a set of providers for Solr, though you could implement your own to work with FAST, Yahoo BOSS, or whatever else you wish.  The providers mainly focus on handling search documents, so you can change out the providers and they'll automatically work with your existing mappings and content handlers.</p>

<p>In the next post, I'll cover how to write your own mapper and some of the details about how mappers work.</p>
         
