--- 
wordpress_id: 417
layout: post
title: "TC5.0 Search: Adding your own types, part 2"
wordpress_url: /code/tc5-0-search-adding-your-own-types-part-2/
---

<p>In this post, I'll cover the specifics of the search mappers.  Lets say we have a class named Book and we want to index it along with everything else Telligent Community normally indexes.  I'd first create a project called BookSample and add a reference to the Telligent.Search.Mapping assembly.</p>
<p>Mappers are classes that inherit from the Telligent.Search.Mapping.DocumentMapper class.  They have to implement two pieces, a Load() method and a Priority getter.  The Load() method is used to define function blocks that are later executed to perform the mapping.  The priority is to allow some overriding over the mapping process.  The mappers allows support inheritance, so you could define a mapper for a Post (even though Post is an abstract class), and you could also define one for ForumPost.  When a ForumPost object is mapper, both will be executed.</p>
<p>Additionally, you can define multiple mappers for the same type and the order of execution is set with the Priority value.  All built-in mappers have a priority of 10, so if you wanted all post bodies to be indexed in lower case (for instance), you could define a mapper with a priority of 20, so it will run after the default one, remove the Body field, and then re-add it as lower case.</p>
<p>Our Book search mapper would look something like this:</p>
<pre class="brush: c-sharp;">
using Telligent.Search.Mapping;

namespace BookSample
{
  public class BookMapper : DocumentMapper
  {
    public override void Load()
    {
      Map&lt;Book&gt;(book =&gt;
        {
          book.ISBN.MapTo(&quot;ISBN&quot;).Key();
          book.Title.MapTo(&quot;Title&quot;);
          book.Description.MapTo(&quot;Description&quot;);
          book.Author.Name.MapTo(&quot;AuthorName&quot;);
          book.Price.ToString(&quot;0.##&quot;).MapTo(&quot;Price&quot;);
        });

      Rehydrate&lt;Book&gt;(isbn =&gt; Books.GetByIsbn(isbn));
    }

    public override int Priority
    {
      get { return 10; }
    }
  }
}</pre>
<p>A few things to note:</p>
<ol>
    <li>The Load() method includes calls to the Map<t>() and Rehydrate<t>() methods, where you define an Action/Func block for the corresponding type.  This may sound funky, since we have gotten some questions about why we just didn't have something like DocumentMapper<t>.  We didn't really want to limit a mapper definition to a single type, we wanted them to be more &quot;scriptable&quot;, where you could clear or remove existing mappings and redefine your own, and we wanted a more fluent syntax so Map<book> says &quot;I'm mapping a Book&quot; where Map<author> says &quot;I'm mapping an Author&quot;.  It could have been done either way, we just ended up with it this way.</author></book></t></t></t></li>
    <li>In the Map call, you are passed in a variable which is the actual object you will be mapping.  The action block is called at a later time, and when it is, the Book that needs mapping will be passed in, so you can access is just as you would anywhere else in your code.  To add a field onto the search document, all you need to do is use the MapTo() extension method on whatever you want to add and specify its name in the search document.  So we have a property for book.Title and in the search document we want it named &quot;Title&quot;, so we call book.Title.MapTo(&quot;Title&quot;).</li>
    <li>All search documents need a Key.  This is whatever the original ID was of the object.  If and object is mapped and none of its mappers set a Key, it will throw an exception.  This is required because if the object is later reindexed, it uses a combination of the type (Book) and the key (the ISBN value) to remove the old document from the index and add the new one.  Additionally, we provide a way so if you have a search document, you can &quot;rehydrate&quot; it and get the original object (see later points).</li>
    <li>Again, the MapTo just needs to be whatever final value you want added, so if you want to add something from another object, just access it.  In this case, book.Author represents another class type.  We don't want to index it, we just want to include the author's name.  All you need to do is call book.Author.Name and then use MapTo on it.  In most cases, our fields in the search document map the property name, but in this case we want to use &quot;AuthorName&quot; so it is a clearer it doesn't relate to the book.</li>
    <li>And for a third time, MapTo is called on the value, so it can also be manipulated.  With book.Price, it is a double and we always want it indexed with two decimal places.  Simply need to call the ToString() on it and format it how you wish, then call MapTo on that.</li>
    <li>MapTo can be used on any type, as it is an extension method for &quot;object&quot; and not just common types like string, int, etc.  However, if MapTo is not a string, it will call ToString() on it to convert it.  This is to make the mappings a little less verbose like post.PostID.ToString().MapTo(&quot;PostID&quot;), but it also means it will adhere to some defaults and if you want a specific format, you need to convert it yourself.  Additionally, if you try to map a custom class, like the Author one mentioned earlier, it will call Author.ToString(), which if you haven't defined in your class, the field will likely be useless to you.</li>
    <li>And finally, after the call to Map<book>, we also define Rehydrate<book>.  This takes the key we previously set in the mapping, and allows to you define a function that can take that original key and return your object.  This is useful in cases where you have a search document representing the Book, but want the full object.  Be aware though, it can have performance costs.  If you have 20 search results and look through each one, rehydrating them to display some data, that might be 20 DB calls.</book></book></li>
</ol>
<p>In the next post, will go over how to implement the content handler for your new type.</p>
         
