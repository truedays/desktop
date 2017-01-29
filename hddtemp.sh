#!/bin/bash
#
# simple HDD Temp readout (requires hddtemp)
# ray 12/23/2013
# 1.1 07/06/2016 ## dynamic not hardcoded now.

date
##hddtemp /dev/sd{a,b,c,d,g,h}
hddtemp $(smartctl --scan | awk '{print $1}' | xargs echo )
echo " -- "
