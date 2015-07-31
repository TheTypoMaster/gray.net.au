.. title: Finally - automatic old message deletion in Apple Mail
.. slug: Automatic_old_message_deletion_in_Apple_Mail
.. date: 2009-12-30 20:47:14 UTC+10:00
.. tags: tech,blog,James
.. category: 
.. link: 

For quite a while it's bugged me that there was nothing in Apple Mail that
allowed you to delete messages automatically older than a certain number of
days.  For me this is a big problem as I subscribe to a number very high
volume mail lists and having to muck around with "Smart Mailboxes" to find
the old messages and then delete them manually was a royal pain.  Well, I
decided to get in a New Year's resolution early and put in place a more
elegant solution.

OK, so enough of the introduction, here's how it works:

Create an Apple Script that hunts down all the old messages and delete them.
Run script in #1 every time a message is received.
Now #2 might seem a little onerous but it's actually quite fast and really doesn't impact the performance of the system or mail delivery at all :)  Below is the Apple Script for the first part:

::


	set daysBeforeArchive to 14
	set mailboxList to { "INBOX/Path/To/Mailbox1", "INBOX/Path/To/Mailbox2", "INBOX/Path/To/Mailbox3"}

	tell application "Mail"
	    -- this archives all Listed Folders' Messages older than 14 days
	    repeat with theCurrentMailbox in mailboxList
	        set emailList to (every message of (mailbox theCurrentMailbox of account "My Account") whose date received ? ((current date) - daysBeforeArchive * days))
	        if (count emailList) is greater than 0 then
	            move emailList to mailbox "Trash" of account "My Account"
	        end if
	    end repeat
	end tell

	display dialog "Executed email clean-up script" buttons ["OK"]

Now a little explanation on how to adapt it to your mail client.  Change
the "mailboxList" to include all the folders you want old messages purged
from.  This list is comma-separated and elements need to be quoted if the
contain white space or special characters...if in doubt, quote everything -
it wont hurt.  Also, this list MUST be on a single line (AppleScript Editor
does a nice job of wrapping and indenting so just go with it).  Lastly, change
the account "My Account" to match the mail account containing the mailboxes in
"mailboxList".  Obviously, modify the "daysBeforeArchive" to set the number of
days to keep, and feel free to ditch the dialog box at the end; it only exists
to confirm it was running on new message arrival...artifact from testing :P

Once you've edited and tested the script enjoy :)

*Be aware, this script moves stuff to TRASH meaning if you don't test it, and
it eats your mailbox, don't come crying to me!*

