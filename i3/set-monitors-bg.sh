#!/bin/bash

xrandr_opt="--auto"
ext_monitor="no"

# Activate all plugged or leptop's internal monitors
for m in $(xrandr | sed -n '/ connected/s/^\(.*\) conn.*$/\1/p')
do
    [[ $m != "eDP1" ]] && ext_monitor="yes"
    xrandr_opt="${xrandr_opt} --output ${m} --auto"
done

[[ "${ext_monitor}" = "yes" ]] && xrandr_opt="${xrandr_opt} --output eDP1 --off"

eval xrandr "${xrandr_opt}"
feh  --no-fehbg --bg-fill '/home/vorakl/Pictures/bg.jpg'
