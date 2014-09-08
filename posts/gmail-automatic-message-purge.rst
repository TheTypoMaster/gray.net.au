.. title: Gmail automatic message purge
.. slug: gmail-automatic-message-purge
.. date: 2014-09-08 13:16:57 UTC+10:00
.. tags: blog,tech
.. link: 
.. description: Automatically purge messages with different labels and custom ages.
.. type: text

I've been running an AppleScript to automatically purge messages in specific IMAP folders (aka "labels") for quite some time.  This approach works most of the time, but really puts a heck of a load on the Apple Mail client and makes the interface effectively unusable while the script goes through the motions.  This wasn't a problem when the script finished in a few seconds.  However, it now takes several minutes; not good.  Also, the AppleScript assumes a blanket expiry age for all IMAP folders.  Want one folder with a different expiry? Too bad.  So with the interface problems and lack of flexibility, I decided to smash something out this morning using Google Apps Scripting.

.. TEASER_END

I had some simple requirements for my new server-side script:

* Must run when I'm off-line
* Don't delete unread messages/threads
* Allow fine-grain, per-label expiry age (in days)
* Keep a plain text log file in my Google Drive.

Behold! I offer the following, which achieves **all** the above requirements and is triggered to run every 30 minutes:

.. code-block:: javascript
	:number-lines:

	function cleanUp() {
		var myLabels = {
			// "Path/to/label":DAYS,
			// Where DAYS is the number of days to keep read messages.  Unread messages aren't touched.
			"INBOX/Mail Lists/CERT":14,
			"INBOX/Mail Lists/Nikola":7,
			// Keep going with any/all labels you want to be automatically purged :)
			"INBOX/System Messages/Router":14,
			"INBOX/System Messages/Web Site":7
		}

		// Iterate over folders and see if there is anything we need to do...
		for (myKey in myLabels) {
			var label = GmailApp.getUserLabelByName(myKey);
			var days = myLabels[myKey];

			// Make sure we have a valid expiry window
			if ( days > 0 ) {
				// Calculate an absolute date/time to purge messages older than...
				var maxDate = new Date();
				maxDate.setDate(maxDate.getDate()-days);
				var threads = label.getThreads();

				// Counter to log how many message are purged.
				var deleted = 0;

				// Log what we're about to do...
				Logger.log("Purging '" + label.getName() + "' older than " + days + " days (" + maxDate +")" );

				// Iterate over the messages in the managed folder
				for (var i = 0; i < threads.length; i++) {
					// Is this message old enough to purge?
					if (threads[i].getLastMessageDate()<maxDate) {
						// It's old enough, but is it unread?
						if (!threads[i].isUnread()) {
							threads[i].moveToTrash();  // Purge this message: it's old enough and marked "read".
							deleted++;                 // Increment deleted message counter.
						}
					}
				}

				// Only log a message if we did something
				if ( deleted > 0 ) {
					Logger.log("Deleted " + deleted + " messages from \"" + label.getName() + "\"");
				}
			}
		}

		// The results to the log file
		logFile();
	};

	function logFile() {
		var LogFile = "mail-purge.log";
		var rootFolder = DocsList.getRootFolder();
		var logs = rootFolder.find(LogFile);
		var thisLog = logs[0];

		if(logs.length == 0
			// Didn't find the log file...create a new one.
			Logger.log("Creating new log file")
			thisLog = DocsList.createFile(LogFile, "New log file");
		} else {
			// Log the fact we found an existing log - largely redundant, but I like it.
			Logger.log("Found existing log file " + thisLog.getName());
		}

		// Append the current internal log buffer to the file
		thisLog.append(Logger.getLog());
	};


I think it's pretty self explanatory.  The mechanisms for creating the script and firing it with time-based triggers I'll leave for a exercise for the reader.  If you really get stuck, drop a comment below and I'll see if I can help :)  Happy scripting folks!