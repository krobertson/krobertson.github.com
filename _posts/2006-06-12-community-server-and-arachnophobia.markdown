--- 
wordpress_id: 155
layout: post
title: Community Server and arachnophobia
wordpress_url: /archive/community-server-and-arachnophobia/
---

<p>You may wonder what arachnophobia has to do with Community Server, but if you run a CS site and make good use of the photo galleries or file galleries, you may find yourself with arachnophobia as well.  I am not talking about spiders like daddy long legs, but I'm talking about Google, MSN, and Yahoo.</p>

<p>In CS, we try to make a number of things secure and search engine friendly.  We make limited use of the query string, so spiders can crawl your site and gather up a lot of the content, and we do a lot of permissions checks to ensure the right people see the right things (or wrong people don't see the wrong things).  One side effect of this is that a lot of URLs have the .aspx extension so that the ASP.NET runtime will pick up the request.</p>

<p><img src="http://qgyen.net/images/sizes.png" alt="gallery image sizes" align="right">The problem with this comes into play with the Photo Galleries and File Galleries.  So that CS can check the permissions, links to view pictures or download files need the .aspx extension, but also when a spider is crawling your site and sees a link to it, it doesn't know it is an image or a file.  Take, for instance the "Picture Details" page in the Photo Galleries.  Whenever you view a picture, depending on the skin, it could have a section such as this where it links to many different versions of the image.  Regular old links, with .aspx extensions.  A spider sees them as additional content to slurp, so it goes for them.</p>

<p><img src="http://qgyen.net/images/traffic.jpg" alt="bandwidth usage" align="left">Some people had told me that the spiders would see in the headers that it was an image, and then abort.  That isn't necessarily true.  I had noticed this issue a while ago and created a robots.txt file for my site that blocked spiders from images in my photo gallery and files.  I was curious as to how much traffic could be generated from spiders, so I recently decided to remove it and see wht would happen.  On June 1st, I removed my robots.txt file and nothing happened for about a week.  Then, in the image on the left, you can see I started getting more traffic.  Typically, my site only does ~40-60mb per day (yeah, not a lot, but I am not very graphic heavy and most of the traffic is to my RSS feed).  Then on June 7th, I see a spike to 100mb from Google crawling my photo gallery again, and on June 9th I see it shoot to 250mb from MSN crawling my photo gallery.&nbsp; After it shot up on the 9th, I put the file back and traffic has dropped down and is steady once again.<br></p>

<p>In the time since I first created my robots.txt file, I've slimmed down my gallery a lot, so there is less for it to get (thankfully).  For for people with photo rich sites, this can cause a problem.  It will download a number of versions of the same file, the most damaging one being the original image.  If you like the latest high megapixel cameras like me, these images can easily push 2mb each.  Also, one negative aspect in Community Server is if the spiders are mainly checking to see if the content has changed, CS will still return the image, instead of reporting nothing has changed.</p>

<p>So what are some potential solutions to this?  I had thought of adding rel=nofollow attributes to the links to the images, but it doesn't really solve the problem.  First, if the search engines have already been to the site, they'll already have the link, and likely refresh it.  Second, if you link directly to an image from another site (like a forum), the search engines can still get the link into their systems that way.  The only real solution is to use a robots.txt file, but even then, there is an issue.  The problem is that you could get URLs like /photos/ken/images/1234/original.aspx and /photos/john/5678/original.aspx, such as you would get if your site had multiple galleries.  The robots.txt doesn't allow wildcards like /photos/*/images/.</p>

<p>So, for a fairly basic but effective robots.txt file, I'd recommend:</p>

<blockquote>User-agent: *<br>Disallow: images/<br>Disallow: download.aspx<br>Disallow: FileStorage/</blockquote>

<p>The first disallow will block anything in an 'images' directory anywhere on the site.  So I'd recommend not using an images directory for things you want search engines to index.  In my opinion, I don't really need them to have the images for my site's layout.  The second one will block anything using download.aspx, which is what is used to download in the File Galleries.  The final one is where attachments to forums posts are downloaded from.  Note that this was from a CS v2.1 site I was testing with, I am not 100% sure if CS v2.0 was that way as well.</p>

<p>Additionally, you may want to block them from browsing in your Themes folders (like for CSS or whatever they might want to grab), or misc pages like the login page, create user page, etc.  For the more aggressive block, you could use this:</p>

<blockquote>User-agent: *<br>Disallow: images/<br>Disallow: download.aspx<br>Disallow: /FileStorage/<br>Disallow: /Themes/<br>Disallow: /User/<br>Disallow: /Utility/<br>Disallow: /login.aspx</blockquote>

<p><em>Note: This one assumes Community Server is in the root of your site.  Change the paths accordingly if it isn't.</em></p>

<p><strong>I will likely change these recommendations over time based on feedback I get and maybe some engine specific tweaks to make it better.</strong></p>
         
