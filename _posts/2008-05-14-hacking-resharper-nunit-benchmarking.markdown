--- 
wordpress_id: 388
layout: post
title: Hacking ReSharper + NUnit + Benchmarking
wordpress_url: /code/hacking-resharper-nunit-benchmarking/
---

<p>This may seem a little bit off the wall, but one thing I've been starting to do lately is instead of littering my Projects directory with a bunch of ConsoleApplicationN folders, I've started using the unit test runner within ReSharper to fire up quick little sample things I need.  Most often, they're simple things where I just need to see the output of a particular method, or quickly be able to debug into it with some fixed inputs, etc.  It is not really what unit testing is for, but I find it to be the simplest way to execute something without having to launch another Visual Studio instance or open Snippet Compiler (nothing against it, but I prefer VS+ReSharper).</p>

<p>Though a few days ago, I found myself wanting to benchmark some code I'd written.  And I've encountered this a couple of times before... I run some unit tests and what not and I just want to know how long did it take to run.  Often when running the entire test suite on the REST API in Community Server, I walk away for a few minutes (its like 800+ tests), so sometimes curious how long particular ones took when I come back.  In this case, I refactored a method and wanted to see the improvement (ie, run it a million times to get a discernible difference).</p>

<p>ReSharper's unit test runner for NUnit doesn't support this out of the box, but two of the greatest gifts to .NET has to be Lutz Roeder's <a href="http://www.aisto.com/roeder/dotnet/">Reflector</a> (which we all know and love) and the <a href="http://www.denisbauer.com/NETTools/FileDisassembler.aspx">File Disassembler</a> from Denis Bauer came to the rescue.</p>

<p>Friday afternoon, decided to dive in to do a little hacking.  I happened to notice that the JetBrains.ReSharper.UnitTestProvider.nUnit.dll was not obfuscated when reflecting into it.  Then it dawned on me: disassemble it, make my own assembly, and add basic run time output to it!</p>

<p>First, run the File Disassembly on the DLL.  Open it up in Visual Studio (convert the project if needed), and then try to compile.  You'll likely get a number of errors because it tends to name some variables with a dollar sign ($).  Just take out the dollar sign and you're good.</p>

<p>Second, do a find and replace on the namespace to be your own and change the project output assembly to be your own.  Then open up the NUnitTestProvider class and change the value of the NUNIT_ID and the ID property on the class (I used "Invalid nUnit").  You'll also want to open the ProductInformation class and update some of the strings.  This may not be necessary, but I didn't want any conflicts on anything it would look up.</p>

<p>Now to use your own assembly, you need to go the ReSharper directory and create a PlugIns directory, and then a subdirectory to that (again, I chose "Invalid nUnit") and put your DLL in there.  You also need to create an XML file with the same name as the dll and paste this:</p>

<pre><code>&lt;?xml version=&quot;1.0&quot;?&gt;
&lt;doc&gt;
  &lt;assembly&gt;
    &lt;name&gt;InvalidLogic.UnitTestProvider.nUnit&lt;/name&gt;
  &lt;/assembly&gt;
  &lt;members&gt;
    &lt;member name=&quot;T:InvalidLogic.ProductInformation&quot;&gt;
      &lt;summary&gt;
        Specifies product information
      &lt;/summary&gt;
    &lt;/member&gt;
  &lt;/members&gt;
&lt;/doc&gt;</code></pre>

<p>Replace the assembly/name and the member:name with your own namespaces and such.</p>

<p>Now when you launch Visual Studio and go to the ReSharper Options / Unit Testing, you should see your provider.</p>

<p><img src="http://img.skitch.com/20080514-df6crmcbj5r9dh64yxs3i5a5sd.jpg" width="222" height="122" /></p>

<p>But now, we need to add benchmarking!</p>

<p>This is admittedly very simplistic benchmarking, but just wanted to know some basic information about how long it took to run.  Within your disassembled project, find the NUnitTaskRunner, and in the private static Execute method, update the main try block to the following:</p>

<pre><code>long beginTicks = -1;
long endTicks = -1;
try
{
  beginTicks = DateTime.Now.Ticks;
  TaskExecutor.Invoke(instance, testMI);
  endTicks = DateTime.Now.Ticks;
}
catch (TargetInvocationException e)
...</code></pre>

<p>Then at the end, before it returns, add the following:</p>

<pre><code>if(beginTicks &gt; -1 &amp;&amp; endTicks &gt; beginTicks)
  server.TaskOutput(test, &quot;Processing Time : &quot; +
      new TimeSpan(endTicks - beginTicks).TotalSeconds +
      &quot; seconds&quot;, TaskOutputType.STDOUT);
return TaskResult.Success;</code></pre>

<p>Compile, update the PlugIns folder, relaunch Visual Studio, and you should be ready to go!</p>

<p><img src="http://img.skitch.com/20080514-8pd6ywhx74ukhem8gcggmu97d4.jpg" width="563" height="442" /></p>

<p>Given that I had to disassemble one of their assemblies, I am not going to be distributing my change at all.  I think I'd get in some legal trouble distributing a reverse engineered library.  Though I figure sharing this information isn't harmful.  I'm sure they'd like to see more unit test providers for it, and I'm encouraging the use and enjoyment of ReSharper.</p>
         
