#!/bin/bash

echo -e "$(acpi -s | cut -d, -f3 | cut -d' ' -f 2 | awk -F: '{print "R: " $1"h:"$2"m"}')"	

rate=
urgency=
Msg=
setIcon=
flag=1
if acpi -a | grep -i "off" >> /dev/null ; then
#if [[ $? ]];then # discharging
	rate=$( acpi -b | cut -d, -f 2 | cut -d% -f 1 )
	if [[ $rate -le 20 && $rate -ge 15 ]]; then
		urgency="critical"
		setIcon="battery-medium"
		Msg="Battery Low $(echo -e "\n  Please Charge your Laptop\n")"
		flag=0
	elif [[ $rate -lt 15 && $rate -gt 7 ]]; then
		urgency="critical"
		setIcon="battery-low"
		Msg="Battery Critically Low $(echo -e "\n  Will be hibernate.\n")"
		flag=0
	elif [[ $rate -le 7 ]]; then
		if [[ $rate -lt 7 ]]; then
			sleep 10
			systemctl hibernate
		fi
		Msg="Battery Critically Low $(echo -e "\n  Hibernating...\n")"
		urgency="critical"
		setIcon="battery-empty"
		flag=0
	fi

else
	rate=$( acpi -b | cut -d, -f 2 | cut -d% -f 1 )
	if [[ $rate -gt 98 ]]; then
		urgency="normal"
		setIcon="battery-full-charging"
		Msg="Charge Completed $(echo -e "\n  Please Unplug your Charger\n")"
		flag=0
	fi
fi

if [[ $flag == 0 ]]; then

	percent=$rate
	appName="ShowCharge"
	notiId=9997
	#urgency="critical"
	timeOutMiliSec=31000
	
	dunstify -a $appName -u $urgency -t $timeOutMiliSec -i $setIcon -r $notiId  " Battery : $percent"  "  <b><i>$Msg</i></b>\n  $(getProgressString.sh 10 "<b> </b>" " " $percent )"
	flag=1
	
fi
