#!/bin/bash


#		type-1 type-2 type-3
#		type-4 type-5 type-6
#		type-7
#
#

launchdir="$HOME/.config/rofi/launchers"

has_args=$1
has_child_args=$2

types=( type-{2..8} )
size=${#types[@]}
type_t="${types[$(( $RANDOM % ${size} ))]}"

if [[ ! -z $has_args ]];then
    type_t="type-${has_args}"
fi


echo -e "\e[1;31m[Selecting]\e[0m \e[1;32mlauncher\e[0m \e[1;33m${type_t}\e[0m"

${launchdir}/${type_t}/launcher.sh ${has_child_args}


