#!/bin/bash
#logic based off https://bbs.archlinux.org/viewtopic.php?pid=1153128#p1153128
# ray 11/01/2019

process() {
	while read line; do 
		echo " ____ $line ____"
		#online=$(cat /sys/class/power_supply/AC/online)
		## ignore event when AC is unpluged or unknown
		## AC power is plugged in and Online
		#[ $online != "1" ] && continue;

		case "$line" in
			UNBLANK*)
				addmsg "Unblank";
				killall -s CONT firefox chrome
				addmsg "Pausing firefox and chrome"
				showmsg;
			;;
			BLANK*)
				addmsg "Blank"
			;;
			RUN*)
				addmsg "Run"
			;;
			LOCK*)
				addmsg "Lock"
				killall -s STOP firefox chrome
				addmsg "Pausing firefox and chrome"
			;;
			*)
				addmsg "Unknown"
		esac

		# ignore event when AC is online
		[ $online = "1" ] && continue;

		case "$line" in
			UNBLANK*)
				addmsg "Unblank"
			;;
			BLANK*)
				addmsg "Blank"
			;;
			RUN*)
				addmsg "Run"
			;;
			LOCK*)
				addmsg "Lock"
			;;
		esac
	done
}

msgfile="/tmp/.${0/.\//}.msglog"
addmsg() {
	echo "$(date '+%a %D %H:%M:%S') $*" >> $msgfile
}
clrmsg() {
	echo "$(date '+%a %D %H:%M:%S') ScreenSaver Messages Cleared" > $msgfile
}
showmsg() {
	zenity \
	--display=:1.0 \
	--text-info \
	--filename=$msgfile \
	--title='ScreenSaver Messages' \
	--ok-label 'OK - Acknowledge and clear messages' \
	--cancel-label 'Close' \
	--checkbox="Clear Messages" \
	--modal \
	--no-wrap \
	--window-icon=/usr/share/zenity/clothes/sunglasses.png \
	&& clrmsg
}

xscreensaver-command -watch | process
