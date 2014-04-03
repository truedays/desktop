#!/bin/bash
#
# prereq: html2text
# URL: https://github.com/truedays/desktop
#
# NOTE:  hardcored cordinates are for Arl. Hts. http://forecast.weather.gov/MapClick.php?textField1=42.1099506&textField2=-87.98247579999997
# ToDo: remove head -n2 to get detailed report.. add this later

if [ ! $(which html2text > /dev/null 2&>1) ]
 then echo "This script relies on html2text (http://www.mbayer.de/html2text/)"
 exit 1
fi
##while :;
##do
lynx --dump "http://forecast.weather.gov/MapClick.php?lat=42.13133052651052&lon=-87.99190521240234" -source | egrep "<p class=\"myforecast-current\">.*one-third" --color | html2text | head -n2 | xargs echo | tee -a /tmp/weather.log
##sleep 900
##done

#look for anything looking like I want to log (ex: weather.sh -log) otherwise exit now
case $1 in
  *[Ll]*) ;;
  *) exit ;;
esac

/usr/bin/awk '{print $1}' /tmp/weather.log > /tmp/weather.log.tmp
sort -u /tmp/weather.log.tmp > /tmp/weather.log
rm /tmp/weather.log.tmp

