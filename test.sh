#!/bin/bash
#

echo $*
echo "1:$1  2:$2  3:$3"

set -- "$@:1:2}" "new" "${@:4}"

echo $*
echo "1:$1  2:$2  3:$3"
