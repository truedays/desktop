#!/bin/bash
# my horrible way to make large numbers readable with sed
# 12/17/2016 v0.2
# ray@truedays.org

# TODO: figure out how to not have to `rev`erse the input, but this works well [fast] enough.

# we don't take any arguments--yet
[[ $# -gt 0 ]] && exit 1

while read input; do
echo "$input" | \
/usr/bin/rev | \
sed -re 's/([0-9]{3})([0-9]{3})/\1,\2/g'   \
     -e 's/([0-9]{3})([0-9]{2})/\1,\2/g'   \
     -e 's/([0-9]{3})([0-9]{1})/\1,\2/g' | \
/usr/bin/rev
done

exit 0
