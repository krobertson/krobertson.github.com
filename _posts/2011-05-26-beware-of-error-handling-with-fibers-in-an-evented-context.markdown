--- 
layout: post
title: Beware of error handling with fibers in an evented context
---

One of the more interesting developments in Ruby lately has been the interesting things being done with Ruby 1.9.2, Fibers, and EventMachine.  Whether you look at it being applied to existing libraries with [rack/fiber\_pool](https://github.com/mperham/rack-fiber_pool), or [Goliath](https://github.com/postrank-labs/goliath), it packs a punch and proving interesting for high performance evented applications.

Recently when reworking one of our backend applications to use rack/fiber\_pool with EventMachine, I ran into a gotcha when it came to exception handling.  Asynchronous applications makes heavy use of callbacks, where the context of when an operation is completed is not inline with when it began.  Fibers work to make it easier to write asynchronous code look like synchronous, where you make a call, and it returns a result.

The problem is that this can play a trick on your eye.  You think you are executing something in line, but the context it is operating within jumps without you being necessarily aware of it.  Take the following example:

{% highlight ruby %}
require 'eventmachine'
require 'em-synchrony'
require 'fiber'

def doit
  f = Fiber.current
  EventMachine.add_timer(1) { raise 'uhh ohh' }
  Fiber.yield
end

EM.synchrony do
  begin
    puts "beginning"
    doit
    puts "end"
  rescue Exception => e
    puts "ERROR: #{e.message}"
  ensure
    puts "Have a nice day"
  end
  EventMachine.stop
end
{% endhighlight %}

From looking at the main block, you have the call to doit wrapped in a begin/rescue, so it seems logic that if an error was raised within it, the rescue block would capture it and handle the error.  Unfortunately, the error it being raised outside the context of the fiber, so it isn't caught.  You are outside the context of the fiber in the time between when `Fiber.yield` is called and `f.resume` is called.

Why is this context important?  Because when we built applications, we want them to be resilient.  For instance, if a web request encounters an error, we want it caught, reported either to a log or a service, a response returned to the user, and then it be ready to handle the next request.  However outside the context of the fiber, the error handling we've built in won't get called and the application can exit.  Even if the application is monitored with god, existing connections will get closed out and connections won't be served while it is restarting, and the valuable information within the error is lost.

Once the fiber is resumed, the error handling functions as expected.

{% highlight ruby %}
require 'eventmachine'
require 'em-synchrony'
require 'fiber'

def doit
  f = Fiber.current
  EventMachine.add_timer(1) { f.resume }
  Fiber.yield
end

EM.synchrony do
  begin
    puts "beginning"
    doit
    raise 'uhh ohh'
  rescue Exception => e
    puts "ERROR: #{e.message}"
  ensure
    puts "Have a nice day"
  end
  EventMachine.stop
end
{% endhighlight %}

In this case, the exception will be caught and handled, and you will make it to the "Have a nice day" message.

In order to handle the error, you can add some exception handling within the main context, or the root fiber.

{% highlight ruby %}
begin
  EM.synchrony do
    begin
      puts "beginning"
      doit
      puts "end"
    rescue Exception => e
      puts "ERROR: #{e.message}"
    ensure
      puts "Have a nice day"
    end
    EventMachine.stop
  end
rescue Exception
  puts "We caught something outside a fiber!"
end
{% endhighlight %}

However, I haven't yet figured out how to have the same thing done in the context of a web app.  So far, I've just ensured I have proper error handling in the callbacks before the fiber is resumed.  Trying to put a begin/rescue block in the config.ru doesn't seem to have any effect on rescuing an error.

The moral of the story is when using fibers, be conscious of error handling outside the context of the fiber.  Unhandled exceptions there can cause the entire application to exit.  Be aware you have proper error handling when doing something that yields a fiber, and whether they fiber-enabled libraries you are using have error handling outside the context as well.