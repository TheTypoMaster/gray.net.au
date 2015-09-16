.. title: It's been a bad week :(
.. slug: Its_been_a_bad_week
.. date: 2004-09-08 17:12:00 UTC+10:00
.. tags: tech, servers, DoS
.. category: Site
.. link: 

Anyone who uses my mail server will know this has been a bad week.
Monday the ISP had a bad day - which meant I did too. Anyone who
visited my site on Wednesday ( today ) before about 3pm (Aust EST)
probably saw the message saying the database server went bang.
Everything is back to normal now...but it's been a busy week. Earlier
this week our ISP had a denial of service (DoS) attack launched
against them which knocked out my connection for the better part of
Monday. The equipment was fine, but no-one could reach it.

Then this morning I came into my study (where the servers live) and
noticed it was a little warmer than normal. Then I noticed the
database+mail server was hot - as in too hot to touch. Hmmm. That's
not good sez I. It was running a `Distributed.net <http://www.distributed.net>`_
client which uses any spare CPU cycles and can cause a bit more
heat build up than normal....but nothing like this morning. Anyway,
while I was trying to figure it out (all of about 2 minutes) the
server did a thermal shutdown, meaning the CPU hit 75C!! Not good :(

When I looked into it further I found the cooling fan in the power
supply had seized. As in locked up tight. Grrrr!! So off I went to the
local electronics supplier, got me a new 8cm 12V ball bearing fan and
fitted it to the power supply. The powered it back up whilst holding
my breath and crossing fingers, toes, arms...everything. To cut a long
story short, I'd fried one of the 64MB memory modules which has taken
the useable RAM down to 448MB. Bummer. RAM is cheap, so I'll probably
lash out an buy some nice new stuff and go all the way to 1GB or
something stupid :)

Well that's the story of my week with these systems. Hopefully things
will return to their normal, stable, routine and I wont have to do
anything except watch the lights blink occassionally :)