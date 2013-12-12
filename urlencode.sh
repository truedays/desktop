#!/bin/bash
# URL Encoder
# Ray 12/12/2013
#

# Enocde as much of the string as possible

# combine all user args to one string
string=$*
# length of string
lenofstring=${#string}
#echo lenofstring: $lenofstring

echo $string
echo lenth of string is ${#string}
echo

for each in `seq 0 $lenofstring`
 do 
 echo ${string:$each:1}
done


