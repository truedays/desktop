#!/bin/bash
# URL Encoder
# Ray 12/12/2013
#

# Enocde as much of the string as possible
#
# ToDo: Add another mode to be gentle with ?field1=foo&field2=bar

case $1 in
	-h*|--h*) 
	cat <<-EOM
	
	:: Info ::

	$0 will encode a simple message and possibly make a working obfuscated URL.
	V.01 12/12/2013 GPLv3
	URL: https://github.com/truedays/desktop/
	
	Example:
	https://github.com/truedays
	can become
	https://%67%69%74%68%75%62%2E%63%6F%6D/%74%72%75%65%64%61%79%73
	

	:: Help ::

	-v --verbose = Show user-friendly output
	-h --help    = This help screen
	-m --min     = Minimum conversion. Good for URL sanitation

	EOM
	exit 0
	;;

	-v*|--v*)
	string=$2 # verbose mode only take one argument
	lenofstring=${#string}
	;;

	-m*|--m*)
	string=$2
	lenofstring=${#string}
	minimum=1
	;;

	*)
	verbose=1
	# combine all user args to one string
	string=$*
	# length of string
	lenofstring=${#string}
	;;
esac


#for each in `seq 0 $lenofstring`
# do 
# echo ${string:$each:1}
#done

if [[ $minimum -eq 1 ]]; then
declare -A c=( 
[" "]="%20"
["!"]="%21"
["#"]="#"
["$"]="$"
["%"]="%"
["&"]="&"
["'"]="%27"
["("]="%28"
[")"]="%29"
["+"]="+"
[","]="%2C"
["-"]="-"
["."]="."
["/"]="/"
["0"]="0"
["1"]="1"
["2"]="2"
["3"]="3"
["4"]="4"
["5"]="5"
["6"]="6"
["7"]="7"
["8"]="8"
["9"]="9"
[":"]=":"
[";"]="%3B"
["<"]="%3C"
["="]="="
[">"]="%3E"
["?"]="?"
["["]="%5B"
['\\']="%5C"
['\]']="%5D"
["^"]="%5E"
["_"]="_"
["a"]="a"
["A"]="A"
["b"]="b"
["B"]="B"
["c"]="c"
["C"]="C"
["d"]="d"
["D"]="D"
["e"]="e"
["E"]="E"
["f"]="f"
["F"]="F"
["g"]="g"
["G"]="G"
["h"]="h"
["H"]="H"
["i"]="i"
["I"]="I"
["j"]="j"
["J"]="J"
["k"]="k"
["K"]="K"
["l"]="l"
["L"]="L"
["m"]="m"
["M"]="M"
["n"]="n"
["N"]="N"
["o"]="o"
["O"]="O"
["p"]="p"
["P"]="P"
["q"]="q"
["Q"]="Q"
["r"]="r"
["R"]="R"
["s"]="s"
["S"]="S"
["t"]="t"
["T"]="T"
["u"]="u"
["U"]="U"
["v"]="v"
["V"]="V"
["w"]="w"
["W"]="W"
["x"]="x"
["X"]="X"
["y"]="y"
["Y"]="Y"
["z"]="z"
["Z"]="Z"
["{"]="%7B"
["|"]="%7C"
["}"]="%7D"
["~"]="%7E"
)

else
declare -A c=(
[" "]="%20"
["!"]="%21"
["#"]="#"
["$"]="$"
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
fi 

#for each in `seq 0 $(($lenofstring-1))`
# do 
# echo ${string:$each:1} :: ${c["${string:$each:1}"]}
#done

# Print encoded text
for each in `seq 0 $(($lenofstring-1))`
 do 
 echo -en ${c["${string:$each:1}"]}
done
echo
[ $verbose ] && exit 0  # End here if not in -verbose mode

# Print expanded plain text (and try to line it up with urlencoding)
for each in `seq 0 $(($lenofstring-1))`
 do 
 echo -en "·${string:$each:1}·"
done
echo
echo 
# Show original string with char count
echo $string
for n in `seq $lenofstring`; do echo -n "^"; done;
[ $lenofstring -le 58 ] && echo -n " <--" || echo -en "\n^-"
echo -n "length of string is ${#string}"
echo

