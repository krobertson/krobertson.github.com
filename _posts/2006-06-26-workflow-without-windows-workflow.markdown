--- 
wordpress_id: 163
layout: post
title: Workflow without Windows Workflow
wordpress_url: /archive/workflow-without-windows-workflow/
---

<p>Recently, I decided to dive into working with Windows Workflow some more.  It had been while since I had done anything with it and I'd noticed that a new version came out with the May Beta2 of .NET Framework 3.0.</p>

<p>Overall, I must say that I am disappointed.  Windows Workflow <em>will be</em> great, but it isn't there yet, and quite frankly, is rather painful to use at this point.  After feeling some pains, came up with a nice, but not as glamorous compromise.</p>

<p>Previously, I'd just been messing around with creating some basic activities and looking at some of the sample ones.  This time, I decided to create some actual useful ones.  Since I'm looking at using Windows Workflow in a future version of Mail Gateway, I figured I'd create a basic workflow to poll for messages, and then it would invoke another workflow to being some basic processing.  Easy enough, right?</p>

<p>For starters, there is a bug with the InvokeWorkflow activity has a bug where you cannot invoke a workflow in the same assembly, it has to be in a separate assembly.  I was hoping that one had been fixed already, but to my disappointment, it wasn't.  Secondly, once I did break my workflow into two assemblies, I still couldn't get my program to compile.  There weren't any apparent errors, but when compiling it would have error having to do with not being able to find the definition for the library.  Everything compiled fine individually, but even though the dialog to find that target workflow saw my second workflow, it would compile against it.</p>

<p>I decided to take the InvokeWorkflow out, change my second workflow to a sequential activity, and just not have any parallel processing for now.  Then, my next issue noticed is that every time I changed the namespace or name of an object (which I did a few times, as I like logical names), I had to close and re-open the project.  Often, the designer mode for the workflows and the sequential activity would get locked on an object's full type once it is created.  So I'd have to close Visual Studio and reopen it.</p>

<p>Then, when I finally thought all my woes were over, and I was able to finally fire up my little application, I realized I was wrong once again.  I could only fire up the application in the debugger once per session.  Yup.  Fire it up, try it out, notice something wrong or slightly off, close it change the code, close Visual Studio, re-open Visual Studio, build, and then run.  If I tried to build again without closing and re-open, Visual Studio would get pissed at me and not behave.</p>

<p>I think there is a ton of potential to coding with workflows.  But I think Windows Workflow adds a rather large layer of complexity to it.  The thought process of a workflow is what I am drawn to… dividing code into separate small “activities” rather than functions, and having this one place where they are all cleanly wired together.  Doing this does not require Windows Workflow.  The biggest two benefits of Windows Workflow is the built-in ability of being dynamic (ie, can pretty easily change and swap around pieces of the workflow, or the whole thing), and secondly, its visual designer, which is a visual way of viewing it, rather than code based.</p>

<p>The less glamorous, but simply effective way of utilizing workflow is simply model your classes through the mindset of the workflow process.  Just as you may create a folder or portion of your namespace for components, objects, controls, or enumerations, you should create one for activities and one for workflows.  In activities, you create a class for each activity that you would have with your workflow, with just an Execute() method.  Pass in any parameters you need, and return whatever it outputs.  Your activity could be poll POP3, validate user, convert message, etc.  Keep them simple and logical.  Then once you have your activities, you create the workflow class.  The workflow class should be very simply and just focus on connecting the activities together.  You loop and call poll POP3, when it returns something valid (like not null), you validate user.  If the user is valid, then you call to process message.  When that is done, you return back to poll POP3 until a new message is ready.</p>

<p>So while I spent easily about 3 hours utilizing Windows Workflow to <em>try</em> and get what I wanted, with a bunch of obstacles and frustrations, I spent a mere 20 minutes coding in the simple workflow mindset and got the same (or even better) result.  My code ran without any conflicts, compiler complaints, or needs to close Visual Studio.</p>

<p>I really do want to use Windows Workflow, and I think it has a ton of potential  My main hope is that the team will rise to the occasion and  show consistent progress so that the final release is something everyone could use without gritting their teeth.</p>
         
