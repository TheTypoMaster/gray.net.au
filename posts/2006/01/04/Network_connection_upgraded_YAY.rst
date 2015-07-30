.. title: Network connection upgraded! YAY!!
.. slug: Network_connection_upgraded_YAY
.. date: 2006-01-04 16:27:34 UTC+10:00
.. tags: tech,blog,James
.. category: 
.. link: 

WOOT! After almost two months wait, the Internet connection is
upgraded! The new link is supposed to be faster, more reliable and
provides me with a MUCH higher data allowance. The delays weren't
really the fault of the ISP; seems Australian Customs were being anal
(now *there's* something new....not). The kit was delivered today
and is now installed and running.

No big hassles other than having to flush a few arp tables and what-
not. Everything so far has been great. I'm getting a sustained
3.5-4Mbps for both upload and download (it's a synchronous connection)
which with some tweaking should go up to 7Mbps soon. By the end of the
year I should be on 20Mbps. YAY!

This is the old antenna. It's a 2.4GHz, 15dB "dish" type thing. The
old connection used almost standard IEEE802.11 (wifi) data connection.
This was fine 18 months ago when I started with the ISP, but since
then, the amount of "noise" in the 2.4GHz band in my area has gone
from about -90dB to almost -70dB. That's a 20dB increase - anyone who
understands the decibel scale will see that's a massive increase
(decibel scale is logarithmic - 20dB increase is actually 100 fold
increase!). It's courtesy of all the crappy consumer electronics in
the 2.4GHz band (cordless phones, baby monitors, wireless
networking...it's chock full!). So the ISP suggested I move to a
totally new platform.

Enter the new gear. 5GHz microwave link. It doesn't use wifi, it
doesn't use any off-the-shelf network signalling in fact. It's a
dedicated 5GHz data link. It's also point-to-point and is an
integrated antenna plus modem. Yes, the modem is actually inside that
funky white box. The only thing running back to my firewall is a black
cable that carries both data and the power feed for the modem.

This little box is the power injector. It sits between the
modem/antenna and the firewall and sends the power feed to the antenna
without sending it back to my firewall (which would be bad). The power
input is at the bottom of the photo, with the firewall cable on the
left (beige), the cable on the right (black) goes to the antenna, and
the green wire at the top is a separate earth which I've connected to
the case of the firewall.
If these photo's are too small, then simply cruise over Computer
Gallery to see larger formats :)
