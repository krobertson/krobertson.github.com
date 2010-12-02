--- 
wordpress_id: 454
layout: post
title: One of these things is not like the other, except to SQL
wordpress_url: http://invalidlogic.com/?p=454
---
Was recently working on an issue that was so perplexing, that I <em>almost</em> had <a href="http://pentonizer.com/">David Penton</a>, our resident SQL expert stumped.

We had an issue with some username handling and it ended up boiling down to there we could go into SQL Server, run this query, and get a result when you'd normally expect it to not match:

[sql light="true"]select 1 where N'ß' = N'ss'[/sql]

After that, I was truly stumped.  I'd Googled everything I could think of any came up empty.  Had I known what the <a href="http://en.wikipedia.org/wiki/German_alphabet#Sharp_s">German sharp S</a> was, life would have been easier.  Come to find out through <a href="http://www.ureader.com/message/1343195.aspx">some sources</a>, that some of the SQL standards (in this case, SQL92 is referenced) call for the German sharp S is translated down to "ss" in string comparisons.  So although it might seem like a bug, it is to-spec.  Oracle is also reported as working this way.

To work around the behavior, one option is a <a href="http://connect.microsoft.com/SQLServer/feedback/details/341130/-and-ss-are-not-equal#tabs">workaround function</a> for SQL Server which essentially has you convert the string to a binary column and store it.  This may be outside what you can do in your application though, as in ours, we'd need to update every place that does string comparisons on the username as well as altering the ASP.NET Membership tables and stored procedures.

An alternative is to change your database collation to use one that is more binary dependent such as Latin1_General_BIN.  This will treat ß and 'ss' separately, though also be aware since it is binary, it is case insensitive and some behaviors such as sorting may also change.

A topic like this is important for any developer for a few reasons:

First, being in the US, it is easy to be ignorant of other culture's language handling.  You may work to add resource labels so your application can be translated and such, but every so often you will find behaviors related to internalization that perplex you because you've never heard of the German sharp S (as in this case).

Second, when its an issue in SQL and you're in doubt, look at collation first.  SQL Server has a <em>huge</em> list of collations, and each one does something different.  Its either a behavior with the one you're using, or the user is using a collation you haven't tried (tested) before.

And finally... need to try harder to stump Penton.  It can be done!
