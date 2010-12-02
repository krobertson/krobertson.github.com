--- 
wordpress_id: 427
layout: post
title: Branding Gone Wild
wordpress_url: /software/branding-gone-wild/
---

<p>Typically, branding is a good thing.  It brings you recognition, people remember your product/company, and you hope all that translates into sales.  But branding can also be over done.  Take for example, <a href="http://www.smartassembly.com/">Smart Assembly</a> (or rather &quot;{smartassembly}&quot;) which was acquired by Red Gate back in September.  Don't get me wrong, Smart Assembly makes and awesome product, but the whole &quot;{...}&quot; thing has been over done.</p>
<p>For example:</p>
<ol>
    <li>All emails from them use &quot;{smartassembly}&quot;.  Even one hand typed support response did.</li>
    <li>The <a href="http://www.red-gate.com/About/news/red_gate_acquires_smartassembly.htm">press release</a> when Red Gate acquired them uses &quot;{smartassembly}&quot;.</li>
    <li>The MSI you download is &quot;{smartassembly}.Setup.msi&quot;</li>
    <li>The default install location is &quot;C:\Program Files\{smartassembly}&quot;</li>
    <li>The executables are &quot;{smartassembly}.exe&quot; and &quot;{smartassembly}.com&quot; (.com is the command line runtime)</li>
    <li>And yes, the project files you save are &quot;.{sa}proj&quot;.</li>
</ol>
<p>The branding can also get in the way of using the product.  Smart Assembly is an obfuscation tool, so it would seem reasonable to integrate into your build process.  NAnt is of course a popular tool for automated builds.  NAnt scripts use $&quot;{...}&quot; to denote variables.  While this doesn't create a conflict, in my opinion, it clouds your scripts with excess brackets and takes away from the experience. <em>(Note: I originally said it conflicts with using NAnt, I was wrong, since I jumped ahead of myself forgetting that it needs a '$' too)</em></p>
<p>Branding is cool and all, but when it gets in the way of your user experience by overuse, its gone a bit too far.</p>
         
