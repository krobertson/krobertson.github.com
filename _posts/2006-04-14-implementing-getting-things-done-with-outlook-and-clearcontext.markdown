--- 
wordpress_id: 133
layout: post
title: Implementing Getting Things Done with Outlook and ClearContext
wordpress_url: /archive/implementing-getting-things-done-with-outlook-and-clearcontext/
---

<p>I've been reading through (Getting Things Done)[http://www.davidco.com/] and I have been anxious to start collecting all of my "stuff".  One of the biggest problems I've found is that initial purge of everything you could possibly have to take action on.  It is hard to force yourself to thing of everything that inital time.  The second problem is coming up with a complete, reliable "trusted system" at the beginning.  The trusted system is supposed to hold all my stuff, and I only want to have to input/set it all up once, so I don't want to change my mind in a week and use something else.</p>

<p>I started by checking out (MyLifeOrganized)[http://www.mylifeorganized.net/] and liked it at first.  Its key benefit is its hierarchial task structure.  After using it for a short while, I quickly noticed a number of problem points though:</p>

<ul>
<li><p>I don't really care for its views.  Its Projects and Views panes are very nice, but would be nice to have them combined some way.  And its ToDo tab has no hierarchy to it.  Using the Places as Context seemed kind of ad hoc and not nicely exposed in the main view.</p></li>
<li><p>I want to be able to view the same information on my XV6700 as well, and they have a PPC version, but not a very attractive solution.  Mentions some issues with WM5, needing a separate license, export/import is laborious, and currently only a beta with nothing solid on a final version.</p></li>
<li><p>It supports syncing with Outlook, but you completely lose the nice hierarchy when syncing.  I have a project called "Finish NNTP Server v2.1", with some subtasks, and then in outlook, the project and subtasks are all on the same level since Outlook has no hierarchy.  MLO could have done some fancy work with categories/views or something to at least try and maintain the hierarchy.</p></li>
<li><p>A lot of my tasks come as a result of emails.  Someone emails me "take a look at this", so I set up a task to "take a look at this".  This is made quite nicely through the use of ClearContext v2.x, but then I am creating tasks in two buckets.  I'd have to create the task with ClearContext, sync it to MLO, then put it with a project and all.  Kind of laborious.  MLO itself doesn't seem to have a nice way to link/reference the emails directly.  So kind of feel like I am losing something.  Want the task to nicely reference the email and utilize everything ClearContext adds, but want a more fully featured task environment than what Outlook has.  Well, can't have everything.</p></li>
</ul>

<p>So it is looking like MLO won't fill my needs.  I already have a vested interest in ClearContext (I bought it and have been already using it) and do not want to give it up for anything.  So have been coming up with a way to handle everything around it.</p>

<p>In future versions of ClearContext, it should become quite a bit easier as one of the highly request features is extending the properties directly to the Task object, so that can be a part of the Task View.  Once I have that, I will be in heaven.</p>

<p>In the meantime, I have come up with my own way of organizing things.  I wanted to use what was already there in Outlook and to fit the GTD concepts around it.  Things don't fully line up, but for my own personal needs and uses, I could easily bend them to fit within Outlook</p>

<p>In GTD, a part of it involves breaking tasks up by context, priority, time available, and energy available.  The context is basically things like "at the office", "at home", "on the road".  Part of the goal of GTD is to capture everything in your life, from gardening, groceries, projects, coding, conference calls, anything and everything.  So you can have different contexts, like doing gardening when at home, and conference calls while in the office, and coding while you have a computer.  For me, my context is almost always the same.  I work at home, so my office is my home.  I can simply create a category/project for "Errand" stype actions, so I can essentially get rid of contexts.</p>

<p>Now, I basically have two key criteria to group by... priority and project (errands being a project).  Priority is commonly things like Urgent, Day, Week, Month, Year, and Someday/Maybe (I am skewing the filing system slightly, but only to get it to fit in with the software).  Unfortunately, Outlook has only 3 levels of priority.  Things that are like Urgent will be marked as High priority, Day will be Normal with a due date or be a scheduled item on the calendar, Week/Month will be Normal, and Year/Someday will be Low priority.  I then set the category on all of my tasks to be the project, such as "Community Server", "Mail Gateway", all the way down to "Errands" and "Personal".  In cases where I need things like "@Waiting For", I just set the status to be "Waiting on someone else".</p>

<p>I then set up a customized tasks view with the fields Complete (checkbox), Priority (an icon), Attachment (an icon), Subject, Categories, Status, Total Work, % Complete, and Due Date.  I then set it to group by Priority descending and Categories ascending.  Finally, it sorts by due date descenting, % complete descending, and total work ascending.</p>

<p>Overall, this should suit me quite well as an introduction system to GTD.  In time, future versions of ClearContext should enable me to better expose the custom fields so I can do a more clearer Category/Topic grouping to link up with GTD's concept of Action/Project.  Overall though, I am quite impressed with ClearContext v2.0 now that I'm using its tasks features.  Next would be to look into using ActiveWords.</p>

<ul>
<li>ClearContext has an ActionView to show Categories/Topic type grouping, but I am not very font of it and prefer the standard task view.  Additionally, I don't have ClearContext on my laptop because of a known issue of using ClearContext on two machines when Outlook is open on both at the same time (as I frequently do, and am doing right now).  So I can't use the ActionView from my laptop.</li>
</ul>
         
