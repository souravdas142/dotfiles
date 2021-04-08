#!/bin/bash


for i in `ls`;
do
	name=$i
	cp $name dunstrc
	killall -q dunst
	while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done
	echo "launching $name..."
	dunstify -u low -t 10000 "Low Text"
	dunstify -u normal -t 10000 "Normal Text"
	dunstify -u critical -t 10000 "Critical Text"
	echo "Launching End"

	sleep 10;
done

