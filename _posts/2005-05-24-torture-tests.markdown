--- 
wordpress_id: 36
layout: post
title: Torture tests...
wordpress_url: /archive/torture-tests/
---

<P>Ever want to torture test yourself?&nbsp; Write some code to resolve a path.&nbsp; The biggest pain is handling of ".." and "." and intermixing them in ugly requests.</P>
<P>I've been working on updating the Community Server FTP Server to v1.1 and one of the weaknesses I'd found with the previous beta was some of its directory handling.&nbsp; For v1.1, the server is undergoing some major overhauling (mainly to make it pluggable to work with other apps that might use files/attachments in the future).</P>
<P>I thought I had everything working good, until I decided to try some odder requests.&nbsp; Like, if in /, typing "cd photos/sample/../sample/../../photos/" should result in changing into /photos/.&nbsp; You would think that it should be simple, but no.&nbsp; Had it scanning and counting occurrances of "..", but it was looking only for consequtive ones, and then removing them all.&nbsp; So it would count 2 occurrances (starts from the end back), and them remove the next two references.&nbsp; It wasn't paying attention to the fact that one of the instances it is removing might be another "..".&nbsp; So had to change it to check them while removing and not removing too much or too little.</P>
<P>Then I decided to start testing the "." current directory item.&nbsp; From /photos/, typing "cd ./../photos/sample/.././../" should result in /.&nbsp; But again, nope.&nbsp; When removing instances of "..", it was treating "." as a valid entry it should remove and count as occurance, when it should remove it and not count it as an occurance.&nbsp; Then you get into cases where you index gets out of range and you throw an exception before it has processed all of it.&nbsp; Oy.</P>
<P>In short, it has been a painful past two hours.&nbsp; I finally got it working and all of my test cases are passing.&nbsp; Yay.&nbsp; I've fired up the debugger so many times that Visual Studio has frozen on me twice.&nbsp; Just thought I'd share some excitement from my day.</P>
         
