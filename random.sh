#!/bin/bash
#
# testing $RANDOM

MAX=32767
MIN=0

trap abort SIGINT

abort(){
echo "---- aborted ----"
quit
}

quit(){
echo "$n numbers generated of which $high was the largest number and $low was the smallest"
exit 0;
}

roll(){ #this is where I play with $RANDOM
 RANDOM=$(date +%s)
 x=$RANDOM
 #x=$(($RANDOM%30))

}

while :; do
 n=$(($n+1))
 roll
 [[ $x -gt ${high:-$MIN} ]] && high=$x && echo "new high number: $high"
 [[ $x -lt ${low:-$MAX} ]] && low=$x && echo "new low number: $low"
 [[ $high -eq 32767 && $low -eq 0 ]] && echo "Both max/low vaule reached" && quit

done

