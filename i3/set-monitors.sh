#!/bin/bash

# Activates all connected monitors
for m in $(xrandr | sed -n '/ connected/s/^\(.*\) conn.*$/\1/p')
do
    xrandr --auto --output $m --auto
    sleep 1
done

