#!/bin/bash

if [[ $(playerctl -p spotify status 2>/dev/null) == "Playing" ]]; then
    status='▷  '
else
    status='  '
fi

song_info=$(playerctl -p spotify metadata --format "$status {{title}}      {{artist}}" 2> /dev/null)

echo "$song_info"
#echo "$status"
