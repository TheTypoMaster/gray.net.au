.. title: Linux Upgrade: Kubuntu Hoary to Breezy
.. slug: Linux_Upgrade__Kubuntu_Hoary_to_Breezy
.. date: 2005-10-16 11:16:00 UTC+10:00
.. tags: James,blog,tech
.. category: 
.. link: 

It seems the kernel update that was published a week or so ago by the
fine folks at Kubuntu left my system in an awful state! Much poking,
prodding, and configuring couldn't get things back to their rock-solid
state. So I bit the bullet and went up to the next stable release
"Breezy" and this is my experience. Firstly, let's give this blog
entry some context. My system is an AMD64 machine running the 64bit
Kubuntu. I'm a KDE die-hard...it's one of my few vices :P Anyway,
here's my machines specs:

- **CPU** AMD64 3000+ (2000MHz)
- **Motherboard** Asus K8VSE Deluxe
- **RAM** 1GB (2x512) Coarsair something in dual-channel
- **Video** Winfast A360 - nVidia FX5700 with 256MB VRAM
- **Hard Drive** Western Digital 200GB SATA on the VIA controller
  (/dev/sda)
- **Optical Storage** Samsung CDRW/DVD-ROM combo drive on primary ATA
  (/dev/hda)

The update was kicked off around 7pm on Saturday night. This began
with a simple edit of the /etc/apt/sources.list file and replacing
every "hoary" with "breezy". I was lazy and used "mcedit" for that
job, but I could've used vi, or even sed.

With the sources list update I rebooted into "recovery mode" which is
Kubuntu's single user mode with a root shell. At this point the real
waiting began. I issued an "apt-get update" to get the new package
lists, then an "apt-get -u dist-upgrade". Screenfuls of packages
scrolled off and I was given the summary that over 570 packages would
be updated, 200-odd will be installed and 37 removed. This would
require a 788MB download and when the install was complete, about
500KB extra space consumed. So I said "Yes" and went to bed about 2
hours later with stuff still coming down the wire.

This morning I checked on the progress and noticed it was stopped on a
screen asking which word list I wanted by default. Promising sign -
looks like everything downloaded :) So I answered the questions and
the upgrade progressed.

Time for a coffee. With the caffeine hit out of the way, I went back
and checked on progress (I drink quickly, and the espresso machine in
the kitchen makes coffee fast too). Hmm, it's barfed on a
kdevelop3-data package because it's trying to overwrite a file that
belongs to kdevelop3. Oh well, time to break out the big stick:

#. dpkg -i --force-overwrite /var/cache/apt/[package]
#. apt-get -f install

Unfortunately, there were two other packages requiring this sort of
love and attention too: kdevelop3_4 and knemo. But after going through
the 2 steps above for them and waiting for the second step to
complete, I could finish the upgrade with "apt-get -u dist-upgrade"
and all was well.

At the end of the upgrade I did one last "apt-get update && apt-get -u
dist-upgrade" and noticed there was nothing to upgrade or install
*BUT* there was one package "kept back": libtunepimp-bin. So I simply,
removed it, then did a cache search to find what has become of it.
Then found the new package "libtunepimp-bin" which I installed
manually. Voila. Even though the package has the same name, it
actually installs the new version - probably why it was kept back.

My system uses the nVidia binary driver for the video card and I
choose to use the nVdidia installer, rather than the Kubuntu package.
This way I'm always up to date :) The drawback is, that nearly every
time there's a kernel update, my xorg breaks and I need to recompile a
new kernel module for the nVidia driver. I can live with that. So
after the upgrade, I rebooted into recovery mode again to recompile
the nVidia driver.

This was a little odd. I ran the installer (like I'd done dozens of
times before) so didn't pay that much attention to the messages; just
go through the "accept, yes, uh-huh, ok, just-compile-it-already,
fine, you-done-yet?!" routine. But it bombed. Seems the kernel is
compiled with gcc-3.3 but the default compiler in Breezy is gcc-4.0.
The installer doesn't like this (and rightly so). So I had to set the
"CC" environment variable:

::

  CC=/usr/bin/gcc-3.3 ; export CC

Then re-run the installer. All was well and the driver installed
without a hitch. Reboot for real this time and see what the system
does :)

The first thing I noticed was the hdparm (Setting drive options IIRC)
in the boot sequence seems to happen before my IDE drivers are loaded
so it complains it can't find /dev/hda. I'll move it later in the boot
sequence - no biggie.

The rest of the boot went fine. The new KDM login screen is VERY slick.
Once logged in as my normal user account, my entire session was
reloaded, exactly as I had left yesterday and I began exploring :)
My first impressions of Breezy are:

+ KDE 3.4.3 is noticably faster than 3.4.0
+ The eye-candy is sweet
+ Kontact loads faster (much faster)
+ Still have the occasional artsd lock-up requiring me to restart the
  KDE sound system. But this is a bug with the sound driver on my Asus
  K8VSE Deluxe mother board AFAIK.
+ The problems that prompted the whole upgrade are resolved
+ My pen drive doesn't automagically appear on the desktop any more,
  but I can live with that. I just created a manual entry in /etc/fstab
  and then created a link on the desktop. Solved.
+ Can't comment on stability too much yet - haven't had it running
  long enough!

Well that's about it. Contact me if you want to ask any questions
or have any comments :).
