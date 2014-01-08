#!/bin/bash
#
# prereq: html2text
# URL: https://github.com/truedays/desktop
#
# NOTE:  hardcored cordinates are for Arl. Hts. http://forecast.weather.gov/MapClick.php?textField1=42.1099506&textField2=-87.98247579999997
# ToDo: remove head -n2 to get detailed report.. add this later
##while :;
##do
lynx --dump "http://forecast.weather.gov/MapClick.php?textField1=42.1099506&textField2=-87.98247579999997" -source | egrep "<p class=\"myforecast-current\">.*one-third" --color | html2text | head -n2 | xargs echo | tee -a /tmp/weather.log
##sleep 900
##done

mv /tmp/weather.log{,.tmp}
/usr/bin/sort -ug /tmp/weather.log.tmp > /tmp/weather.log
