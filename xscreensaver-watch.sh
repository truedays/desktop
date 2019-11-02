#!/bin/bash
#logic based off https://bbs.archlinux.org/viewtopic.php?pid=1153128#p1153128
# ray 11/01/2019

process() {
	while read line; do 
		# ignore event when AC is online
		online=$(cat /sys/class/power_supply/AC/online)
		[ $online = "1" ] && continue;

		case "$line" in
			UNBLANK*)
				echo "Unblank"
			;;
			BLANK*)
				echo "Blank"
			;;
			RUN*)
				echo "Run"
			;;
			LOCK*)
				echo "Lock"
			;;
		esac

		# ignore event when AC is unpluged or unknown
		[ $online != "1" ] && continue;

		case "$line" in
			UNBLANK*)
				echo "Unblank"
			;;
			BLANK*)
				echo "Blank"
			;;
			RUN*)
				echo "Run"
			;;
			LOCK*)
				echo "Lock"
			;;
		esac
	done
}

xscreensaver-command -watch | process
