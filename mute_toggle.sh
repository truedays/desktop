#!/bin/bash
# Part of Ray's desktop essentials https://github.com/truedays/desktop/
#
# Get mute status and toggle on/off
# Suggested hotkey: <Super> F1
#
/usr/bin/amixer -c 0 get Master | /bin/grep -q off && /usr/bin/amixer -c 0 set Master unmute || /usr/bin/amixer -c 0 set Master mute
