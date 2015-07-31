.. title: Apple Mail RSS to Google Reader
.. slug: Apple_Mail_RSS_to_Google_Reader
.. date: 2011-01-05 03:42:00 UTC+10:00
.. tags: tech,blog,James
.. category: 
.. link: 

I have been using Apple Mail to read my RSS feeds for a few years now
and for the most part, I like it. However, with an iMac, Macbook Pro,
iPhone and work machine all hitting the same feeds, synchronising
everything to find the NEW articles has been a royal pain. So I've
give up hacking my own RSS/Dropbox/argh(!) solution and I'll let
Google manage it all and hang my privacy. Read on for the magic three
step process.

.. TEASER_END

Now enter Google Reader. You'd think making an import mechanism to
simply read a list from a text file with an RSS URL on each line. At
least, that's how I'd do it. However, Google only import/export using
OPML files. This has its own inherent benefits but it makes migrating
from Apple Mail to Google Reader a bit of a chore. Actually, it's a
royal PITA...but I digress. If you're in the same boat as me, you
simply need to run through a three step process which isn't actually
all that onerous and uses readily available tools.

Before I get into it, I'll run over some assumptions first:


+ You have a Gmail account and therefore access to Google Reader
+ You can run a shell script in an OSX terminal (ie, Terminal.app or
  shell). *Note this is NOT the same as AppleScript!!*
+ You are reading your RSS in Apple Mail


If you answered "yes" to all the above, then here's the hack outlined

#. Extract the RSS URLs from Apple Mail using a shell script
#. Convert the resultant URL-per-line text file into Google-friendly
   OPML format
#. Import the OPML file to Google

Step One - Get the URLs from Apple Mail
---------------------------------------

This is actually pretty simple as it turns out, simply execute the
following script - `extract-rss.sh`_. Save it somewhere (I'll assume
your downloads folder), open a Terminal session and enter:

::

    
    chmod a+x ~/Downloads/extract-rss.sh
    ~/Downloads/extract-rss.sh


Replace "~/Downloads" with whatever folder you saved the script to.
Feel free to open it and take a look. It's not my most spectacular
script, but what the heck, it works right!

This script will create a file in your Home folder (the one with your
username in Finder) called "RSS.txt". Open it in TextEdit and copy the
entire content. We'll need the contents of this file in the clipboard
for the next step.


Step Two - Convert to OPML
--------------------------

Unfortunately this is the ugly bit and I'm using an online resource
that converts a list of URLs to OPML format...but it does it all in
the clipboard. So, if you haven't already, copy the entire content of
the RSS.txt file we created in step one, and paste into the following
website:
http://reader.feedshow.com/goodies/opml/OPMLBuilder-create-opml-from-rss-list.php

The result will be a text box with your shiny OPML formatted list of
RSS feeds (we're almost there folks!). Copy and paste all the
resultant OPML text into a new text file called "RSS.opml". If you use
TextEdit make sure you set the format to plain text (Format -> Make
Plain Text)!


Step Three - Import OPML to Google Reader
-----------------------------------------

This is simple. Go to the feed management in Google Reader, follow the
Import/Export link and import the RSS.opml file we created in step
two. Now go celebrate!

.. _extract-rss.sh: http://gray.net.au/assets/files/extract-rss.sh


