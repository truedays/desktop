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


function draw_maze {
 for y in $(seq 0 ${mapy}); do
  for x in $(seq 0 ${mapx}); do
   echo -n "0"
  done
  echo
 done
}

draw_maze

