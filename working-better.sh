#! /bin/bash

#Please read.  There's important stuff here, and it's also got a bit of humor. 

#This script is for those of you working remotely or perhaps not, with screen monitoring software in place which tracks your
#productivity and ridiculously docks you for things like going to the bathroom, having a quick chat with a co-worker
#grabbing a cup of coffee, or so on.  Some even take screenshots at random times.  The moment there's no "activity," your "score"
#drops. Heaven forbid, changing a diaper takes longer than you thought and suddenly your screensaver comes on,  and then your boss
#is breathing down your neck because you weren't working hard enough.

#Why this is allowed in the USA, a supposedly "free" country, is beyond me, but that's a different fight.

#In the meantime, until employers realize how shitty they are or until this stuff is made illegal, let me introduce Working BETTER!

#(You're not just working hard, you're Working BETTER!)

#It will diddle the mouse, switch virtual desktops, type in search words for you, and do stuff to ensure you're still working hard...even
#if you're grabbing that cup of coffee, changing that diaper, or god forbid, texting on your phone. It can't yet file TPS reports for you,
#but it will mind your system unattended for a bit while you go to the john.  Heck, go outside and look up at the sky for a moment. Life is short.

#USING WORKING-BETTER.SH

#It is almost ready to go out of the box but please take a moment to check through everything, as there are a few
#spots that you will need to customize, marked with ############# CUSTOMIZE #############.  There is also a README file.

#Customizing is basic, but you will need to know how to edit a text file (emacs, vi, whatever).

#To run, just copy it to a location, use "chmod +x working-better.sh" to make it executable, and run either by the Quicklauncher method
#I describe in the README.txt or just run at the command line, with "./working-better.sh X" where X is the number of minutes you want it to run.

#I prefer the Quicklaunch because in my case, screenshots are being taken and I don't want my boss wondering why I'm typing "./working-better.sh" if
#a random screenshot happens when I'm about to run it.  With the Quicklaunch, it's nicely hidden behind an innocuous toolbar icon, and you just click.

#Be warned, once it's going, it really takes over and it's hard to do anything until it finishes.  So don't run it
#for an hour at a time if you might need to actually work on your computer.  And while it will diddle the mouse and keep your productivity SCORE up
#your real productivity may be lacking, so I accept no responsibility if using this gets you reprimanded or fired. The README has additional info
#about steps I've taken to keep this discreet, but I'm sure your boss will take a dim view of you running this. So again: Buyer beware. This is at your
#own risk. And remember to remove it if you're returning a work computer.  "rm working-better.sh" is your friend. Then "rm .bash_history" for good measure.

#But it's a nifty little script, and if it gives you peace of mind on that Monday morning when you're just trying to get through the day...PLEASE
#consider making a donation or buying me a coffee.  I am not a programmer, just a guy like you who got fed up with feeling
#like I can't even go to the bathroom anymore.

#Donate:  https://buymeacoffee.com/userb3033

#License:  GNU General Public License v3.0

#THANK YOU!

#NOTE:  If you have Lubuntu, I've been able to make a Shortcut key work to interrupt the program with a lone keystroke. I assume it's doable for other
#systems as well, but you're on your own there.  I highly recommend enabling that as well, since it is hard to stop once it's going.

#So without further ado, let's start working BETTER!

################# END OF THE MANIFESTO #########################



################# START OF THE SCRIPT ##########################

#lifts mouse off button so tooltip doesn't say visible
xdotool mousemove 400 400 


#This calculates how long to work, based on ./working-better.sh X, where X is the number of minutes you want it to run.
#i.e. ./working-better.sh 10

start=$(date +%s)
end=($1*60)
stop=$((start+end))

#while loop sets up the timer, when it's done, you stop working BETTER and get back to work.

while [ $start -le $stop ]

do
 
    #This is designed to switch randomly between 4 different virtual desktops.
    #If you have a different number than 4, subtract 1 from your desktop count and use that number below
    #
    #Replace "3" with the right number for your system, for example, if you have 8 desktops, use 7 below instead of 3

    #choose a desktop
    ############# CUSTOMIZE #############
    desktop=$(shuf -i 0-3 -n 1)
    ############# END CUSTOMIZE #########

    
    #move to the chosen desktop
    wmctrl -s $desktop

    #pause 3 secs
    #Don't want to be working TOO much better now, do we!
    sleep 2

    #Now the fun part, working BETTER!
    #I've got different things set up for each desktop here.  If you have a different number of desktops,
    #you'll want to add more/less cases here.
    
    case $desktop in

	0) xdotool getactivewindow key --clearmodifiers mousemove --window %1 500 500
	   xdotool click 5 click 5 click 5 click 4 click 5 click 5 click 4 click 4 click 5 click 5 click 5 click 4 click 4 click 4 click 5 click 4 click 5 click 4 click 4 click 5 click 4 click 5 click 4 click 4
	   #take a break
	   yawn=$(shuf -i 1-4 -n 1)
	   sleep $yawn
	   xdotool click 5 click 5 click 5 click 4 click 5 click 5 click 4 click 4 click 5 click 5 click 5 click 4 click 4 click 4 click 5 click 4 click 5 click 4 click 4 click 5 click 4 click 5 click 4 click 4;;
	    
	    
	1)  #take a break
	    yawn=$(shuf -i 1-5 -n 1)
	    sleep $yawn
	    xdotool getactivewindow key --clearmodifiers mousemove --window %1 400 400
	    scroll=$(shuf -i 1-20 -n 1)
	    for (( x=1; x<=$scroll; x++ ))
	    do
		updown=$(shuf -i 0-1 -n 1)
		case $updown in
		    0) xdotool click 5 click 5 click 5 click 4 click 4 click 5 click 5 click 5 click 4 click 4 click 5 click 5 click 5 click 4 click 4 click 5 click 5 click 5 click 4 click 4;;
		    1) xdotool click 4 click 4 click 4 click 5 click 4 click 4 click 4 click 4 click 5 click 4 click 4 click 4 click 4 click 5 click 4 click 4 click 4 click 4 click 5 click 4;;
		esac
	    done
	  ;;
	    
	2)  xdotool getactivewindow key --clearmodifiers mousemove --window %1 200 600
	    xdotool click 5 click 5 click 5 click 4 click 5 click 5 click 4 click 4 click 5 click 5 click 5 click 4 click 4 click 4 click 5 click 4 click 5 click 4 click 4 click 5 click 4 click 5 click 4 click 4;;

	############# CUSTOMIZE ***IMPORTANT*** #############
	3)   #focus the URL bar and type one of the twenty options and search Google for them (You will want to make sure a browser is open on Desktop 4)
	    #Replace what's in quotes with an appropriate string that you might be searching for at work
	    #BE SURE that everything you put into here is work-appropriate, as it makes it look like you're diligently searching on Google
	    #if you feel like it, add or subtract from the list, just be sure the 19 in the $ipsum line below gets changed to match
	    declare -a lorem=(
		"PC LOAD LETTER"
		"TPS reports"
		"https://www.imdb.com/find?s=all&q=office%20space"
		"Peter Gibbons"
		"red swingline stapler"
		"!maps austin tx"
		"!images TPS reports"
		"!images Swingline stapler"
		"red stapler"
		"pc load letter"
		"ass clown"
		"Initech"
		"Bill Lumbergh"
		"The thing is, Bob, it's not that I'm lazy, it's that I just don't care."
		"Human beings were not meant to sit in little cubicles staring at computer screens all day"
		"eight bosses"
		"What about today? Is today the worst day of your life?"
		"!images red stapler"
		"TPS REPORTS"
		"Swingline stapler"
	    )
	    ############# END CUSTOMIZE #########

	    ipsum=$(shuf -i 0-19 -n 1)
	    xdotool getactivewindow key --clearmodifiers ctrl+l
	    xdotool type --delay 25 "${lorem[$ipsum]}"

	    #take a time to look over these search results!
	    yawn=$(shuf -i 1-6 -n 1)
	    sleep $yawn
	    #searches for the search term
	    xdotool getactivewindow key Return
    
	    #take a break
	    yawn=$(shuf -i 1-6 -n 1)
	    sleep $yawn

	    #Let's scroll a bit in those search results, shall we?
	    xdotool click 5 click 5 click 5 click 4 click 5 click 5 click 4 click 4 click 5 click 5 click 5 click 4 click 4 click 4 click 5 click 4 click 5 click 4 click 4 click 5 click 4 click 5 click 4 click 4;;

	#if (and only if!) you have additional desktops you'll need to add additional cases here.  Perhaps.
	#If you do need them, you're on your own for that part, but cutting and pasting the above, then making modifications may do the trick.  Good luck!
	#If you have 4 desktops, ignore this, you're all set.

	############# Optional CUSTOMIZE #############
	#4) some code here
	#5) some code here
	#6) some code here
	#7) some code here
	############# END CUSTOMIZE #########
    esac
    
    #add to timer, go back to the beginning, and keep on working BETTER!
    start=$(date +%s)
    
done

#Mine is configured to play a rooster crowing alert when I've finished working BETTER.  If you want an alert, uncomment below and
#replace the "/path/to/something.wav" with an alarm file of your choice.  A beep. A crowing rooster. A boss asking where those TPS reports are...anything.
#if you'll be using this under the radar at an office, leave as is and no alarm will happen.

############# CUSTOMIZE #############
#aplay /path/to/something.wav
############# END CUSTOMIZE #########

#As written, depending on what software your company is running that's monitoring keystrokes, mouse movement, and taking screenshots,
#this will give you about 64 to 78 percent productivity during the period, which should be sufficient.
#If you notice it's too high or too low, adjust the "yawn" variables above until it's in a range that suits you.
#Good luck and remember, you're not just working hard.  You're working BETTER.

#And again, if this software helps you grab a cup of coffee without worrying that your productivity rating is
#suddenly dropping or you'll be docked pay by your eight bosses, please consider
#buying me a coffee or making a donation that fits what you can spare. Thank you in advance.  Now get back to work.

#    https://buymeacoffee.com/userb3033
