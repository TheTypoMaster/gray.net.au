.. title: The curse of the "early adopter"!
.. slug: The_curse_of_the_early_adopter
.. date: 2006-04-06 11:32:00 UTC+10:00
.. tags: James,blog,tech
.. category: 
.. link: 

As I posted in the Site News section, and as can be seen in the
"Powered By" section, this site now runs on an Intel CoreDuo Mac Mini.
It's fast, it's small, it's quiet....and most of the legacy software
I've been used to doesn't run on it! I've been through this before
when I bought my AMD64 work station. All manner of ugliness ensued
until the software writers ported their stuff to the new platform. Mac
is no different. Having been entrenched in the PowerPC (PPC) platform
for ages, all Mac OSX software is written for that CPU.

Along comes the CoreDuo (not PPC and is actually an IA32 system, aka
i386!) and very few of my preferred apps run :( Thankfully I've become
pretty accustomed to open source software, and having access to the
source code makes it rather simple (most of the time) to just
recompile it for the Mac. Still, it would be nice to have ready-to-go
stuff.

The main dilemma facing at the moment is that I plan on moving the
mail server to the Mac and thus finally shutdown the 3 lumbering
dinosaurs I currently have running my network. Sounds simple right?
Well I use `MailScanner`_ to scan my incoming mail. MailScanner in
turn wraps around various virus scanners and reformatting tools.

Without these scanners and tools, the system just doesn't work. Whilst
`ClamAV`_ virus scanner will run on Mac OSX (by virtue of it being
open source) neither McAfee or F-Prot have a command-line scanner for
Mac OSX on Intel! Bah. So I'm going to loose two thirds of my virus
scanning!!

You could argue I didn't do my research, and that would be partially
true. I knew there would be these issues, but I wasn't prepared for
how many tools wouldn't be available (yet!). Seems the mail server
migration will be on hold for a little while until I iron out the
bugs. Bummer

.. _MailScanner: http://www.mailscanner.info
.. _ClamAV: http://clamav.sf.net
