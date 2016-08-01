#!/bin/sh

xrandr --auto

if xrandr | egrep '^HDMI1 connected' &>/dev/null
then
    xrandr --output HDMI1 --auto --primary --output eDP1 --off
elif xrandr | egrep '^DP2-1 connected' &>/dev/null
then
    xrandr --output DP2-1 --auto --primary --output eDP1 --off
else
    xrandr --output eDP1 --auto --primary
fi
