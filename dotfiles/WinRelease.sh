#! /bin/bash

url=$1
if [[ $url == "" ]]
then

url="https://www.microsoft.com/en-in/software-download/windows10ISO"
fi
curl -s $url | sed -n /'select\ id'/p > temp
while [ 1 ];
do
	curl -s $url | sed -n /'select\ id'/p > tmp
	diff -q tmp temp | grep -i "differ"

	if [[ $? -eq 0 ]]
	then

		echo "Windows 10 Redstone 4 Launched ...!!" 
		termux-toast -s "Windows 10 Redstone 4 Launched ...!!"
		termux-notification -c "Windows 10 Redstone 4 Launched ...!!" -i 5006 -t "Windows 10"
		while [ 1 ];
		do

			termux-vibrate -d 4000 -f
			termux-tts-speak -e termux-tts-engines -p 2 -s ALARM "ALERT...!! Windows 10 Redstone 4 RELEASED...!!"
			sleep 2

		done
	fi

	sleep 120
done
