# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export EDITOR=vim
export PS1='[$(ec=$?; if [[ $EUID -eq 0 ]]; then echo -e "\[\e[0;31m\]"; else echo -e "\[\e[0;32m\]"; fi; exit $ec)\u\[\e[m\]@\[\e[1;33m
\]\H\[\e[m\] \[\e[1;34m\]\w\[\e[m\] $(ec=$?; if [[ $ec -eq 0 ]]; then echo "\[\e[0;32m\]$ec\[\e[m\]"; else echo -e "\[\e[0;31m\]$ec\[\e[
m\]"; fi)]\[\e[m\$\] '

alias v='vim'
alias l='less'
alias ll='ls -Al'

# Colors
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
#
# Reset
C_Off='\e[0m'       # Text Reset

# Normal
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# Intensive
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold Intensive
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# Background Bold Intensive
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

# Turn off "XON/XOFF flow control" (Ctrl+S/Ctrl+Q)
stty -ixon
