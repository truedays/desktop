#!/bin/bash
# Part of Ray's desktop essentials https://github.com/truedays/desktop/
#
# Toggle mouse keys. keybind to alt-numlock
# Thanks to @ToZ http://forum.xfce.org/viewtopic.php?id=8230
#  **Must first enable settings >> accessibility >> Enable Mouse emulation. This solves:
#  **Property "/MouseKeys" does not exist on channel "accessibility".

# Test if enabled mouse accessibility has ever been enabled and if not create the property  (CURRENTLY UNTESTED)
##xfconf-query --list --channel accessibility 2>&1 >/dev/null || xfconf-query --create --channel accessibility --property /MouseKeys 2>&1 > /dev/null || {echo "Failed to enabled mousekeys. Are you running XFCE4"; exit 1}
xfconf-query --list --channel accessibility 2>&1 >/dev/null || xfconf-query --create --channel accessibility --property /MouseKeys 2>&1 > /dev/null || echo "Failed to enabled mousekeys. Are you running XFCE4"

[ "$(xfconf-query -c accessibility -p /MouseKeys)" == "false" ] \
	&& $(xfconf-query -c accessibility -p /MouseKeys -s true) \
	|| $(xfconf-query -c accessibility -p /MouseKeys -s false)
