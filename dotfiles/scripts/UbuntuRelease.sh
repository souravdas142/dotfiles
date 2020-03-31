#!/bin/bash

while :
do
	count=`curl -s "$1" | grep -ic "$2"`
	echo "count = $count"
	if [ "$count" != "0" ]
	then
		echo "After matched count = $count"
		echo "Ubuntu 18.04 LTS Launched ..!!" 
		termux-toast -s "Ubuntu 18.04 LTS Launched ..!!"
		termux-notification -c "Ubuntu 18.04 LTS Launched ..!!" -i 5006 -t "Ubuntu 18.04"
		while :
		do
			termux-vibrate -d 4000 -f
			termux-tts-speak -e termux-tts-engines -p 2 -s ALARM "ALERT...!! UBUNTU 18.04 RELEASED...!!"
			sleep 2
		done
		exit 0   
	fi
	sleep 120   
done
