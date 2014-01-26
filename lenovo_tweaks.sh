#!/bin/bash
# Collection of tweaks for the lenovo x1 carbon
#
# https://github.com/truedays/desktop/
#

## Disable right-click area on touchpad
synclient RightButtonAreaTop=0 ; synclient RightButtonAreaLeft=0

## Swap Right-Alt key to Context Menu key
xmodmap -e "keycode 108 = Menu"  # Change RightAlt into Menu key
echo "xmodmap -e "keycode 108 = Menu"  # Change RightAlt into Menu key" >> ~/.Xmodmap

