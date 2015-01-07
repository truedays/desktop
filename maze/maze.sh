#!/bin/bash
#
# maze generator challenge 01/06/2015 10:25p
#
# ┌ ┐ ┤ ├
#
# └ ┘ ┴ ┬ 
#
# ─ │ ┼ 

# Maze's max size: (default: 20x10)
mapx=19
mapy=9
declare -a maze
RANDOM=0 # static seed for testing

# determine number of possible starting points 2 * x-axis plus 2 * y-axis
edgeCount=$((2*$mapx+2*$mapy))
startPos=$((${RANDOM}%${edgeCount}))

function draw_maze {
 for y in $(seq 0 ${mapy}); do
  for x in $(seq 0 ${mapx}); do
#   if [[ $((x + y)) -eq $startPos ]] then # detect startPos and mark
#    echo -n "★"
#    continue
#   fi
   echo -n "${maze[$x+$y]:-0}"
#   echo -n "0"
  done
  echo
 done
}

draw_maze

