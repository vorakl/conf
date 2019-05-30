mkdircd()
{
    [ -n "$1" ] && { mkdir -p $1; cd $1; }
}

myip()
{   
   curl -sSL http://api.wipmania.com/$1 | sed 's/<br>/\t/'
   echo
}

tmuxatt()
{
    session=${1:-v0}

    tmux new -d -s ${session}
    tmux att -d -t ${session}
}
