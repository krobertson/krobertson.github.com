--- 
wordpress_id: 243
layout: post
title: A day of hacking later...
wordpress_url: /archive/a-day-of-hacking-later/
---

<p>After a day of hacking on <a href="http://qgyen.net/archive/2006/11/30/Xmas-Light-Mania-2007-_2800_yes_2C00_-2007_2900_.aspx">my idea</a>, I now have some results.</p> <p>For starters, think I am going to go the <a href="http://www.atmel.com/">AVR</a> route as opposed to <a href="http://microchip.com/stellent/idcplg?IdcService=SS_GET_PAGE&amp;nodeId=64">PIC</a>.&nbsp; In checking out the current state of things, AVR seems to be the hot new kid on the block, and PIC is kind of limping, in my opinion.&nbsp; Their online community is horribly outdated.&nbsp; The big player that used to be <a href="http://piclist.com/techref/piclist/index.htm">PIClist</a> is now old, out dated, and broken.</p> <p>While the mini controllers will likely take me some time to get some of the parts and begin hacking on it, I decided to dive into writing the master controller software that will run on the PC.&nbsp; I have to admit, I am somewhat disappointed... I thought it would be harder, but I already have it working.&nbsp; Granted, right now it just a coding API, though will add the ability to save/load scripts and maybe, if I really get bored, code a GUI to do the layout.&nbsp; But as it is right now, have some simple coding looking like this:</p> <blockquote><pre class="csharpcode"><span class="kwrd">static</span> <span class="kwrd">void</span> Main(<span class="kwrd">string</span>[] args)
{
    Sequence sequence = Sequence.Create();
    Device device = sequence.CreateDevice(<span class="str">"10.0.0.1"</span>);

    LightDurationEvent light1 = sequence.CreateEvent&lt;LightDurationEvent&gt;(device);
    light1.StartTime = 0;
    light1.Channel = 1;
    light1.Duration = 1000;

    LightDurationEvent light2 = sequence.CreateEvent&lt;LightDurationEvent&gt;(device);
    light2.StartTime = 500;
    light2.Channel = 2;
    light2.Duration = 1000;

    LightDurationEvent light3 = sequence.CreateEvent&lt;LightDurationEvent&gt;(device);
    light3.StartTime = 1000;
    light3.Channel = 3;
    light3.Duration = 1000;

    LightDurationEvent light4 = sequence.CreateEvent&lt;LightDurationEvent&gt;(device);
    light4.StartTime = 1500;
    light4.Channel = 4;
    light4.Duration = 1000;

    sequence.Execute();
}</pre></blockquote>
<p>Can also add other event types, such as an AllLightsEvent, which will turn all lights on or off.&nbsp; Also going to work on making it more extensible, so I can have different types of devices that handle different events... ie, maybe I have a device that controls a servo motor or something.&nbsp; We'll see.&nbsp; Right now, most of the implementation details are up to the events.&nbsp; When Execute is called, it turns the events into a series of commands (ie, turn light on at 0ms and turn it off at 1000ms... 2 commands).&nbsp; The commands are basically comprised of when they happen, which device the command goes to, and the raw byte[] for the command.&nbsp; The byte[] is what is actually sent to the device over the network, so allows we to send just about anything to it.</p>
<p>The one thing I haven't got working is broadcasting... I send the commands using UDP, so can do broadcasting/multicasting.&nbsp; The packets seem to send ok (though not actually running a packet sniffer), but the problem was I couldn't get my test receiver to receive broadcast messages.&nbsp; Ohh well, no biggie right now.</p>
<p>One thing I should mention... I love generics in C# 2.0... so love them.&nbsp; The "sequence.CreateEvent&lt;LightDurationEvent&gt;(device)" would otherwise have been "sequence.CreateEvent(typeof(LightDurationEvent), device) as LightDurationEvent".</p>
<p>Going forward, have two concerns:</p>
<ul>
<li>Should I change from UDP to TCP?&nbsp; Losing packets with UDP could suck, but I think the overhead to handle that in TCP might be too much too.</li>
<li>Timing... can see timing becoming an issue when it goes along with music.&nbsp; Say I turn a light on for 100ms, then turn it off.&nbsp; I will be on more than 100ms... there the delay with the PC processing, sending over the network, and the mini-controllers acting on the command.&nbsp; Probably very minute, but when there is a long series of commands, closely tied to music, wonder if it would cause them to get out of sync.&nbsp; Moving to a dedicated master controller (non PC) may be better option eventually.&nbsp; Less going on, so likely would be&nbsp;easier to calculate the clock costs of the code and compensate with adjusting the timing between commands.</li></ul>
         
