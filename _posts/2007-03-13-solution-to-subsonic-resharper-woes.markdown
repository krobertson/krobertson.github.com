--- 
wordpress_id: 290
layout: post
title: Solution to SubSonic + ReSharper woes
wordpress_url: /archive/solution-to-subsonic-resharper-woes/
---


<p>After doing some digging, I managed to figure out what turns out to be a pretty good solution to ReSharper not playing well with SubSonic.&nbsp; Ultimately, the annoyances fall down to ReSharper&#39;s intellisense and syntax highlighting not picking up the classes from SubSonic&#39;s generated code.&nbsp; A good way around it is to actually have code get generated, and luckily, it can be done in a way that is pretty easy to setup, manage, and doesn&#39;t take away from the nice features of SubSonic.</p>
 
<p>The answer is the <a href="http://www.devinstinct.com/Eng/code.htm">SubSonic Custom Tool</a>.&nbsp; Visual Studio allows you to specify a &quot;custom tool&quot; that is used on a file within one of your projects.&nbsp; The SubSonic Custom Tool is just that.&nbsp; What it does is on command, it generates the necessary classes based on the SubSonic configuration and your database.</p>
 
<p>Its installation isn&#39;t necessarily the best, since it just tells you to run this &quot;install.bat&quot; (I don&#39;t consider that a very good installer), but it doesn&#39;t do a whole lot to where it is dangerous or hard to undo if you wanted to.&nbsp; If you are running Vista, probably need to run it from a command prompt that is in administrator mode.</p>
 
<p>So anyway, what do you do?</p>
 
<ol> 
<li>Rename you web.config with your SubSonic settings to subsonic.config (easy enough).</li>
 
<li>In the Solution Explorer, go to your *.abp file, go to its properties, and change the &quot;Custom Tool&quot; field to &quot;SubSonicCustomTool&quot;.</li>
 
<li>You are done.&nbsp; This is just a filler.</li>
</ol>
 
<p>The Custom Tool generates a code-behind file for your abp file and you are set&nbsp;(may need to set its Build Action to compile... had to do that one time when trying it out in different projects).&nbsp; Now, has your database changed, so you need to update the code-behind again?&nbsp; Simply right click on your .abp file and select &quot;Run Custom Tool&quot; and the code will be updated.</p>
 
<p>A few things to keep in mind:</p>
 
<ul> 
<li>When using plain &quot;website projects&quot; in Visual Studio, you can&#39;t specify the build action or custom tool fields on any files.&nbsp; Those options aren&#39;t exposed.&nbsp; You would have to create a separate class assembly project, move the subsonic.config and abp file there, and then reference it on your website.</li>
 
<li>The custom tool procedure <i>does</i> work on Web Application Projects.&nbsp; You can have the abp file in the Web Application Project, right alongside your pages and code, since you can specify the build action and custom tool.</li>
 
<li>With this, you can even use SubSonic in WinForms and other EXE-compiled executables in .NET.</li>
</ul>
<p><i>Update:</i> In case it wasn&#39;t clear, it needs to be a simple web project + a DLL <i>or</i> a web application.&nbsp; It doesn&#39;t need to be a web application <i>and</i> a DLL.&nbsp; The extra DLL is only needed to make it work with the simple web projects.</p>
         
