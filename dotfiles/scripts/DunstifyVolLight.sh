#!/bin/bash

#################################################################
#																#
#			Maintainer : Sourav Das								#
#			GitRepo : github.com/souravdas142					#
#																#	
#					Dunstify:									#
#							brightnessNotification				#
#							volumeNotification					#	
#							maybe some other on					#	
#							another day :)						#
#																#
##################################################################

flag=1
Msg=
case $1 in
	brightnessInc)
		percent=$(xbacklight -get | roundoff )
		setIcon="/usr/share/icons/Qogir/symbolic/status/display-brightness-high-symbolic.svg" 
		notiId=9999
		appName="changeBrightness-Up" 
		flag=0
		Msg="Brightness"
		;;
	brightnessDec)
		percent=$(xbacklight -get | roundoff )
		setIcon="/usr/share/icons/Qogir/symbolic/status/display-brightness-high-symbolic.svg" 
		notiId=9999
		appName="changeBrightnessDwn"
		flag=0
		Msg="Brightness"
		;;
	volUp)
		percent=$( amixer get Master | tail -1 | awk -F'[[,%]' '{print $2}' )
		setIcon=audio-volume-high
		notiId=9998
		appName="ChangevolUp"
		flag=0
		Msg="Volume"
		;;
	volDwn)
		percent=$( amixer get Master | tail -1 | awk -F'[[,%]' '{print $2}' )
		setIcon=audio-volume-low
		notiId=9998
		appName="ChangevolDwn"
		flag=0
		Msg="Volume"
		;;
	volM)
		;;
	*)
		;;
esac

if [[ $flag == 0 ]]; then
	dunstify -a $appName -u normal -i $setIcon -r $notiId "$Msg : $percent" "$(getProgressString.sh 10 "<b> </b>" " " $percent )"
	flag=1
fi







