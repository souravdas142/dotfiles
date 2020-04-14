#!/bin/bash

url="https://ubuntu.com/download/desktop"
ver="19.10"
dwnUrl="https://ubuntu.osuosl.org/releases/$ver/ubuntu-$ver-desktop-amd64.iso"

termux-notification-remove 2004

while :
do

	count=`curl -s $url | grep -ic $ver`
	echo "count = $count"

	if [ "$count" != "0" ]; then

		echo "After matched count = $count"
		echo "Ubuntu $ver LTS Launched ..!!" 


		termux-notification -i 2004 \
			-c "Ubuntu $ver LTS Launched ..!!" \
		  	-t "Ubuntu $ver" \
			--led-color ffffff \
			--button1 "Download" \
			--button1-action "termux-download $dwnUrl" \
			--on-delete "termux-clipboard-set $dwnUrl" \
			--action "termux-download $dwnUrl" \
			--ongoing \
			--priority "high" 

			termux-volume alarm 100

			termux-clipboard-set "$dwnUrl"

			termux-toast "Download Url Copied to Clipboard"

			sleep 1 

		while :
		do
			
			termux-toast -b "green" \
			   	-g "middle" \
				"Ubuntu $ver LTS Launched ..!!" 

			termux-vibrate -d 4000 -f


			termux-tts-speak -p 2 -s ALARM \
							 "ALERT...!! UBUNTU $ver RELEASED...!!" 

			sleep 2

		done

		exit 0   
	fi

	sleep 120   

done
