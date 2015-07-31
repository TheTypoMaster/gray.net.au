.. title: Synchronising iPhoto
.. slug: Synchronising_iPhoto
.. date: 2010-09-25 00:00:56 UTC+10:00
.. tags: tech,blog,James
.. category: 
.. link: 

As many people who know me are aware, I use Macs. I also use iPhoto, a
lot! I have an iMac on my desk at home and I roam around with my
Macbook Pro. Both of these have iPhoto installed and I often need to
make sure both systems' iPhoto libraries are in sync. There is no free
GUI tool for this (that I'm aware of at least) but that is not a show
stopper. Many Mac/OSX users aren't aware of the fact OSX is a full-
blown, card carrying member of the Unix(tm) family! What this means is
that it has a complete command line interface that allows you to do
all sorts of phunky things. In my case, I need to synchronise two
iPhoto installations. However, my needs are fairly simple:

.. TEASER_END

#. I only change one iPhoto library at a time (either I'm working at
   home, or remotely). So this mean I will only ever need to merge
   changes from one iPhoto to the other.
#. My account on both systems can login to the other via SSH without
   requiring a password. I used key-based auth.


With these two considerations I simply went about knocking up a shell
script to do what I need using rsync. I offer you the following:



::

    #!/bin/bash
    
    CUR_DIR=$(pwd)
    DIRS="$HOME/Library/Caches/com.apple.iPhoto\n$HOME/Pictures/iPhoto Library"
    RSYNCOPT="-rlptSzhPE --del"
    RHOST=iceman
    
    # Assume first command line argument is the remote host
    if [ ! -z $1 ]; then
    	RHOST="$1"
    fi
    
    echo -e $DIRS | while read DIR
    do
    	cd "$DIR"
    	if [ $? -eq 0 ]; then
    		DIR=`pwd | tr \  \?`
    		echo "Corrected Directory on remote host: $DIR"
    		rsync $RSYNCOPT $RHOST:$DIR/ ./
    	else
    		echo "Oops - couldn't change to directory "$DIR""
    	fi
    done
    
    cd $HOME/Library/Preferences
    rsync $RSYNCOPT $RHOST:$HOME/Library/Preferences/com.apple.iPhoto.LSSharedFileList.plist ./
    rsync $RSYNCOPT $RHOST:$HOME/Library/Preferences/com.apple.iPhoto.plist ./
    rsync $RSYNCOPT $RHOST:$HOME/Library/Preferences/com.apple.iphotomosaic.plist ./
    
    cd $CUR_DIR




Some important notes about this script:


+ Save this script as: `sync-iphoto.sh`
+ Execute the following command to make it executable: `chmod 775
  /path/to/sync-iphoto.sh`
+ It MUST be run on the DESTINATION machine.
+ You username on both machines MUST be the same.
+ Edit the RHOST variable to point to your OTHER Mac (ie, the source).
  Alternatively, you can over ride the hard-coded RHOST by specifying
  one on the command line.
+ This script will COMPLETELY over-write the iPhoto library on the
  destination Mac, ie, this script will NOT "merge" two iPhoto libraries
  into one!! YOU HAVE BEEN WARNED!


Now whenever you modify your OTHER iPhoto library, run this script on
the Mac that needs updating :) Voila!



