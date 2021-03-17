#!/bin/bash


## Here we randomize polybar to lauch which style and theme


dir="$HOME/.config/polybar"
themes=( blocks cuts default forest material shapes colorblocks grayblocks docky panels shades )
len=10


killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done



   select="${themes[$(( $RANDOM % $len ))]}"
	   echo "selecting : $select"
		polybar -q main -c "$dir/$select/config.ini" &

