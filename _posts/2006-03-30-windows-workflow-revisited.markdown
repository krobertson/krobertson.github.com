--- 
wordpress_id: 123
layout: post
title: Windows Workflow Revisited
wordpress_url: /archive/windows-workflow-revisited/
---

<p>After my <a href="http://qgyen.net/archive/2006/03/22/1534.aspx">attempt last week</a> at figuring out the Windows Workflow Foundation, and chatting with <a href="http://www.coveryourasp.net/">James</a> about <a href="http://www.coveryourasp.net/Technical/WorkflowwithWF">his experiences</a>, I revisited my previous attempts and this time came out much better.</p>

<p>First, I was dead on with one of my problems last time.  I was using it to describe the functional workflow when I should have been using it at a higher level to control the overall logical flow.  Once I adjusted that, things flew so much smoother.  I actually got a full functioning workflow that actually does some useful stuff.  Created a number of custom activities, used some eventing, and it all worked smoothly.</p>

<p>Once you get the basics down, it is actually a pleasure designing things as a workflow.  You simply create these sandboxed activities that perform a certain task and then wire them all up.  It allows you to program the pieces of a program without worrying about how they connect right up front.  All to often, it is easy for code to get burried into a mess of if statements or functional calls.  It is much easier when you simply have to think ok, I need something to poll for messages, I need something to process a message, I need something to send a response.</p>

<p>There are a few annoyances... like the bug where you can not use an InvokeWorkflow activity to call another workflow in the same assembly, it has to be in another assembly.  That one is annoying.  Another thing I am not fond of is that InvokeWorkflow triggers the workflow off asynchronously.  I want it to be able to block until the workflow is completed.  The only way to do this is to use a SequentialActivity, not a workflow.  But for better pluggability, I think it would be nice for it to handle both activities and workflows as blocking or non-blocking.  Surely, it is possible, so going to look at writing an activity to do just that.</p>
         
