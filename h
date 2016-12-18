#!/bin/bash
# my horrible way to make large numbers readable with sed
# 12/17/2016 v0.2
# ray@truedays.org

# this only works via pipe and no arguments #maybe add option to handle really large numbers or smaller numbers more efficiently.
[[ $# -gt 0 ]] && exit 1


while read input; do
echo "$input" | \
/usr/bin/rev | \
sed -r 's/([0-9]{3})([0-9]{3})/\1,\2/g' | \
sed -r 's/([0-9]{3})([0-9]{2})/\1,\2/g' | \
sed -r 's/([0-9]{3})([0-9]{1})/\1,\2/g' | \
/usr/bin/rev
done

exit 0
