.. title: The curse of old software
.. slug: The_curse_of_old_software
.. date: 2007-11-26 07:54:00 UTC+10:00
.. tags: tech,blog,James
.. category: 
.. link: 

After spending a fair amount of time yesterday getting my Mac Mini
rebuilt as my desktop machine (it has spent the last 18 months of its
life faithfully as the Gray Matter mail, web and everything-else
server) I was most disappointed this morning when I couldn't get Apple
Mail to stay up long enough to read a *single* message. After about an
hour of googling I decided that none of the fixes seemed to be
applicable to my situation.

So I decided that rather than try and let someone else solve the
problem, I'd try and think it through. Being a new installation, less
that 24 hours old, it's not too hard to go back in your mind through
the step you made in building the system. So one at a time I started
mentally trying to pinpoint the moment when everything went pop. Then
it dawned on me. Before I put the mini to sleep last night I installed
`Growl`_. Even though their site simply advises you need OSX 10.4 or
better (I have 10.5.1) there are evidently some problems with Growl
1.1.2 and OSX 10.5.1; specifically Apple Mail. In short, the mail
plugin for Growl will cause Apple Mail 3.1, as shipped with OSX 10.5.1
to completely fail with a segmentation fault. After disabling the
Growl mail plugin, all of a sudden all my e-mail came back to life.

Like most new software platforms, OSX 10.5, *Leopard*, is a steady
evolution of its predecessors. However, this introduces a number of
compatibility concerns for third party developers and OEM's. Given how
Apple took an open source project called "Cover Flow" and integrated
into their base operating system (and now made it even more pervasive
in Leopard) it seems odd to me they haven't done a similar thing with
Growl. It seems every Mac user I know has Growl installed if for
nothing else than for mail and IM notifications. So get with it Apple,
either built your own notification framework and user-space
applications, or take Growl and do your Apple magic with it :)

.. _Growl: http://growl.info/
