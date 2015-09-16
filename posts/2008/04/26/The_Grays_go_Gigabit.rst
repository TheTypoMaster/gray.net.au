.. title: The Grays go Gigabit!
.. slug: The_Grays_go_Gigabit
.. date: 2008-04-26 17:21:00 UTC+10:00
.. tags: tech,blog,network
.. category: James
.. link: 

It's taken a while but the cost for gigabit ethernet is finally down to a
point that I considered justifiable. So I lashed out (sic) and bought a 5 port
Dlink gigabit switch. This then connects to my 8 port 10/100Mbps switch/router
and ultimately the Internet. The machines on the Gbit switch are simply my
home server, Nat's desktop, and my Mac Mini. I've also run a patch cable for
my Macbook Pro for the odd occasion I need better-than-wifi speeds. The
wireless access point hangs off the 8 port 10/100 switch as it will never do
better than 54Mbps, so there's no reason to waste a gigbit port on wifi!

All in all it's been a relatively straight-forward transition except for Nat's
desktop. Her machine would only sync at 100Mbps on the 5 metre CAT5e cable
between her and the new switch. So I went out today and bought 6 metres of
CAT6 from Dick Smith Electronics (AUD$10 all up) and crimped the ends myself.
For a similar pre-made CAT6 cable, they were asking around double what I paid
(thieves!).

The results have been what I expected. Loading photos and large files from the
file server is now a LOT faster. I especially noticed the difference when
browsing the file server in "thumbnail" mode; it was as fast as it would be if
running locally. The Time Machine backups for my Mac Mini are now super fast
to the file server too which is great as the system (the Mac Mini) bogs down a
little while it does the backup. Basically, with the consumer-grade hard
drives in my server, I am now limited by the speed of those drives and the CPU
power in the clients far more than the network fabric. It's nice to know that
as I develop this network any gains in the server speed will pay off for the
clients on my LAN.
