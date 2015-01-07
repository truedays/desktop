#!/bin/bash
#
# maze generator challenge 01/06/2015 10:25p
#
# ┌ ┐ ┤ ├
#
# └ ┘ ┴ ┬ 
#
# ─ │ ┼ 

# Maze's max size: (default: 10x10)
mapx=9 
mapy=9
declare -a maze


function draw_maze {
 for x in {0..${mapx}} do
  for y in {0..${mapy}} do
   echo -n "0"
  done
  echo
 done
