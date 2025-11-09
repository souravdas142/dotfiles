#!/bin/bash

display=$1
wallpaper=$2

echo "Display is : $display"
echo "Wallpaper path is: $wallpaper"

echo -e "wallpaper=$wallpaper\ndisplay=$display" > /tmp/wallpaper

# Update Pywal
#echo ":: Applying pywal with $wallpaper"
#wal -q -i "$wallpaper"
#source "$HOME/.cache/wal/colors.sh"
