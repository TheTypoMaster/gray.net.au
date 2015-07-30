.. title: DShield and a Cisco 837
.. slug: DShield_and_a_Cisco_837
.. date: 2011-06-08 14:04:10 UTC+10:00
.. tags: tech, blog
.. category:
.. link:
.. description: How to set up a log server and Cisco 800-series router to capture logs for the DShield project


I've been a contributor to the global `DShield project <http://www.dshield.org/>`_
for quite some time and recently replaced a long-serving, faithful
router with a Cisco 837. This introduced an interesting problem for
me - the log format of the new router was completely different to the
old one and as a result, my DShield script completely exploded. Not
a huge problem, time to indulge my Perl regex geekiness and fix it!

First of all there are a few prerequisites:

#. Configure the Cisco 837 to log failed access to my syslog server
   (running syslog-ng) (or `download the full IOS config here
   </assets/files/ios-full-C837.txt>`_)
#. Make sure syslog-ng adds the year to the log line (DShield needs
   this field)
#. `Download </assets/files/dshield-cisco837.tgz>`_ and Configure
   the log-parser to get the info for DShield ( *see below
   for instructions*)

To make this article easier, I?ll simply stick to these three
sections.

1 - Configure CIsco IOS to Log Correctly
----------------------------------------

Don't panic - IOS isn't the boogey-man and I'll walk you through this
:) Assuming you have a syslog server that is configured to listen for
network connections (in my case syslog-ng) this is a straight-forward
process. If you have a "virgin" router and have the luxury of
applying a brand new configuration, I have `provided the full IOS
configuration </assets/files/ios-full-C837.txt>`_ for a Cisco 837 -
just edit in a text editor and hunt for the "CHANGE-ME" and "x.x.x.x"
bits. If you're editing an existing/working IOS configuration, log
into your router, go to enable mode and 'configure terminal' then enter the following:

::

    service timestamps debug datetime msec
    service timestamps log datetime localtime
    no logging console
    no logging monitor
    logging facility local1
    logging 10.0.0.5


Change 10.0.0.5 to whatever the IP of your syslog server it. Of
course you then need to define an access list (mines called ?INTERNET-
IN?) and apply it to your interface (in my case 'Dialer1'), just make
sure the last few lines in the access list looks like this:

::

    ip access-list extended INTERNET-IN
    permit tcp any any eq www
    permit tcp any any eq 443
    ...
    deny ? tcp any any range 0 65535 log
    deny ? udp any any range 0 65535 log
    deny ? udp any any log


And the dialer interface with this access list looks like this:

::

    interface Dialer1
    description Internet Interface
    ip address negotiatedip access-group INTERNET-IN in
    ...


Ok, that's the Cisco stuff done, you should now be seeing log lines
appear for blocked incoming connections in your logs. If not, make
sure your logging setup is correct and review both the router and the
syslog server.



2 - Setting up syslog-ng
------------------------

I run an Ubuntu syslog server, but these instructions should work for
pretty much any \*nix-based system running syslog-ng. By default,
messages sent to syslog-ng are not recorded with the year, however
DShield requires it (at least as far I know it does). This isn't a
big deal, as you can simply add a template to the log destination. In
my setup I filter everything from my Cisco 837 to its own file. The
router's hostname is 'router' and here are the relevant lines from
/etc/syslog-ng/syslog-ng.conf:

::

    destination df_router {
      file("/var/log/router.log"
      template("$DATE $YEAR $HOST $MSG\n")
      template_escape(no))
      };
      
    filter f_router {
      host(router);
      };
    
    log {
     source(s_all);
     filter(f_router);
     destination(df_router);
     };


That's about it. By this stage, you should be seeing messages in
/var/log/router.log like this:

::

    Jun  8 18:47:17 2011 router Jun  8 18:47:16: %SEC-6-IPACCESSLOGP: list INTERNET-IN denied tcp 115.134.81.123(4250) -> 123.123.123.123(23), 1 packet


Yay! The last bit is a piece of cake (because I?ve already written the
script for you).



3 - Log parser installation
---------------------------

This is simple for you. Just `download the script bundle </assets/files/dshield-cisco837.tgz>`_
and untar from the root (/) directory. It will put a handful of
files in /etc, and the script into /usr/local/dshield (along with
a test harness). If you have any concerns, unpack in /tmp and move
the files around appropriately.

MAKE SURE you put your DShield user details into /etc/dshield.cnf -
failure to follow this step will cause all your hard work to be
completely wasted ;)

Lastly, once you know the script is working with your logs (see the
test harness for how to do this), just add the following entry to
/etc/crontab:

::

    10 4,16 * * *  root  cd /usr/local/dshield && ./cisco837.pl -config=/etc/dshield.cnf > debug.txt


Now twice a day, you should get a notification saying you have
contributed to the greater good and you can feel all warm and fuzzy.