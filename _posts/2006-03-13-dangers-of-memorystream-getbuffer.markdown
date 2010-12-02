--- 
wordpress_id: 111
layout: post
title: Dangers of MemoryStream.GetBuffer
wordpress_url: /archive/dangers-of-memorystream-getbuffer/
---

<p>Writing this in hopes of saving some other developer the trouble of tracking this down on their own.  It didn't take too long, but was a little confusing at first.</p>

<p>Be very careful when using MemoryStream.GetBuffer() as a quick and simple way to get the contents of the stream into a byte array.  It may be surprising, but most of the time stream.GetBuffer().Length != stream.Length.</p>

<p>Why?  This was not mentioned in the MSDN documentation with VS2003, but <a href="http://msdn2.microsoft.com/en-us/library/system.io.memorystream.getbuffer.aspx">online MSDN documentation</a> show some important details:</p>

<blockquote>
  <p>Note that the buffer contains allocated bytes which might be unused. For example, if the string "test" is written into the MemoryStream object, the length of the buffer returned from GetBuffer is 256, not 4, with 252 bytes ?unused. To obtain only the data in the buffer, use the ToArray method; however, ToArray creates a copy of the data in memory.</p>
</blockquote>

<p>So, it would be best to either to use stream.Read(bytes, 0, (int)stream.Length) (note possible issue of converting stream.Length to int), or use stream.ToArray().  I think it would just be best to stay away from GetBuffer().</p>
         
