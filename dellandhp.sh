#!/bin/sh
# This applies my monitor layout for my debian desktop at the office
# This file gets called by ~/github/desktop/xrandr_fix.sh
# Ray Nov 07, 2013

xrandr --output VGA-1 --mode 1920x1200 --pos 2560x0 --rotate right --output DVI-I-1 --mode 2560x1440 --pos 0x224 --rotate normal --output HDMI-1 --off
