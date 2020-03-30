#!/bin/bash


WallDir="/home/$USER/.local/share/Wallpapers"
Wall=$1
if [ ! -d $WallDir ]; then
	mkdir -p $WallDir
fi

cp -u --backup=t $Wall $WallDir 
feh --bg-full $WallDir/$Wallz
