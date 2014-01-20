#!/bin/bash
#
# This fixes my resolution on the HP montor at work
# Ray Nov 7, 2013

/usr/bin/xrandr  --newmode "1920x1200 60" 193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
/usr/bin/xrandr --addmode VGA-1 1920x1200
/usr/bin/xrandr --output VGA-1 --mode 1920x1200


# ~/github/desktop/desllandhp.sh to apply screen layout
#~/github/desktop/dellandhp.sh -hpright
~/github/desktop/dellandhp.sh
