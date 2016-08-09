#!/bin/sh

xrandr --auto
xrandr --output eDP1 --off

if xrandr | egrep '^HDMI1 connected' &>/dev/null
then
    xrandr --output HDMI1 --off
    xrandr --output HDMI1 --auto --primary
elif xrandr | egrep '^DP2-1 connected' &>/dev/null
then
    xrandr --output DP2-1 --off
    xrandr --output DP2-1 --auto --primary
elif xrandr | egrep '^DP2-2 connected' &>/dev/null
then
    xrandr --output DP2-2 --off
    xrandr --output DP2-2 --auto --primary
else
    xrandr --output eDP1 --auto --primary
fi
