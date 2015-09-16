.. title: When good intentions turn bad
.. slug: When_good_intentions_turn_bad
.. date: 2010-10-04 03:34:20 UTC+10:00
.. tags: tech,blog,email
.. category: Site
.. link: 

If anyone is wondering what the heck happened to the weather
graphs recently I can explain. I have been a busy boy and moved all
my email hosting to Google Apps. This is a good thing and has NOTHING
to do with the gaps in the graphs. However, the mail hosting move
triggered a chain reaction of me shooting myself in the foot. The
sequence of events went something like this:


#. Migrate mail hosting - w00t! Everything went well :)
#. Users can't get their mail clients configured. Bummer, time to do
   some remote take-over-their-desktop type wrangling. All fixed...good!
#. Remove old mail server packages from my server at home. This went
   well in fact - bye Zimbra and Mailscanner, you've been good friends.
#. Decide that with the smaller task-footprint on the server, I might
   as well upgrade it from Ubuntu 8.04 to 10.04.
#. Here ends my weekend! Gah!!
#. What broke: database, monitoring, backups, mail relay, web proxy,
   DNS, DHCP, UPnP media server, weather station duties.
#. Fixing #6 has taken me all day Monday!! Grr.


The good news is that I'm pretty sure everything is back to normal
albeit with a few gaps in the trend monitoring for the weather
station. Sorry.


Update: Wednesday 6th October @ 13:53
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Spoke too soon. After "fixing" the system it turns out the term "fix"
was more like "neuter"! I got this great idea to lock down some files
on the server that contain sensitive info, like username and passwords
to databases. The problem is the code that does all the graph
generation magic couldn't READ the damned files after I "fixed" them
(I'm an idiot...should've seen THAT coming!). Alas, the permissions
are now fixed properly and the result is about a 24hr gap in the trend
monitoring. Moral to the story: when locking down your system, decide
if you're doing for anality or for a real reason. In my case, it was
the former, and I paid :(
