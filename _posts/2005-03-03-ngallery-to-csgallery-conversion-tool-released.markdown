--- 
wordpress_id: 16
layout: post
title: nGallery to CS::Gallery conversion tool released!
wordpress_url: /archive/ngallery-to-cs-gallery-conversion-tool-released/
---

<p>To download the tool, you can get it from: <a href="http://www.qgyen.net/builds/GalleryConverter.zip">http://www.qgyen.net/builds/GalleryConverter.zip</a></p>
<p>Simply download the tool and extract it.&nbsp; To run it, use the GalleryConverter.exe.&nbsp; The source is also included with the tool.</p>
<p>Use the following steps below to use the converter:</p>
<ol>
<li>Edit the GalleryConverter.exe.config and set the SiteSqlServer and SiteSqlServerOwner settings.&nbsp; This file is actually exactly the same as the web.config that ships with CS.&nbsp; The converter uses the regular CS data providers, so it needs the connection string in relatively the same place. 
<li>Run it.&nbsp; It will connect, get a list of your Application Names.&nbsp; Select one, and then log into the site. 
<li>You must have your entire nGallery application local to your computer (or run the program on your server).&nbsp; If you are using a web host, you&rsquo;ll need to download your site. 
<li>Select which gallery you want to import your nGallery data into. 
<li>Select the location of your nGallery installation. 
<li>If you want to use file system storage, click the checkbox and chose the location to store your pictures.&nbsp; Normally, this would be the web/photos/storage location, or whatever you picked in your communityserver.config. 
<li>Click &ldquo;Go!&rdquo;</li></ol>
<p>If you are using a webhost, you can easily use the tool so long as you can connect directly to your SQL Server over the internet.&nbsp; Also, if you want to use file system storage, simply select a folder on your computer and then FTP it up to your webhost after doing the conversion.</p>
<p>For more discussion on using the conversion tool, please see <a href="http://www.communityserver.org/forums/475487/ShowPost.aspx">http://www.communityserver.org/forums/475487/ShowPost.aspx</a></p>
         
