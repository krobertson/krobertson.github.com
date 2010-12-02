--- 
wordpress_id: 189
layout: post
title: Clean Sources Plus
wordpress_url: /archive/clean-sources-plus/
---

<p><a href="http://www.computerzen.com/">Scott &quot;The Tool Man&quot; Hanselman</a> just posted his <a href="http://www.hanselman.com/blog/ScottHanselmans2006UltimateDeveloperAndPowerUsersToolListForWindows.aspx">2006 Ultimate Developer/Power Users Tool List</a>.&nbsp; One of the ones on the list that I have been falling in love with that is incredibly simple is the Clean Sources utility.&nbsp; Scott&#39;s list points to <a href="http://shahine.com/omar/">Omar Shahine</a>&#39;s original <a href="http://wiki.shahine.com/default.aspx/MyWiki/CleanSources.html">Clean Sources</a> tool, but I&#39;ve actually been loving <a href="http://www.codinghorror.com/blog/archives/000368.html">Clean Sources Plus</a> by <a href="http://www.codinghorror.com/blog/">Jeff Atwood</a>.</p><p>The main advantage to Jeff Atwood&#39;s utility is that you can specify additional regex patterns for files/directories that should be deleted.&nbsp; So in my case, when I have it clean source, I want it to also removed the ReSharper cache directories and all of the backup directories from the SourceGear Vault client.&nbsp; So in the program&#39;s CleanSourcesPlus.exe.config, I exnteded its &quot;DirectoryDeletionPattern to the following:</p><blockquote><blockquote><p>&lt;add key=&quot;DirectoryDeletionPattern&quot; value=&quot;^bin$|^obj$|^Debug$|^Release$<strong>|^_ReSharper.|^_sgbak$</strong>&quot; /&gt;</p></blockquote></blockquote><p>This will have it delete any directory named _ReSharper.* and any directory named _sgbak.&nbsp; Excellent utility.&nbsp; Absolutely love it.<br /></p><blockquote><blockquote><p>&nbsp;</p></blockquote></blockquote>
         
