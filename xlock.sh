#!/bin/bash
#
# 02/19/2016
# 08/13/2016 Added trusted network exception
# 10/03/2016 clean up and added 'UG' (aka default route) auto-detect, may have broke this with pulling trusted MAC from file
#
# cron this to prevent crashed xscreensaver from leaving the computer unlocked.


#### whoa.. this script has a horrible bug which spawns off hundreds of xlock.sh when xscreensaver needs to be restarted

TRUSTED_MACS='~/.xlock.sh.trusted'
MACS="$(cat $TRUSTED_MACS | grep -vE '^( .*|#.*)?$')" # give up one layer of security for convenience

# Assuming one default route gateway. NOT TESTED with multiple routes flagged with 'UG'
GATEWAY="$(route -n | grep 'UG' | awk '{print $2}' | grep -vF '0.0.0.0' | grep -Eo '[.0-9]*' | sort -u | head -n1)"

if [[ -f $(which arping) ]]; then
  for MAC in $MACS; do 
    if [[ "$(arping -f -I wlp2s0 ${GATEWAY} | grep -Eo '([0-9A-F]{2}[:-]){5}([0-9A-F]{2})')" == "${MAC}" ]]; then
      exit 0
    fi
  done
fi

xscreensaver-command --lock || { $0 xscreensaver needed to be restarted.; xscreensaver -nosplash& disown; xscreensaver-command --lock || logger FATAL $0: xscreensaver can not be started.; exit 1; }
