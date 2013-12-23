#!/bin/bash
#
# simple HDD Temp readout (requires hddtemp)
# ray 12/23/2013
#

date
hddtemp /dev/sd{a,b,c,d,g,h}
echo " -- "
