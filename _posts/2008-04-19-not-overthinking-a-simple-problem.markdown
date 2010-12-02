--- 
wordpress_id: 383
layout: post
title: Not overthinking a simple problem
wordpress_url: /code/not-overthinking-a-simple-problem/
---

<p>One little project I had taken up recently was to get <a href="http://thoughtbot.com/">Thoughtbot's</a> <a href="http://thoughtbot.com/projects/paperclip">Paperclip</a> plugin working under Merb and DataMapper.  Initially, what I wanted to do was to was implement it completely as a DataMapper custom type.  Basically, I wanted this as the class definition:</p>
<pre><code class="ruby">class User<br />  include DataMapper::Resource<br /><br />  property :id, Fixnum, :serial =&gt; true<br />  property :username, String<br />  property :avatar, Paperclip::Attachment,<br />                    :styles =&gt; { :medium =&gt; &quot;300x300&gt;&quot;,<br />                                 :thumb =&gt; &quot;100x100&gt;&quot; }<br />end</code></pre>
<p>With this, it would all be contained as a single column in the database and it would serialize the attributes to JSON (though initially used YAML).</p>
<p>The problem?  Initially, a custom type didn't know about how it was being used at all, such as what the model's name was and what the property's name was.  The object model basically went Model &lt;-&gt; Property -&gt; Type.  You could get to the model from the property, but couldn't get to the type.  I changed that with my recent contribution and was well on my way to finishing.  I got it so you could save, post-pone thumbnails til saving, validations, and all.  But the one thin gI couldn't do was locate the file when it was retrieved later.  You see, the custom type doesn't have access to the instance at all, so it had no way of knowing the ID of the record.  When saving, it dynamically added an after-save handler which let it gain access to the ID, but when retrieving it later, didn't quite have the ability.</p>
<p>A hack was to make it so the custom type's load method would redefine the getter in the method to pass in the ID, but that only worked on the 2nd call to the object.  So you couldn't do this:</p>
<pre><code class="ruby">user = User[123]<br />user.avatar.url</code></pre>
<p>The redefinition was only in effect on the second call, so it was rather hacky.  Any changing so the custom type could get to the instance really muddies up the whole object model.</p>
<p>Additionally, as I was contemplating ways around it, I realized another negative of my method: it couldn't import a database from the ActiveRecord usage of Paperclip.  Sure, you can use ActiveRecord within Merb, but if someone wanted to move from ActiveRecord to DataMapper with an existing database, they wouldn't be able to.</p>
<p>So, in following with the Occam's razor / KISS ideology, I went back to simply update the original implementation and within 15 minutes, I had it working, completely with retrieving and all.  Granted, not all the work was wasted.  I still needed the rewritten validations, and was good to add to DataMapper (as I know I will use that later on).  Additionally, I now know how to develop custom types inside and out.</p>
<p>So now, the class definition looks more like:</p>
<pre><code class="ruby">class User<br />  include DataMapper::Resource<br />  include Paperclip::Resource<br /><br />  property :id, Fixnum, :serial =&gt; true<br />  property :username, String<br />  has_attached_file :avatar, <br />                    :styles =&gt; { :medium =&gt; &quot;300x300&gt;&quot;,<br />                                 :thumb =&gt; &quot;100x100&gt;&quot; }<br />end</code></pre>
<p>Even better, it should be compatible with existing databases that might want to migrate from ActiveRecord to DataMapper.</p>
         
