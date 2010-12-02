--- 
wordpress_id: 356
layout: post
title: Is this book serious?
wordpress_url: /software/is-this-book-serious/
---

<p>I've been working on finding my way through Rails, since learning Ruby/Rails has been on my list to do for a while now.  Naturally, when I decided to dive in, naturally wanted to go out and buy the books that come highly recommended for it.  So I went out and bought <a href="http://www.amazon.com/exec/obidos/ASIN/0977616630/qgyennet-20">Agile Web Development with Rails</a> and <a href="http://www.amazon.com/exec/obidos/ASIN/0974514055/qgyennet-20">Programming Rails</a> (aka, the pickaxe book), both by <a href="http://pragdave.pragprog.com/">Dave Thomas</a>.  They both came highly recommended, and while I've only started on Agile Web Development with Rails, I am having a hell of a time wading through the thick propaganda in the book.  Seriously, the book creates this aura where before Rails, we were in the dark ages of the internet and it is just this golden light, bringing logic and reason to everything.</p>

<p>The most striking example of this comes when it starts talking about application design and how Rails <em>is</em> Agile and mentions Use Cases:</p>

<p><blockquote>A <em>use case</em> is simply a statement about how some entity uses a system.  Consultants invent these kids of phrases to label things we've all known all along--it's a preversion of business life that fancy words always cost more than plain ones, even though the plain ones are more valuable. (Ch 5, page 55)</blockquote></p>

<p>Ooo, "use case" goes along with that big bad W word--Waterfall.</p>

<p>Please, I am reading this book for education, not for propaganda.  I don't need to be preached to about the evils of waterfall, the saving grace of agile, and the huge corporate conspiracy that is every language not named Ruby.</p>

<p>Of course, it continues, just a mere 10 pages later, find this when talking about handling deployments and databases.</p>

<p><blockquote>Many people like using interactive tools to create and maintain schemas.  The phpMyAdmin tool, for example, lets you maintain a MySQL database using web forms.  At first sight this approach to database maintenance is attractive... However, this convenience comes at a price... It also makes it hard for yo to deploy your application you have to remember to make the same changes to both your development and production databases (and we all known hat if you're going to fat finger something, it'll be when you're editing the production schema). (Ch 6, page 64-65)</blockquote></p>

<p>Even long before Rails came about, I have never been on a project where changes were made to production databases through a GUI.  Even back doing ASP, before .NET and Rails came about, I worked for the government and we always pushed changes through a controlled process.  We made changes directly to a dev environment, scripted them out, pushed to stage, tested, then pushed to production.  I didn't even have any type of write access to production.  I could only do selects and run stored procedures, couldn't do any direct table insert/update/delete commands.</p>

<p>Even in Community Server, when Rails was first coming about, we had a database schema versioning system in place.  Rails didn't invent it, pretty much everyone was already doing it, they were just the first ones to add it to the framework.</p>

<p>This book is driving me nuts.  I am reading it rolling my eyes as I go.  I recognize Rails has done a lot for convention, and that it strives to build in all these things aimed at making the developer's life easier.  But don't preach.  I think I might just shelve Programming Ruby, since it is also by Dave, and instead moving onto something else.  I've heard <a href="http://www.amazon.com/exec/obidos/ASIN/0321445619/qgyennet-20">The Rails Way</a> is highly recommended, maybe give it a shot.</p>
         
