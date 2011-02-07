--- 
layout: post
title: How a deprecated method can take down a process
---

At Involver, we have a pretty active background processing tier that handles a variety of things from long running tasks we don't want in the web app, pulling in content from external sources, and simple recurring maintenance tasks.

Previously, we ran a single worker thread per JVM, but that setup lead to a low worker per system density since it sucked up a lot of memory.  A few months ago, we came up with a way to run multiple workers within a single JVM and have it nicely thread safe by using a small embeddable JRuby VM started off the main process.  This worked excellent and doubled the number of workers we could run per machine, since they could share heap space.

But then we recently began experiencing an issue where all the threads would just halt processing.  No errors, seemingly nothing wrong.  Heap usage was fine and a thread dump showed them seemingly ok, but they just sat.  We tried attaching a profiled, however it ended up just output garbage when we tried to have to dump its data after it got stuck.

After 2 days of investigation, finally managed to tracked the cause down to the fact that a change a few days before had caused us to start running over a function that used a deprecated method call, and the change meant we were hitting that line 500-1000 times per minute.

<div style="float:right; margin-top: 5px; margin-left: 10px; margin-bottom: 5px"><img src="http://invalidlogic-blog.s3.amazonaws.com/gru-light-bulb.jpg" width="400" height="231" title="not a light bulb, but still very shiny" /></div>
At first, we suspected maybe JRuby had some sort of thread concurrency issue with calling deprecated methods, but that made no sense.  All calling a deprecated method does is write to the console!

As Gru in Despicable Me would say... "Light bulb!"

When running a single worker in console, we saw the warnings, but when running the multiple workers per JVM, we saw none.  The rabbit hole gets deeper and fortunately lead us to the solution and were able to confirm the issue and resolution.

The way we spawned the child threads, we found stdout/stderror was not attached to anything.  They make use of buffered IO though.  There is a fixed buffer size, and if you try writing more than that, it will block on writing to it until the buffer is read from and space is freed.  Since nothing was reading from it though, the threads would simply block indefinitely on writing out the deprecated method calls.

So we set up a test.  We created the following class on one of our boxes and spawned up the multi-worker process.

{% highlight ruby %}
class Awesome
  def self.kill_me_softly
    loop do
      puts "a" * 1024
      Rails.logger.info 'Alive!'
    end
  end
end
{% endhighlight %}

It came up, but would get hung in less than a second.  Simply do no more.  One threads would lock up independently, one by one.  So the whole JVM wasn't frozen, just that child thread.  Hence why they all died at different times, but very close together.

Then to confirm even more and fix it, we changed the multi-worker process to reopen the stdio handlers on child threads:

{% highlight ruby %}
STDIN.reopen "/dev/null"
STDOUT.reopen "/dev/null"
STDERR.reopen "/dev/null"
{% endhighlight %}
 
Spawn one back up, and it begins streaming to no end, no lock ups, no problems.  Success!

In the end, we changed the function to no longer use the deprecated method, and had the multi-worker process redirect stdio for child processes to an actual file, so that way we can actually log any valuables messages we might be otherwise missing.  But that is hopefully the first and only time something as off as stdio buffering takes down a process.
