#!/bin/bash

cliphist list | rofi -show-icons false -dmenu -display-columns 2 -p "Search Clipboard" -theme ./cliphist-rofi2.rasi | cliphist decode | wl-copy
