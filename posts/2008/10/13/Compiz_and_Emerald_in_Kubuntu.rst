.. title: Compiz + Emerald in Kubuntu (Hardy 8.04)
.. slug: Compiz_and_Emerald_in_Kubuntu
.. date: 2008-10-13 12:08:00 UTC+10:00
.. tags: tech,blog,James
.. category: 
.. link: 

I've seen a lot of posts about how to get `Compiz`_+`Emerald`_ working
together in `Kubuntu`_ that involves a lot of poking around and
creating scripts etc. However, there is a "better" way that is from
what I can see, the K/Ubuntu preferred method. First some background.
Like may others, I wanted to get Compiz and Emerald all singing and
dancing on my desktop system at work but was frustrated by the lack of
integration with GUI management tools - specifically with regard to
getting Emerald to start at login. The general sequence of events goes
like this:

#. Install restricted drivers and "nvidia-glx-new" package (or the
   closed ATi driver package).
#. Install every *compiz* package available (including ccsm)
#. Install every *emerald* package available.
#. Turn on desktop effects in KDE and specify to use a 3rd party
   config tool.
#. Configure Compiz to your taste with "ccsm"
#. Run "emerald --replace" to get rid of kwin/metacity

Lovely! Kudos to the package maintainers for making it this easy :)
However, when you log out (reboot etc) and back in again, the compiz
compositing manager starts, but not emerald! Why? Well the simple
answer is that Emerald was never ASKED to start. So the better
question is; why wasn't emerald asked to start? The answer to which is
buried in a wrapper at /usr/bin/compiz-decorator. Basically this
script is called by compiz when it starts to start your preferred
window decorator (have a look in the "Window Decorations"
configuration in CompizConfig Settings Manager, ie, "ccsm"). A few
posts I've seen have suggested replacing this "compiz-decorator" with
"emerald --replace" but this removes some of the fall-back/redundancy
provided by the bundled script. This got me thinking - there *must* be
a way to tell "compiz-decorator" to use Emerald...and there is!

If you open /usr/bin/compiz-decorator (it's a shell script, so any old
text editor will do) and scroll down a little, you will find this
block:

::

    # start a decorator
    if [ -x ${COMPIZ_BIN_PATH}emerald ] && [ "$USE_EMERALD" = "yes" ]; then
        DECORATOR=emerald
    elif [ -x ${COMPIZ_BIN_PATH}gtk-window-decorator ] && [ -n "$GNOME_DESKTOP_SESSION_ID" ]; then
        DECORATOR=gtk-window-decorator
    elif [ -x ${COMPIZ_BIN_PATH}kde-window-decorator ] && [ -n "$KDE_FULL_SESSION" ]; then
        DECORATOR=kde-window-decorator
    elif [ -x ${COMPIZ_BIN_PATH}kde4-window-decorator ] && [ x$KDE_SESSION_VERSION = x"4" ]; then
        DECORATOR=kde4-window-decorator
    fi

Notice the check to see if "USE_EMERALD" is set to "yes"? Well,
scrolling back you will find a section like this:

::
    
    if [ -z "$XDG_CONFIG_HOME" ]; then
        test -f $HOME/.config/compiz/compiz-manager && . $HOME/.config/compiz/compiz-manager
    else
        ...etc...

Ok - so now we have the two pieces of the puzzle; firstly why Emerald
isn't being to start and what files are read to get the instructions
in the first place. So the final resolution is dead simple. All we
need to do is create a file "$HOME/.config/compiz/compiz-manager" and
populate it with "USE_EMERALD=yes" like this:

::
    
    echo "USE_EMERALD=yes" >> ~/.config/compiz/compiz-manager

Voila. Log out and back in again and you'll see Emerald start :) Best
bit is this modification will make the start-up consistent across
upgrades of K/Ubuntu, and will work regardless of your choice of
Gnome/KDE/XFCE etc. In other words, it's desktop environment neutral
which is what makes this approach a little different to most of the
others I've read online that seem specifically geared to one window
manager/desktop environment or another. Also note, you can over-ride
any of the variables in "/usr/bin/compiz-decorator" using additional
declarations in the local ~/.config/compiz/compiz-manager file. This
could be handy if you want to play with development versions of
Emerald.

.. _Emerald: http://wiki.compiz-fusion.org/Decorators/Emerald
.. _Compiz: http://www.compiz-fusion.org/
.. _Kubuntu: http://www.kubuntu.org
