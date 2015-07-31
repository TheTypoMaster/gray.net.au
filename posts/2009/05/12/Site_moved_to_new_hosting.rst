.. title: Site moved to new hosting
.. slug: Site_moved_to_new_hosting
.. date: 2009-05-12 02:42:55 UTC+10:00
.. tags: site,tech
.. category: 
.. link: 

The Gray Matter is now up and running with the fine folk at
`Bluehost.`_ It's taken a little more wrangling than I'd expected but
it's all done now. If you're having trouble with your e-mail, call me
- I'll walk you through what needs to be done. Enough of this - I'm
going to play with some toys.

*Warning - nerd content follows!!*

For those who might be curious, the problem was that the content management
system I use (`Geeklog`_) uses serialised values in a database for storing
most of the configuration. This is a much faster way for PHP to grab
configuartion values rather than parsing a text file. Unfortunately, this also
means that when you move from one hosting provider, unless every file has
*exactly* the same location as the previous provider (basically, this will
never happen) the whole setup goes to hell in a handbasket until you refresh
dozens of serialised values with the new locations. If you find yourself in
the fine ship "S.S. Futzed" then you need to cruise on over to `Geeklog's explanation`_
and have a good read - there's some code you can use to fix the
problem in about 3 minutes...and that includes the time to cut-and-paste into
a file and upload the code into a file on the web server and run it! :)

.. _Geeklog: http://www.geeklog.net
.. _Bluehost.: http://www.bluehost.com
.. _Geeklog's explanation: http://www.geeklog.net/article.php/GL-1_5-Migrations


