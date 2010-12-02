--- 
wordpress_id: 385
layout: post
title: History Blog Meme
wordpress_url: /technology/history-blog-meme/
---

<p>After <a href="http://www.fallenrogue.com/articles/259-history-blog-meme">Leon posted tonight</a>, figure I will follow in kind.</p>
<pre><code>ken@thinky:~$ history 1000 | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
93 ls
82 vi
55 cd
48 git
47 grep
25 gedit
21 sudo
20 merb
19 exit
9 spec</code></pre>
<pre><code>MacDaddy:~ ken$ history 1000 | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
50 merb
48 git
46 sudo
45 rake
42 cd
36 ls
29 spec
24 mate
23 vi
12 cp</code></pre>

<p>Surprised sudo is on there so much, but likely from installing a lot of gems lately, and constantly running "sudo rake install" on DataMapper and Merb.  Need to move my gems to home directory sometime.</p>
         
