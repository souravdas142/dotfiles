#!/bin/bash


if acpi -a | grep -i "off" >> /dev/null ; then
#if [[ $? ]];then # discharging
	rate=$( acpi -b | cut -d, -f 2 | cut -d% -f 1 )
	if [[ $rate -le 20 && $rate -ge 15 ]]; then
		notify-send -u critical "Battery Low" "$(echo -e "Please Charge your Laptop\nCharge : $rate")"
	elif [[ $rate -lt 15 && $rate -gt 7 ]]; then
		notify-send -u critical "Battery Critically Low" "$(echo -e "Will be hibernate.\nCharge : $rate")"
	elif [[ $rate -le 7 ]]; then
		notify-send -u critical "Battery Critically Low" "$(echo -e "Hibernating...\nCharge : $rate")"
		sleep 10
		systemctl hibernate
	fi

else
	rate=$( acpi -b | cut -d, -f 2 | cut -d% -f 1 )
	if [[ $rate -gt 98 ]]; then
		notify-send -u normal "Charge Completed" "$(echo -e "Please Unplug your Charger\nCharge : $rate")"
	fi
fi

	

