#!/bin/bash
#
# testing $RANDOM

MAX=32767
MIN=0

trap abort SIGINT

abort(){
echo "---- aborted ----"
echo "$n numbers generated of which $high was the largest number and $low was the smallest"
exit 0;
}

roll(){ #this is where I play with $RANDOM
 x=$RANDOM

}

while :; do
 n=$(($n+1))
 roll
 [[ $x -gt ${high:-$MIN} ]] && high=$x && echo "new high number: $high"
 [[ $x -lt ${low:-$MAX} ]] && low=$x && echo "new low number: $low"
# [[ $x -eq 32767 ]] && echo "$x reached" && abort

done

