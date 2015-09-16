.. title: Geotagging photos...without breaking the bank
.. slug: Geotagging
.. date: 2014-11-17 20:11:33 UTC+11:00
.. tags: OSX,tech,software
.. category: James
.. link: 
.. description: Geotagging photos with only software and a simple workflow.
.. type: text

Cameras with built in GPS receivers are becoming more and more popular, and
common.  This is a great feature an allows you to review exactly where you
took that holiday photo (which beach in the Australia was that anyway?!).
Many photo management tools, both online and local, such as `Flikr
<https://flikr.com>`_ and `iPhoto <http://www.apple.com/mac/iphoto/>`_ will
happily show you a map of your photo exploits and allow others the share your
travels too.  Unfortunately many (most) cameras don't have native GPS
receivers, but there's a cheap and easy way to achieve the same end result
with some simple software and a mobile phone.  I make an apology at this
point; the rest of this post focusses on two tools for the Apple eco-system.
There are equivalents for Windows and Android too - the workflow is the same,
just the tools are different.

.. TEASER_END

The idea is simple enough; whilst not all cameras have a GPS, practically ANY
smart phone does.  So if we use the phone the track our location then add that
location data to our photos, we've achieved *exactly* the smae result as our
smug GPS-enabled-camera friends.  In some ways, this method is even better as
you only need a single GPS for a whole range of cameras provided your group
(such as a family holiday) are more or less in the same place.  The only
caveat is that the GPS and all cmaeras need to have their clocks in sync.  Not
perfectly in sync, but at least within a minute or two.  This is actually a
lot easier than it sounds.

Step One - Get the software
===========================

I use two tools:

1. `Geotag Photos Pro
   <https://itunes.apple.com/app/geotag-photos-pro/id355503746?mt=8>`_ - this
   runs on iOS and turns your iPhone into a full-featured geotagging tool.
   Configurable to record your location based on time or how far you've move from
   your previously detected position.  Stores the results in Dropbox too for easy
   retrieval later.  I ran this for nearly 2 weeks on a holiday 24 hours a day
   and ended up with a 10.6MB file.
2. `HoudahGeo <http://houdah.com/houdahGeo/>`_ - the magic that inserts your 
   geotag (location) into the photo.  THe beauty of HoudahGeo is it can work with
   flat files (like a directory full of photos), but also directly integrates
   with Apple's iPhoto and Aperture.  Basically it matches the time stamp on the
   photo to the nearest geotag recorded from the file created by your iPhone.

Step Two - The Workflow
=======================

Really, this is why I love this so much - it's so easy:

1. Ensure your cameras are synced to the same time as your GPS.  Beware of time
   zones on some cameras: *USE THE THE ZONE* rather than push around your local
   time zone.  HoudahGeo will thank you.  *Geotag Photos Pro* (iPhone) app has a
   function to show you the time in big bold print that you need enter into your
   camera.  This time synchronisation step is important to the subsequent
   accuracy of the tagging later, so take a minute and get it right.
2. Grab your cameras and iPhone, fire up Geotag Photos Pro on your iPhone and
   take some photos!
3. Load all your photos onto your Mac with iPhoto, Aperture or just a directory
   full of photos.
4. Start HoudahGeo, and follow the workflow in the top right: Load -> Process ->
   Output.

   - Load the photos into HoudahGeo (drag into the top right panel), load the GPS
     track from Dropbox that Geotag Photos Pro into the lower right panel.
   - Now process! This matches the photo time stamps with the GPS track time
     stamps.  You can review and fine-tune the matches if necessary.  You can even
     tag photos, if you know where they were taken, using a map etc.  Lots of
     powerful tools in HoudahGeo to tag your photos.  This guide isn't to show you
     how to use the tools, just run through the process.  Email me if you want to
     know more.

5. Lastly, output the tagged photos into whatever format you need (iPhoto,
   Aperture, flat files etc).
6. Go crack a beer, make a coffee or do whatever you do to celebrate.

As I said earlier, you can use this technique when travelling with a group. My
family and I used this on a trip to New Zealand and ended up with thousands of
photos taken by all four of us, on 5 different cameras, all tagged from a
single GPS track file.  Easy!

The software above isnt perfect though:
* Neither are free (Geotag Photos Pro USD$3.99, HoudahGeo USD$29.00)
* Geotag Photos Pro doesn't log distance travelled, so if this is important (a
lot of hikers want that) you might want to consider other alternatives.
* HoudahGeo is very slow when integrated with iPhoto/APerture but this is more
a limitation on the iPhoto/Aperture API and disk I/O limitations.
