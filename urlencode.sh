#!/bin/bash
# URL Encoder
# Ray 12/12/2013
#

# Enocde as much of the string as possible

# combine all user args to one string
string=$*
# length of string
lenofstring=${#string}
#echo lenofstring: $lenofstring

echo $string
echo lenth of string is ${#string}
echo

for each in `seq 0 $lenofstring`
 do 
 echo ${string:$each:1}
done

declare -A c=( 
[" "]="%20"
["!"]="%21"
["#"]="#"
["$"]="%24"
["%"]="%25"
["&"]="%26"
["'"]="%27"
["("]="%28"
[")"]="%29"
["+"]="+"
[","]="%2C"
["-"]="%2D"
["."]="%2E"
["/"]="/"
["0"]="%30"
["1"]="%31"
["2"]="%32"
["3"]="%33"
["4"]="%34"
["5"]="%35"
["6"]="%36"
["7"]="%37"
["8"]="%38"
["9"]="%39"
[":"]="%3A"
[";"]="%3B"
["<"]="%3C"
["="]="="
[">"]="%3E"
["?"]="?"
["A"]="%41"
["B"]="%42"
["C"]="%43"
["D"]="%44"
["E"]="%45"
["F"]="%46"
["G"]="%47"
["H"]="%48"
["I"]="%49"
["J"]="%4A"
["K"]="%4B"
["L"]="%4C"
["M"]="%4D"
["N"]="%4E"
["O"]="%4F"
["P"]="%50"
["Q"]="%51"
["R"]="%52"
["S"]="%53"
["T"]="%54"
["U"]="%55"
["V"]="%56"
["W"]="%57"
["X"]="%58"
["Y"]="%59"
["Z"]="%5A"
["["]="%5B"
['\\']="%5C"
['\]']="%5D"
["^"]="%5E"
["_"]="%5F"
["a"]="%61"
["b"]="%62"
["c"]="%63"
["d"]="%64"
["e"]="%65"
["f"]="%66"
["g"]="%67"
["h"]="%68"
["i"]="%69"
["j"]="%6A"
["k"]="%6B"
["l"]="%6C"
["m"]="%6D"
["n"]="%6E"
["o"]="%6F"
["p"]="%70"
["q"]="%71"
["r"]="%72"
["s"]="%73"
["t"]="%74"
["u"]="%75"
["v"]="%76"
["w"]="%77"
["x"]="%78"
["y"]="%79"
["z"]="%7A"
["{"]="%7B"
["|"]="%7C"
["}"]="%7D"
["~"]="%7E"
)

for each in `seq 0 $(($lenofstring-1))`
 do 
 echo ${string:$each:1} :: ${c["${string:$each:1}"]}
done

# Print encoded text
for each in `seq 0 $(($lenofstring-1))`
 do 
 echo -en ${c["${string:$each:1}"]}
done

echo

# Print plain text (and try to line it up with urlencoding)
for each in `seq 0 $(($lenofstring-1))`
 do 
 echo -en "·${string:$each:1}·"
done

