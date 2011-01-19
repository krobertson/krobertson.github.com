---
layout: post
title: Power through environments
---

Recently was talking to a friend when we were talking about the different environments within our development workflow.  Here at Involver, we actually have a total of 7 environments.

Production: Duh, live stuff
Staging: For QA on work that is ready to go to production
Demo: Used for client-facing demos of work that is in progress, but not ready to go out.
Test1-4: A set of special environments used to deploy feature branches to.

The production, staging, and demo stuff is pretty straight forward, but the test environments is where we have really developed a nice process.

We have a number of initiatives going on simultaneously and development in various products that usually don't touch each other, but do take place in a shared codebase.  To make the process of testing code and getting QA on feature branches before merging, we have the test environments set up in a way so that they self-bootstrap and can be switched out easily.

Say you are working on a branch called "dev-fixing-booboo" and you need QA on it.  You simply run "cap test4 deploy branch=dev-fixing-booboo" and it is pushed there, new DB created, bootstrapped within initial data, and ready to be used.  Your ticket gets rejected and you spend another 2 days working in your branch.  Someone else can come along and deploy another feature branch to the same environment.  It switches to another database, bootstraps it, and leaves all your existing data alone so you can come back later, simply deploy your branch, and QA can have the same test data they used the last time available to them.

With this process, we can have a collection of test environments that are dynamic, can be used for throw away branches, and also persist longer running test data for long running feature branches.  They allow testing of potentially volitile code without merging into master or deploying to another environment that might be used by other developers, QA in other areas, or client facing.

The provisioning and bootstrapping of them is all done with Capistrano.  Specify a branch, it uses that as part of the database name, and has various tasks associated with seeing if the database already exists, creating it if it isn't, and updating configurations for other satellite apps that are linked to our main codebase.  Our process for it was initially developed by [@mikewadhera](http://twitter.com/mikewadhera), but if you find yourself interested in it, feel free to drop me a line ([@krobertson](http://twitter.com/krobertson)).


