# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

HISTSIZE=1000000
HISTTIMEFORMAT='%D %R '
TIMEFORMAT=$'\n\ttime\t%3lR'

# promt from http://www.reddit.com/r/archlinux/comments/1x2gjt/zsh_indicate_that_you_are_using_an_ssh_connection/cf7jp8q 02/05/2014
PS1="$(if [[ ${EUID} == 0 ]]; then
echo '\[\033[01;31m\]\h'; 
elif [[ ! -z "$SSH_CLIENT" ]]; then
echo '\[\033[1;36m\]\u@ssh-\h';
else echo '\[\033[01;32m\]\u@\h';
fi)\[\033[01;36m\] \w \[\033[0;37m\]\$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;36m\] \")\\$\[\033[00m\] "

# git aliases
alias gs="git status"
alias ga="git add"
alias gp="git push"
alias gg="git pull"
# idea from https://github.com/damianb/dotfiles/blob/master/.bashrc
function gitcommit { git commit -m "$(echo "$@")"; }
alias gc=gitcommit

# youtube-dl  TODO: add proxy detection and auto-use
function y { while read url; do echo "$url" >> /tmp/.youtube-dl.log; youtube-dl -q $url & done }

alias u="unset HISTFILE"

alias du="du -h"
alias df="df -h"

function mkdircd() { mkdir $1; cd $1; }
alias mkc=mkdircd

# various ls
#alias ll="ls -lAFhrt"
#alias ll='ls -FlhArt --group-directories-first'
alias ll="ls -blArth --group-directories-first --color=always"
alias la='ls -A'
alias l='ls -CAF'
alias lsd='ls --directory */'

# exclude dupes and spaced commands
HISTCONTROL="${HISTCONTROL}:ignorespace"

alias fs='kill -s STOP `pidof firefox`'
alias fc='kill -s CONT `pidof firefox`'
#alias dig='dig +short '
alias cd..='cd ..'
alias p='ping -c 3'
alias mx='dig -t mx +short'
alias ns='dig -t ns +short'
alias tt='traceroute'
alias open='xdg-open >/dev/null 2>&1'
alias rm='rm -vi '
alias cp='cp -vi '
alias mv='mv -vi '
alias wget='wget -c '
alias godark='echo -n "Going dark in 3"; sleep 1; echo -n "..2"; sleep 1; echo -n "..1"; sleep 1; echo ".."; xset dpms force off'
alias m='mplayer '
alias startproxy='cd ~/github/desktop/; ./startproxy; cd -'
alias sp='cd ~/github/desktop/; ./startproxy; cd -'

# ray binding ctrl-h to my ls command
bind -x '"\C-h":ls -blhArt | tail -n5'

#function whoisns { lynx --dump "http://reports.internic.net/cgi/whois?whois_nic=$1&type=nameserver" | grep -B1 "IP Address" -A1; };
function whoisns { lynx --dump "http://reports.internic.net/cgi/whois?whois_nic=$1&type=nameserver" | grep -B1 "IP Address" -A1 || echo -e "Error: $1 -- Name Server does not appear to be registered\x21"; };
function dig { /usr/bin/dig $@ +noall +answer +ttlid | egrep -v ";|^$"; };

##PROMPT_COMMAND="history -a; history -n"

##df -h | head -2 | awk '{print $1 "\t" $4}' &
##df -h / | tail -n 1 | awk '{print "Disk Usage: "$5" Available: "$4}'


alias rsync='rsync -Phav --append-verify '
#alias u='echo "Session is now incognito.";PS1="(⌐■⁀■) \[\033[01;32m\]\u@\h\[\033[01;36m\] \w \[\033[0;37m\] "; unset HISTFILE'
alias u='echo "Session is now incognito.";PS1="(⌐■-■) \[\033[01;32m\]\u@\h\[\033[01;36m\] \w \[\033[0;37m\] "; unset HISTFILE'
alias catconf='egrep -v "^$|^#|^\s*$" ' # remove comments and blanklines from conf files

# Use google translate speech
say() { mplayer -really-quiet "http://translate.google.com/translate_tts?tl=en&q=$*"; }
alias pyhttp='python -m SimpleHTTPServer '
alias myip='echo "Public: $(dig +short myip.opendns.com @resolver1.opendns.com)"; echo "Internal: $(ip address show | grep inet\ | grep -v 127.0.0.1 | sed "s/.*inet\ //" | sed "s/\/.*//")" '

#show battery status on my x1carbon
alias batt='echo "Battery Status: $(cat /sys/class/power_supply/BAT0/status)   Remaining: $(cat /sys/class/power_supply/BAT0/capacity)"'

alias ..='cd ..'
alias cd..='cd ..'
alias gerp='grep '

shopt -s cdspell
shopt -s autocd
PATH=$PATH:/home/ray/github/desktop/
#PROMPT_COMMAND="/home/ray/github/desktop/battery"
#alias m='mplayer -input file=~/.mplayer.fifo -msglevel all=0:cplayer=5 '


alias jump='ssh -qnL 3389:WindowsHost:3389 jumphost -l $USER "sleep 5" & sleep 2 && rdesktop -d $myDOMAIN -u $myUSER -p $(cat ~/.secret) -g 1920x1060 -x m localhost'

alias dblhoptun='ssh -A -L1234:localhost:1234 ${USER}@sshhostA -t ssh -A -L1234:rdpHost:3389 ${USER}@sshhostB'

# watchrun usage: watchrun /path/to/script   # it will then run upon next modify
watchrun() { oldtime=$(stat -c %Z $1); while :; do sleep 1; [[ $oldtime -eq $(stat -c %Z $1) ]] || { echo -e "\n_________________   $(date)   ________________"; ./$1 ; oldtime=$(stat -c %Z $1); } done }

# random character generator rnd [numchar]
function  rnd { echo "$(strings /dev/urandom | grep -o '[[:alnum:]]' | head -n ${1:-10} | tr -d '\n')"; }
