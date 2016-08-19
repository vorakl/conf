# i3 window manager

### Details

I removed all useless or over complicated layers and made it as simple as possible.
That's why I trough away a login manager like GDM/LightDM/etc and run X session
automatically after logging in on the first terminal (tty1) in from '~/.bash_profile'
by simply starting 'startx'. After that, startx follows ~/.Xclients and does next:

* sets default terminal emulator and editor for i3
* launches i3 under ssh-agent

The configuration for a keyboard layout (two langs, leds, etc) and touchpad is set 
directly in X.Org by adding files to /etc/X11/xorg.conf.d/

Eventually, i3 runs:

* network manager applet
* redshift for changing colors' temperature accordingly to a day time
* composite manager for tranparency, etc
* sets wallpapper for i3 and configure several monitors

Essential configuration tools are available via hotkeys (Win + Shift + S) for:

* Volume Control (pavucontrol)
* Network Connection (nm-connection-editor)
* Appearance (lxappearance)

Setting up monitor layouts is done using automaticaly by the custom shell 
script ~/bin/set-monitors.sh (don't forget SUID bit on it!) and an udev rule. 
Just in case, it's also available for a manual use via a hotkey (Win + Shift + M)
Fixing paths in 99-monitor-hotplug.rules is required!

### Required tools

* redshift
* xcompmgr
* xsel
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
* /etc/X11/xorg.conf.d/00-keyboard.conf
* /etc/X11/xorg.conf.d/70-synaptics.conf
* /etc/udev/rules.d/99-monitor-hotplug.rules
