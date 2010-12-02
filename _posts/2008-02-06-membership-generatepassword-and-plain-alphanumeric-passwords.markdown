--- 
wordpress_id: 358
layout: post
title: Membership.GeneratePassword and plain alphanumeric passwords
wordpress_url: /software/membership-generatepassword-and-plain-alphanumeric-passwords/
---

<p>Recently, I ran across an issue with a particular way I was using Membership.GeneratePassword.  I had written some code to handle some automated deployment and was using Membership.GeneratePassword to generate a password for a SQL user and then add it to the connectionStrings section of the web.config.</p>

<p>GeneratePassword takes two parameters, one for the length, and one for the number of non-alphanumeric characters (characters other than 0-9, a-z, and A-Z).  The way I was using it was GeneratePassword(8, 0), so I <b>wanted</b> an 8 character password with just alphanumeric characters.</p>

<p>However, I eventually ran into an issue with it.  It generated a password with ';' in it, which broke the format of the connection string.  Even with the way I was specifying 0 for numberOfNonAlphanumericCharacters, it was still inserting a couple of non-alphanumeric characters.  After testing, I found it was averaging 2-3 non-alphanumer characters per password.  I just didn't notice it until one of them actually broke something.</p>

<p>I dug into the <a href="http://msdn2.microsoft.com/en-us/library/system.web.security.membership.generatepassword.aspx">documentation for Membership.GeneratePassword</a> and found for the numberOfNonAlphanumericCharacters, it showed the parameter description as:<p>

	<blockquote>The <b>minimum number</b> of punctuation characters in the generated password.</blockquote>

<p>This contrasted what was shown to me in IntelliSense when I was initially coding it.</p>

<blockquote><a href="http://img.skitch.com/20080206-bcj9k5h2fr1hk8u7g36n5c73p6.jpg" rel="lightbox"><img src="http://img.skitch.com/20080206-bcj9k5h2fr1hk8u7g36n5c73p6.preview.jpg" alt="IntelliSense for Membership.GeneratePassword" border="1" /></a></blockquote>

<p>So while I specified I didn't want any non-alphanumeric characters, since the parameter is actually just a minimum, there is still a chance for them to slip in.</p>

<p>In examining the code through Reflector, I found that it generates the password in a kind of two-pass method.  It first runs through and generates a password of the given length, allowing for a random chance of non-alphanumeric characters to be added.  It then makes a small second pass where it ensures the given minimum has been meet.  So if it needs additional non-alphanumeric characters, it will randomly replace characters until the minimum is met.</p>

<p>This makes sense, but it poses the problem that the method is not useful for generating simple alphanumeric passwords.  In a case like mine, where I intend to use it in a connection string, it has the potential to break the syntax.</p>

<p>In the end, it would be nice if one of two things happened:</p>

<p><ol><li>Update the IntelliSense documentation to reflect that it is the minimum and not the actual number of characters.</li>
<li>Update the method to treat the parameter as the minimum, but to support just alphanumeric characters when 0 is passed.  As it is now, GeneratePassword(8, 0) and GeneratePassword(8, 1) are <em>nearly</em> identical, as the probability of getting a true alphanumeric password is low.  With this suggested change, if you don't want non-alphanumeric, then use 0.  If you do want non-alphanumeric, then you can just use 1 or more.  If you don't care, perhaps they could add an overload for GeneratePassword(length) which maps to allowing a minimum of 1 (to encourage stronger passwords).</li></ol></p>

<p>For now, I just switched to using my own base 62 random string generator and will make a mental note about the behavior.</p>
         
