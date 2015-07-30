.. title: Referrer Spam....grrr
.. slug: Referrer_Spam
.. date: 2005-02-18 12:45:00 UTC+10:00
.. tags: James,blog
.. category: 
.. link: 

For some time now (ok for the last 3-4 months) I've been getting HEAPS
of referrer spam in my web logs. Unscrupulous websites do this so
their referrals appear in statistic pages, then those stats pages get
indexed by Google, Yahoo! etc, and thus their crappy websites are
elevated in the search results. It sux and it skews my log
analysis.... but NO MORE!! Basically, I found `this article <http://community.moertel.com/ss/space/2004-03-18>`_
that describes a way to eliminate these bogus referrals on a domain-by-
domain basis. Sweet. I already had a list of bogus referrers and so
simply needed to drop these into the list and voila!
It wasn't quite as obvious as I thought, so here's my addendum to the
article above. The "refererdom.deny" and "url-to-domain.pl" files work
fine. In fact you can test the output of the perl script like this:

::

    echo "http://foo.example.com/bar.html" | ./url-to-domain.pl

and you should see "example.com" echoed back. So far so good.
Then came the integration into "httpd.conf". Not so straight forward.

#. Firstly you need to make sure you have included "mod_rewrite" in
   your apache modules - without this, there's no point going on.
#. Next, enable the rewrite engine with "RewriteEngine on". Here came
   the first gotcha; virtual servers DON'T inherit this setting from the
   global config - you have to enable it for **each virtual server**.
#. Last, I needed to add the following code block to every virtual
   server (bleh!):

::

    # These Apache rules prevent referer spam
    RewriteEngine           on
    RewriteMap domain       prg:/etc/apache/url-to-domain.pl
    RewriteMap referer-deny txt:/etc/apache/refererdom.deny
    
    RewriteCond %{HTTP_REFERER} !=""
    RewriteCond ${referer-deny:${domain:%{HTTP_REFERER}}|NOT-FOUND} !=NOT-FOUND
    RewriteRule  ^/.*  -  [F,L]

The only good thing about having this in every virtual host defenition
is that my access rules for referrer spam are consistent for all my
web sites (about 10 at the moment). I'm guessing you could probably
add each of these directives into a .htaccess file in each virtual
server's document root but seeing as I have access to the apache
config file, I did it there. I'm not a big fan of .htaccess files
unless you don't have access to the server config file (obviously).


Well I hope that helps you get the referrer spam problem under
control. Feel free to contact me if you want my list of domains I'm
currently blocking referrals from (good seed to get your site going!).
