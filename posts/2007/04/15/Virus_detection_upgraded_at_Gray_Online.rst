.. title: Virus detection upgraded at Gray Online
.. slug: Virus_detection_upgraded_at_Gray_Online
.. date: 2007-04-15 10:49:02 UTC+10:00
.. tags: tech,site
.. category: 
.. link: 

A number of people use my mail server to filter their ISP mail.  In other
words, mail from their ISP is redirected to my server, which then scans
(viruses and spam...among other things) then delivers it to a Gray Online
mailbox.  I'm proud that most of the people using my server have noticed a
significant difference between my filtering and most ISP's.  Namely, my
filters ACTUALLY WORK!  Why?  Simple - I've been basically a full-time e-mail
and Unix administrator for the better part of the last decade.  I know e-mail
and I've seen the rise of spam and viruses.  Consequently I've been able to
adapt my filters in small evolutionary steps, rather than having nothing and
having to revolutionise my mail systems (like most ISP's seem to have done).

Enough trumpet blowing, the core of my mail system's "brains" comes from one
open source package;

- `MailScanner <http://mailscanner.info>`_ written by a guy named Julian Field.
  MailScanner then plugs into a number of other tools *like*

  + `SpamAssassin <http://spamassassin.apache.org>`_
  + `ClamAV <http://www.clamav.net>`_ *and*
  + `Mailwatch <http://mailwatch.sourceforge.net>`_ for MailScanner.

However it is **ClamAV** I'm most impressed with at the moment.

Many people would be aware of the recent "Storm Worm" outbreak that has been
hammering the Internet and any unprotected mailboxes.  It seems that the
humble guys developing this open-source virus scanner have trumped nearly
every big player in the commercial  virus scanning market and had detection
signature distributed almost as soon as the Storm Worm unleashed its fury.
Here's a snippet from the ClamAV website:

  *A huge virus surge of a new Storm Worm variant is flooding email inboxes and
  evading many antivirus programs. In my tests of 31 programs, only four
  reported a virus. Postini, an email security company, says that over the last
  24 hours it has seen about 55 million virus emails, about 60 times the daily
  average. [...] At 2:30pm I uploaded the attachment to Virustotal.com, which
  uses many different antivirus programs to scan uploads. Of 31 programs, only
  four – ClamAV, eSafe, Kaspersky and Symantec – reported a virus.*

  **Source:** http://www.clamav.net/2007/04/13/quick-reaction-to-new-storm-worm-variant-outbreak

You can read the full article `over at PC World <http://www.pcworld.com/article/id,130686-c,virusesworms/article.html>`_
if you are interested.  The main reason for making a note about this achievement
is two fold:

#. I wanted to inform my users that they have world-class mail filtering
   protecting them from the latest nasty floating around, *and*
#. I really think the ClamAV team deserves some coverage for their outstanding
   effort both with this most recent worm threat and for all their hard work
   over the years to get ClamAV where it is today!  **Well done!**
