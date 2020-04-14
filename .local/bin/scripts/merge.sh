#!/bin/bash

url="https://ubuntu.com/download/desktop"
ver="19.10"
dwnUrl="https://ubuntu.osuosl.org/releases/$ver/ubuntu-$ver-desktop-amd64.iso"

id=2004


main(){

case $1 in
	"--desktop")
		desktop
		;;
	"--mobile-phone")
		mobile-phone
		;;
	*)
		;;
esac
return 0
}


mobile-phone(){

	termux-notification-remove $id
	
	while :
	do
	
		count=`curl -s $url | grep -ic $ver`
		echo "count = $count"
	
		if [ "$count" != "0" ]; then
	
			echo "After matched count = $count"
			echo "Ubuntu $ver LTS Launched ..!!" 
	
	
			termux-notification -i $id \
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
	
		fi
	
		sleep 120   
	
	done
	
}





desktop(){

	while :
	do
	
	    count=`curl -s $url | grep -ic $ver`
	    echo "count = $count"
	
	    if [ "$count" != "0" ]; then
	
	        echo "After matched count = $count"
	        echo "Ubuntu $ver LTS Launched ..!!" 
	
			recieve=$(dunstify -a "Ubuntu $ver" \
				-u "critical" \
				-r $id \
				--action="Download,Download" \
				--action="cancel,Cancel" \
				"Ubuntu $ver Launched...!!" \
				"\n<b>Yupii...Ubuntu $ver is Launched..!!</b>\n\n Download")
	
			case $recieve in
				"Download")
					xdg-open $dwnUrl
					;;
				"cancel")
					dunstify -C $id
	
			esac
	
		fi
	done
	
	
}


main $1
