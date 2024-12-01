#!/bin/bash

song_info=$(playerctl metadata --format '{{title}}      {{artist}}' 2> /dev/null)

echo "$song_info" 
