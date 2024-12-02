#!/bin/bash


#################################################################
#																#
#			Maintainer : Sourav Das								#
#			GitRepo : github.com/souravdas142					#
#																#
#					Dunstify:									#
#							ChargeNotify						#
#							TimeRemaining						#
#																#
#																#
#																#
#################################################################

#echo -e "$(acpi -s | cut -d, -f3 | cut -d' ' -f 2 | awk -F: '{print "R: " $1"h:"$2"m"}')"

rate=
urgency=
Msg=
setIcon=
flag=1
ntfy_bat="ntfy_bat"
if acpi -a | grep -i "off" >> /dev/null ; then
#if [[ $? ]];then # discharging
	rate=$( acpi -b | cut -d, -f 2 | cut -d% -f 1 )
	if [[ $rate -le 20 && $rate -ge 15 ]]; then
		urgency="critical"
		setIcon="battery-medium"
		timeOutMiliSec=31000
		Msg="Battery Low $(echo -e "\n  Please Charge your Laptop\n")"
		flag=0
	elif [[ $rate -lt 15 && $rate -gt 7 ]]; then
		urgency="critical"
		setIcon="battery-low"
		timeOutMiliSec=31000
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
		timeOutMiliSec=31000
		flag=0
	fi

else
	rate=$( acpi -b | cut -d, -f 2 | cut -d% -f 1 )
	if [[ $rate -gt 98 ]]; then
		urgency="normal"
		setIcon="battery-full-charging"
		timeOutMiliSec=31000
		flag=0
		fullChargingCounter=$(\cat /tmp/fullChargingCounter 2> /dev/null)
		fullChargingCounter=`expr $fullChargingCounter + 1`
		if [[ $fullChargingCounter -ge 60 ]]; then
			echo 0 > /tmp/fullChargingCounter
		else
			#date >> /tmp/fullChargingCounterTime
			echo $fullChargingCounter > /tmp/fullChargingCounter
		fi
		if [[ $fullChargingCounter -ge 3 ]]; then
			flag=1
		fi
		Msg="Charge Completed $(echo -e "\n  Please Unplug your Charger\n")"
	fi

fi

if [[ $flag == 0 ]]; then

	percent=$rate
	appName="ShowCharge"
	notiId=9997
	#urgency="critical"
	#timeOutMiliSec=31000 #Default

	notify-send -h string:private-synchronous:$ntfy_bat -a $appName -u $urgency -t $timeOutMiliSec -i $setIcon -r $notiId  " Battery : $percent"  "  <b><i>$Msg</i></b>\n  $(getProgressString 10 "<b> </b>" " " $percent )"
	flag=1

fi

#echo "{\"text\": \"\"}"
