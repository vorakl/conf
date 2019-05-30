# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

[ "$(tty)" = "/dev/tty1" ] && { startx; pgrep redshift &>/dev/null && pkill -9 redshift; exit; }
