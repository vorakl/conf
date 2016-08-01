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
export GOPATH=$HOME/dev/go
export EDITOR=vim

alias v='vim'
alias l='less'
alias ll='ls -Al'
