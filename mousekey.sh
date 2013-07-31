#!/bin/bash
# Part of Ray's desktop essentials https://github.com/truedays/desktop/
#
# Toggle mouse keys. keybind to alt-numlock
# Thanks to @ToZ http://forum.xfce.org/viewtopic.php?id=8230
#  **Must first enable settings >> accessibility >> Enable Mouse emulation. This solves:
#  **Property "/MouseKeys" does not exist on channel "accessibility".

[ $(xfconf-query -c accessibility -p /MouseKeys) == "false" ] \
	&& $(xfconf-query -c accessibility -p /MouseKeys -s true) \
	|| $(xfconf-query -c accessibility -p /MouseKeys -s false)
