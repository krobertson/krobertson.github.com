--- 
wordpress_id: 346
layout: post
title: Making a contact form
wordpress_url: /software/making-a-contact-form/
---

<p>Had someone ask me over Twitter the other day how to make a <a _tesavedurl="http://qgyen.net/contact/" href="http://qgyen.net/contact/">contact form</a> like mine in Graffiti.&nbsp; Here are some quick steps to get it accomplished for you.</p>
<ol>
    <li><strong>Create a post</strong> and set its post name to &quot;contact&quot;, or something similar and just make a note of it.</li>
    <li>In your theme's folder, <strong>create a file</strong> named &quot;contact.view&quot;, or if you created the post with another name, use &quot;post-name.view&quot; (replaces spaces with -).</li>
    <li><strong>Fill the contents</strong> of the file with the following (key pieces in bold, rest will depend on your theme... the markup below is specific to my site's layout):</li>
</ol>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div id=&quot;content&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp; &nbsp; &lt;div class=&quot;post&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;h1 class=&quot;title&quot;&gt;<strong>$post.Title</strong>&lt;/h1&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div class=&quot;entry&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>$post.Body</strong><br />
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &lt;p&gt;<em><strong>$macros.ContactForm</strong></em>&lt;/p&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/div&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp; &lt;/div&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &lt;/div&gt;</p>
<ol start="4">
    <li>In the Graffiti Control Panel, go to Presentation, Navigation, and <strong>add a reference to your Contact post</strong> onto your navigation bar.</li>
</ol>
<p>And there you have it!&nbsp; With this, your post's title and body will be shown on the page, allowing you to easily manage the content of the page through the control panel, and the macro adds in all the necessary form elements to handle the contact page.</p>
         
