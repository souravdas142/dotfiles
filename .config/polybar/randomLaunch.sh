#!/bin/bash


## Here we randomize polybar to lauch which style and theme


dir="$HOME/.config/polybar"
#themes=( blocks cuts default forest material shapes colorblocks grayblocks docky panels shades )
themes=( cuts default material shapes colorblocks hack docky panels shades )
len=9

#killall -q polybar
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

select="${themes[$(( $RANDOM % $len ))]}"
echo "selecting : $select"
#polybar -q main -c "$dir/$select/config.ini" &
# we handover to launch script of each theme

$dir/$select/launch.sh

