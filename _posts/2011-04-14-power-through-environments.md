---
layout: post
title: Power through environments
---

At Involver, we have a pretty rich deployment environment that I think isn't very common.  It is normal to hear about places having a separate staging environment from the production environment, and sometimes having a staging and test environment.  We actually go a step further and have a total of 8 non-production environments.  They all serve different purposes, but are all heavily used.

Our environments are broken up like this:

<ul><li>Production: duh, live stuff</li>
<li>Staging: Used for QA, close to production, no experimental stuff, pretty good data set and history in the DB.</li>
<li>Demo: Used for client-facing stuff that is under development.  Somewhat experimental, but expected to not be breaking or of a major impact.</li>
<li>Perf: This environment is regularly repurposed and is used for benchmarking, testing infrastructure changes, and other large scale changes (Rails upgrades, DB upgrades, core app perf testing).</li>
<li>Test1-5: These guys are pretty special.</li></ul>

The test environments are something special and are meant to be highly flexible.  They are used to deploy separate git branches to an environment that has all the different elements of our application fully orchestrated.  They are useful for testing volatile code, experimental code, or for performing QA on features or feature branches before the code gets merged into master.

The deployment to these environments works by specifying the branch on deploy, and it will create the MySQL/Mongo databases, setup the DB schema, bootstrap the DB with some initial data, and then configure all the configuration files and even config files for other applications that it interacts with.  Each branch on each environment gets its own database.  And between deploys, the data for your branch is fully preserved.

So say you deploy "dev-fix-booboo" to test3 for the first time.  It sets you up with a fresh dataset and are good to go.  You do your thing, then later on, someone deploys another branch.  They get their own DB, not mucking up the stuff you previously had done, and when you deploy there again, you are right back where you left off.

Since they are specific to the environment too, we often times assign a long-running feature branch to an environment, so that the data used by QA sticks around more, and smaller test branches can use them here and there.

The full power of these comes form:

<ol><li>Flexibility.  I have a branch I want to deploy, but not much other environments.  Sweet.</li>
<li>Some element of persistence.  I can use it for a few days, come back, and be right where I left off.  No risk of someone polluting my stuff with bad data.</li>
<li>QA can actually deploy to them and pick which is available.  For non-feature branch testing, this gives them great flexibility.</li></ol>

Of course, there are still some pitfalls:

<ol><li>They don't mirror the full production setup.  They're usually one box and not spec'd for any kind of load.  They run good, but not going to handle lots of people.  Can't perf test here.</li>
<li>There is the data persistence between switching branches, but often no rich DB history.  It is harder to test large datasets of legacy type setups.</li>
<li>Can't test infrastructure changes.  If deploys don't switch out gems or system configs, so harder if you want to test a change like that, you need to lock the environment til done.</li></ol>

All of this makes for a very flexible deployment process.  It allows devs to easily get code off of their machines and in a more controlled environment.  It allows us to have high confidence in code before it makes it to master and often even before the feature branch.  It also allows QA to do their testing without potentially deploying code they reject to staging or demo, where it might be customer facing or impact other development.

Big props for it go to [@mikewadhera](http://twitter.com/mikewadhera), who initially wrote the deployment process for it.  Since then, we (infra/ops team) have worked on making the environments single-system, which allow us to have more of them, as well as iterate on making them more streamlined with developer and QA feedback.

This kind of builds up to something I'll be talking about soon too.  Since we have a total of 9 different environments, this can lead to a very interesting chef workflow.
