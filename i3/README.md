# i3 window manager

### Details

Start/Stop automatically after login on tty1 from '~/.bash_profile' by running 'startx'.
There is no gdm/lightdm/etc!
After that, startx follows ~/.Xclients and does next:

* sets default terminal and editor for i3
* sets keyboard layout and options (support 2 languages, etc)
* sets wallpapper for i3
* runs composite manager for tranparency, etc
* launches i3 under ssh-agent

Eventually, i3 runs:

* network manager applet
* redshift for changing colors' temperature accordingly to a day time

Essential configuration tools are available via hotkeys (Win + Ctrl + S) for:

* Volume Control (pavucontrol)
* Network Connection (nm-connection-editor)
* Appearance (lxappearance)

Setting up monitor layouts is done using custom shell script ~/bin/set-monitors.sh 
and a hotkey (Win + Shift + M)

### Required tools

* redshift
* xcompmgr
* feh
* setxkbmap
* pavucontrol
* lxappearance
* network manager
* py3status

### Files

* ~/.bash_profile
* ~/.Xclients
* ~/.config/i3/config
* ~/bin/set-monitors.sh
* ~/bin/ya-translate.sh
* ~/.i3status.conf

