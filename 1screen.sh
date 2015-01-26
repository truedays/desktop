#!/bin/sh
xrandr $(xrandr |  grep " connected "| sed 's/\(^.*\) connected.*/\1/g' | xargs -i%  echo -ne "--output % --off ")
#xrandr --output eDP-0 --off --output DP-0-1 --off --output DP-0-2 --off --output DP-0-3 --off
xrandr --output DP-0-2 --off --output DP-0-3 --off --output DP-0-1 --off --output eDP-0 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off --output HDMI-0 --off --output DP-0 --off
