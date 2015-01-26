#!/bin/sh
xrandr $(xrandr |  grep " connected "| sed 's/\(^.*\) connected.*/\1/g' | xargs -i%  echo -ne "--output % --off ")
#xrandr --output eDP-0 --off --output DP-0-1 --off --output DP-0-2 --off --output DP-0-3 --off
xrandr --output DP-0-2 --mode 1920x1080 --pos 1920x312 --rotate normal --output DP-0-3 --mode 1920x1080 --pos 3840x0 --rotate right --output DP-0-1 --mode 1920x1080 --pos 0x312 --rotate normal --output eDP-0 --off --output HDMI-1 --off --output HDMI-0 --off --output DP-0 --off
