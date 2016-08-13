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
echo $edgeCount
# Randomize Start position limited by edgeCount
startPos=$((${RANDOM}%${edgeCount}))
##Determine edges and set start/finish point
#for y in $(seq 0 ${mapy}); do
# for x in $(seq 0 ${mapx}); do
#  #basically check to see if we're at either edge..
#  [[ $x -eq 0 || $x -eq $mapx || $y -eq 0 || $y -eq $mapy ]] && echo HIT # ${maze[$mapx+(($mapy+100))}
#  
# done
#done

function design_maze {
 for y in $(seq 0 ${mapy}); do
  for x in $(seq 0 ${mapx}); do
   #[[ $x -eq 0 || $x -eq $mapx || $y -eq 0 || $y -eq $mapy ]] && maze[${x}+$((${y}+100))]='X' && continue
   if [[ $x -eq 0 || $x -eq $mapx || $y -eq 0 || $y -eq $mapy ]]
    then maze[${x}+$((${y}+100))]=1 
    edgeCounter=$((edgeCounter+1))
    echo "edgeCounter: $edgeCounter  startPos:$startPos"
    [[ $edgeCounter -eq $startPos ]] && maze[${x}+$((${y}+100))]='s' && echo MATCH
    continue
   fi
  # echo -n "${maze[$x+$y]:-0}" # echo 0 if null
  done
  #echo
 done
}


function draw_maze {
 for y in $(seq 0 ${mapy}); do
  for x in $(seq 0 ${mapx}); do
   echo -n "${maze[$x+$(($y+100))]:-0}" # echo 0 if null
  done
  echo
 done
}

design_maze
draw_maze

echo $edgeCounter
