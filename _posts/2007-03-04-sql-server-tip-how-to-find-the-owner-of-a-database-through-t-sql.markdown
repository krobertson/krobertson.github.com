--- 
wordpress_id: 282
layout: post
title: "SQL Server Tip: How to find the owner of a database through T-SQL"
wordpress_url: /archive/sql-server-tip-how-to-find-the-owner-of-a-database-through-t-sql/
---

<p>This weekend, I was trying to do just this and after scowering Google, I was quite surprised not to find any blog posts or articles addressing this.&nbsp; So here is my little tidbit and my hope Google picks this up so others trying to do the same thing will find out how quick and easy.</p> <p>Basically, I needed a way to get the name of a database&#39;s owner through a regular SQL command.&nbsp; After trying numberous Google searches, I came up empty.&nbsp; Then I tried running SQL Profiler while loading up the properties for a database to capture which query that data was returned in, but it was so chatty it was impossible to find.&nbsp; So finally, I dived into some of the system tables and T-SQL commands and found what I needed.&nbsp; Not too hard to figure out, but I was surprised Google didn&#39;t return anything (I thought Google was all knowing!).</p> <p>So here you go:</p> <blockquote> <p>select suser_sname(owner_sid) from sys.databases</p></blockquote> <p>Or want just a specific database?</p> <blockquote> <p>select suser_sname(owner_sid) from sys.databases where name = &#39;Northwind&#39;</p></blockquote> <p>Hopefully now others will be able to find out how quickly and easily.</p>
         
