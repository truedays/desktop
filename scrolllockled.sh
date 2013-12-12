#!/bin/bash
#
# toggle Scroll Lock LED on keyboard
#
Author="Ray"
Version="v.01  December 12, 2013"
URL="https://github.com/truedays/desktop/"
# https://github.com/truedays/desktop

# Original command:
# sudo bash -c "/usr/bin/setleds -D +scroll < /dev/tty1"

if [ ! $UID -eq 0 ]
 then
 cat <<-EOM

	-- NON-root user detected --

	You need to run this script as root
	Setting a SUID bit here won't do. Instead use my
	compiled wrapper. It should be named ${0/.sh/}

	Latest: $URL
	$Author :: $Version


EOM
exit 1
fi

# Get parent process name
# ps -ocommand= -p $PPID | awk -F/ '{print $NF}' | awk '{print $1}'

function ScrollLedOff {
/usr/bin/setleds -D -scroll < /dev/tty1
exit
}
function ScrollLedOn {
/usr/bin/setleds -D +scroll < /dev/tty1
exit
}

if [ $# -eq 0 ] # Test if any argument given
then # no ARGS
ScrollLedOff
fi

case $1 in
	1|on|ON|On)	ScrollLedOn ;;
	help|*h*|*v*)	echo -e "$URL\n$Author :: $Version\n\nUsage: $0 [on|off]  (default: off)\n"; exit  ;;
	*)		ScrollLedOff ;;
esac
echo "EOF reached +++"
exit 0
