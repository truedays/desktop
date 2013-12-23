#!/bin/bash
# Part of Ray's desktop essentials https://github.com/truedays/desktop/
#
# toggle always on top window flag
#
[ ! -e /usr/bin/wmctrl ] && zenity --warning --title "Missing package" --text "wmctrl needs to be installed.\nRequested by alwaysontop.sh\n"
/usr/bin/wmctrl -r :ACTIVE: -b toggle,above
