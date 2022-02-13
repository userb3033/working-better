working-better
Don't just work hard, work BETTER!

README, aka the MANIFESTO:

Please read.  There's important stuff here, and it's also got a bit of humor.

This script is for those of you working remotely or perhaps not, with screen monitoring software in place which tracks your
productivity and ridiculously docks you for things like going to the bathroom, having a quick chat with a co-worker
grabbing a cup of coffee, or so on.  Some even take screenshots at random times.  The moment there's no "activity," your "score"
drops. Heaven forbid, changing a diaper takes longer than you thought and suddenly your screensaver comes on,  and then your boss
is breathing down your neck because you weren't working hard enough.

Why this is allowed in the USA, a supposedly "free" country, is beyond me, but that's a different fight.

In the meantime, until employers realize how shitty they are or until this stuff is made illegal, let me introduce Working BETTER!  (You're not
just working hard, you're Working BETTER!)

It will diddle the mouse, switch virtual desktops, type in search words for you, and do stuff to ensure you're still working hard...even
if you're grabbing that cup of coffee, changing that diaper, or god forbid, texting on your phone. It can't yet file TPS reports for you,
but it will mind your system unattended for a bit while you go to the john.

USING WORKING-BETTER.SH

It is almost ready to go out of the box but please take a moment to check through everything, as there are a few
spots that you will need to customize, marked with ############# CUSTOMIZE #############.  There is also a README file.

To run, just copy it to a location, use "chmod +x working-better.sh" to make it executable, and run either by the Quicklauncher method
I describe in the README.txt or just run at the command line, with "./working-better.sh X" where X is the number of minutes you want it to run.

I prefer the Quicklaunch because in my case, screenshots are being taken and I don't want my boss wondering why I'm typing "./working-better.sh" if
a random screenshot happens when I'm about to run it.  With the Quicklaunch, it's nicely hidden behind an innocuous toolbar icon, and you just click.

Be warned, once it's going, it really takes over and it's hard to do anything until it finishes.  So don't run it
for an hour at a time if you might need to actually work on your computer.  And while it will diddle the mouse and keep your productivity SCORE up
your real productivity may be lacking, so I accept no responsibility if using this gets you reprimanded or fired. This README has additional info
about steps I've taken to keep this discreet below, but I'm sure your boss will take a dim view of you running this.

So again: Buyer beware. This is at your
own risk. And remember to remove it if you're returning a work computer.  "rm working-better.sh" is your friend.

But it's a nifty little script, and if it gives you peace of mind on that Monday morning when you're just trying to get through the day...PLEASE
consider making a donation or buying me a coffee.  I am not a programmer, just a guy like you who got fed up with feeling
like I can't even go to the bathroom anymore.

Donate:  https://buymeacoffee.com/userb3033
License:  GNU General Public License v3.0

THANK YOU!

NOTE:  If you have Lubuntu, I've been able to make a Shortcut key work to interrupt the program with a lone keystroke. I assume it's doable for other
systems as well, but you're on your own there.  I highly recommend enabling that as well, since it is hard to stop once it's going.

So without further ado, let's start working BETTER!

################# END OF THE MANIFESTO #########################


INSTALLATION:

Simply copy the working-better.sh script to whatever directory you choose, and then "chmod +x" to make it executable.  As intitially configured, it is set for 4 virtual desktops, most of which are assumed to run a browser.  On desktop 4, it will make searches in said browser based on search words and phrases that YOU WILL NEED TO ALTER to suit your likely work-related searchings.  DO NOT SKIP THAT STEP or your boss will see you're searching for terms related to the cult classic movie _Office Space_.

RUNNING WORKING-BETTER.SH:

To run, simply type "./working-better.sh X" where X is a number of minutes you want it to run.

BE WARNED: this program will take control of the mouse and leave your computer inoperable for that length of time, so either set up the escape key option, or plan to be working "better" that entire time.

HIGHLY RECOMMENDED SUGGESTIONS:

I did not want a random screenshot of my system to show that I'm typing "./working-better.sh 10" into a terminal window, so I crafted a desktop Quicklaunch button to launch it with a click.  The first thing the program does is move the mouse off the button, too, so that the "Working Better" tooltip doesn't even show and be accidentally screengrabbed.  I highly recommend taking the time to do that.

I also made a Shortcut Key to kill the program with a single click so that I can hit the Windows key at any time while it's running and it will stop.  That's important because sometimes you may NEED to be actually working suddenly after starting it.  Your boss sends you something on Slack, you realize you forgot to turn in a TPS report, who knows.  Since the script will take over your keyboard and mouse and window focus quite aggressively, the Shortcut Key method is the best to stop it.  If you can't get that to work, just be sure to run it for short periods.

You can set an alert (I have a rooster crowing) at the end when it's done.  To do this, you need a .wav file of your choice.  A bell, a buzz, a snarky quote, whatever.  Obviously, if you are working in an office, it should either not be used (the default) or the alert should fit in nicely with your normal work environment.

TECHNICAL NOTE:  I only know this works (and works beautifully) on Lubuntu.  If you get this to work on other systems I will happily add instructions for those into this document if you care to send me the info.  But I am NOT a programming guru in any way, so I probably can't offer tech support.  Sorry.

HOWTO:

SET UP THE QUICKLAUNCH BUTTON:

Copy the .desktop file to your /usr/share/applications/ folder.
Edit your .config/lxqt/panel.conf folder.  Find the "Quicklaunch" section, and copy the last line, pasting it in to a new line below.  Then add 1 to the number, so that it's one greater than the previous line, and change the end to "working-better.desktop" in place of whatever's there (below, it's "google-chrome.desktop").  

Here's what mine looked like before:

[quicklaunch]
alignment=Left
apps\1\desktop=/usr/share/applications/pcmanfm-qt.desktop
apps\2\desktop=/usr/share/applications/firefox.desktop
apps\3\desktop=/usr/share/applications/google-chrome.desktop
---> add it here <---
apps\size=4
type=quicklaunch

And I added this line where the "add it here" space is:
apps\4\desktop=/usr/share/applications/working-better.desktop

Save the file.

When you restart or log out and back in again, you should find the "Working Better" utility in your main applications list (in "Other"), and you will be able to drag it down into your Quicklaunch section.  For some reason it didn't show up initially down there until I dragged it.

I highly recommend using an icon for it that is boring and ubiquitous. The default is "firefox" but you can use whatever you like.  It doesn't matter.

SET UP THE SHORTCUT KEY TO KILL IT:

Download "stop-working.sh"

Go to your Application launcher > Preferences > LXQt Settings > Shortcut Keys > Add.  Click on the "Shortcut" button and it will count down from 10.  Press the key or key combo you want to use to stop the program.  In my case, I've used the Windows key, aka "Super L".  Add the full path to the "stop-working.sh" script and save.  Because Super L is already being used, I edit the other and disable that.  If your key combo is unique, you won't have to.

Log out and back in.  You should see your new quicklaunch icon sitting there, and if you click it, you'll see you're Working BETTER already.  To stop, hit the Shortcut key.

As I mention in the program itself, this will diddle the mouse and such, but it won't actually do any real work for you.  You could even be fired.  So use this entirely at your own risk, with no guarantee or warranty.  Use of this program constitutes acceptance of these listed risks and risks that may be unspecified.

Again, if you're able to send thanks in the form of a "cup of coffee" you'll be raising your karma points bigtime:

https://buymeacoffee.com/userb3033
