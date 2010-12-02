--- 
wordpress_id: 500
layout: post
title: Selenium Server in NAnt
wordpress_url: http://invalidlogic.com/?p=500
---
When configuring our <a href="http://seleniumhq.org/">Selenium</a> tests to run out build server, one issue I ran into is that there wasn't a lot out there in terms of how to get this set up.  A few people had posted about having done it, but not how they did it.  Overall, it isn't incredibly difficult, but there are a few things that I got hung up on.

The way we run it is we start the selenium server in the background, and then have NUnit tests that run the stories.  We can't start Selenium in the foreground because then we couldn't move on to the NUnit tests, but we also needed to register it as a Windows service on demand.  To do that, we used a utility called <a href="http://iain.cx/src/nssm/">Non-Sucking Service Manager (NSSM)</a>.  It is like <em>srvany</em> from the Windows Resource Kit, but it works on Windows Server 2008 (and there was no publicly available Windows Resource Kit for 2008 I could find).

Here is our setup/teardown <a href="http://nant.sourceforge.net/">NAnt</a> targets:

{% highlight xml linenos %}
<target name="start.selenium">
  <property name="jdk.bin" value="${environment::get-variable('JDK_BIN')}" />
  <exec basedir="${common.folder}" program="nssm.exe" commandline='install Selenium "${jdk.bin}\java.exe" "-jar ${source.folder}\libs\selenium-server.jar"' />
  <exec program="net.exe" commandline="start Selenium" />
</target>

<target name="stop.selenium">
  <exec program="net.exe" commandline="stop Selenium" failonerror="false" />
  <exec basedir="${common.folder}" program="nssm.exe" commandline="remove Selenium confirm" failonerror="false" />
</target>
{% endhighlight %}

On top of that, it is important to set the "nant.onfailure" property to a target that does all of your cleanup.  Since we're using NUnit, an error in the unit tests will signal a build failure, but we still want to ensure our cleanup runs.  So set the "nant.onfailure" property to the name of a target that runs all cleanup tasks (including "stop.selenium").

Proper cleanup is very important, since in our case, the selenium.jar is in with the source and if it is still running, Team City will be unable to cleanup the working space and cause it to instantly fail any future builds before it even gets to executing your script.  Because of this, it might also be good to have the server do a scheduled task that calls "net stop Selenium".  If it is stopped already, no harm, if the service doesn't exist, no harm, but just a bit of an extra measure.  And finally, to be extra extra safe, I actually call our main cleanup target at the beginning of the build as well and set failonerror="false".  Since we're registering and running background processes, didn't want the test to be brittle and need my intervention.  I don't want "Ken, can you fix the build" emails.

So few things to point out about using it:

<ul><li>One thing I got hung up on, you need the quotes around the "-jar ..." parameter on the exec line to nssm.exe.  I was missing that originally and wasted a lot of time, since I'd see the Java process start and be running in the process list, but couldn't communicate with the Selenium server.  The "-jar ..." line is a the parameter to java.exe though, and not nssm.exe, so it needs to know it is all one parameter.</li>
<li>We have the location of the JDK set in the environment variables.  I don't like hardcoded paths in the scripts.</li>
<li>Be careful of quotes!  I had to have the JDK_BIN set to a property because otherwise I'd get down to invalid quotes.  You can't have commandline='...."-jar ${environment::get-variable('JDK_BIN')}"'.... the second set of single-quotes will be closing the first one, not opening a new set.</li>
<li>The "common.folder" and "source.folder" are just properties pointing to where some common utilities are and the current working directory for the source.</li></ul>
