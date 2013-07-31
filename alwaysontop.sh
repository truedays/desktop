#!/bin/bash
# Part of Ray's desktop essentials https://github.com/truedays/desktop/
#
# toggle always on top window flag
#
/usr/bin/wmctrl -r :ACTIVE: -b toggle,above
