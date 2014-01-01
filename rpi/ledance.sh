#!/bin/bash
#
# ledance (L.E.D. [d]ance) bash script for Raspberry Pi
# Ray 12/31/2013

# TODO put CPIO INIT code here

# LEDs are on gpio pin 4 17 27 22
declare -A led=([0]=4 [1]=17 [2]=27 [3]=22)
#echo ${led[0]}
#echo ${led[1]}
#echo ${led[2]}
#echo ${led[3]}

led() {
gpio=${led[${1:-0}]}  # func's argv $1 => 'led' array key
onsec=${2:-.5}
offsec=${3:-.5}
(echo 1 > /sys/class/gpio/gpio${gpio}/value; sleep ${onsec}; echo 0 > /sys/class/gpio/gpio${gpio}/value; sleep ${offsec})&

echo "GPIO: ${gpio:-"xx"} on for $onsec and off for $offsec"
}


ladder() {
for n in 1..${1:-1}
do
  for x in 0 1 2 3
  do
    led $x 1 1
  done
  if [ $n > 1 ] ;then sleep 1; fi
done
}

ladder 2
#led $*


