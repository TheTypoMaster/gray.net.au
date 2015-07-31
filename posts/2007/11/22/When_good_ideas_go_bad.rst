.. title: When good ideas go bad
.. slug: When_good_ideas_go_bad
.. date: 2007-11-22 17:40:00 UTC+10:00
.. tags: tech,blog,James
.. category: 
.. link: 

As many people know, I run a mail system for myself and a few other
family members and friends. Up until this week it used a very robust
backend being driven by Mac OSX and `postfix`_, `mailscanner`_,
`spamassassin`_ and `clamav`_. However, in my day job I've been
gaining a lot of experience and respect for a bundled open source
platform called Zimbra. So I thought I could kill two birds with a one
nuke and drop Zimbra onto a new Linux-powered machine. In principle,
this was (and still is) a good idea. It provides me, as an
administrator, a number of benefits such as:

+ Centralised user/account management
+ Extremely simple deployment of virtual domains etc
+ Intuitive web administration as well as a plethora of command line
  tools (so I can roll my own scripts for routine tasks etc)
+ Having everything in one place makes backup (and restore) a LOT
  simpler
+ Being a commercial product with an open-source alternative means I
  get the best of both worlds: an free product with a proactive vendor
  constantly developing and improving their product.

All these benefits mean I have more time to spend doing things that I
enjoy and less time doing mundane stuff that I really hate. Also it
gives me a real-life test environment with real-world mail feeds that
I can experiement with before deploying anything on the production
systems in my day job.

Of course, I'm not the only winner. Users of my system can now do all
sorts of things they couldn't before. Such as:

+ Manage their own mail and account details in a single web interface.
+ Store mail on the server and have it filtered server-side.
+ A featureful web mail client with their own address book.
+ Ability to create RSS feeds for specific mail folders (or their
  entire mailbox) which opens up a whole new way to interact with the
  mail server.

There are other features as part of Zimbra such as secured (SSL/TLS)
mail that were part of the old system too.

It is this last feature though that is causing me `all the grief`_.
Over the last 3 days, since deploying the new server, a single feature
has failed miserably. Sending mail requires users to authenticate
themselves so the system knows they are allowed to send mail through
the server. Otherwise, the server would be an `open mail relay`_ which
are the bane of the Internet and good way to get yourself onto so many
`block lists`_ the server would be rendered useless within a day or
two at the most. I'm busting a valve trying to fix this, but in the
meantime, at least webmail works completely!!

Warning - serious geek tech follows :)

Despite all my efforts to get this one little feature working, all
I've managed to do is eliminate a bunch of things that aren't causing
the problem. Finally, it's come down to a rather complex interaction
between four components: postfix -> saslauthd -> tomcat(via soap) ->
ldap. In that chain, it appears the failure is in the interaction
between postfix and saslauthd but getting any meaningful information
out of the standard logging has proven to be difficult at best and
utterly useless the rest of the time. Seems I am going to need to
break out some big guns and start doing stack traces and library
traces to see where this is falling down. In any case, this is several
orders of magnitude more complex than it should be for a bundled
product from a commercial vendor being installed onto a supported
platform.

.. _all the grief: http://www.zimbra.com/forums/administrators/12973-unable-send-mail-via-smtp-tls-auth.html
.. _open mail relay: http://en.wikipedia.org/wiki/Open_mail_relay
.. _spamassassin: http://spamassassin.apache.org
.. _postfix: http://www.postfix.com
.. _block lists: http://en.wikipedia.org/wiki/DNSBL
.. _mailscanner: http://www.mailscanner.info
.. _clamav: http://www.clamav.org


