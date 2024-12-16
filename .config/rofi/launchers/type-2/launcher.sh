#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
## Available Styles
#
## style-1     style-2     style-3     style-4     style-5
## style-6     style-7     style-8     style-9     style-10
## style-11    style-12    style-13    style-14    style-15

dir="$HOME/.config/rofi/launchers/type-2"
theme='style-1'


has_args=$1
themes=( style-{1..15} )
size=${#themes[@]}
theme="${themes[$(( $RANDOM % ${size} ))]}"
if [[ ! -z $has_args ]];then
    theme="style-${has_args}"
fi
echo -e "\e[1;31m[Selecting]\e[0m \e[1;32mlauncher\e[0m \e[1;33mtype-2\e[0m \e[1;34m${theme}\e[0m"


## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
