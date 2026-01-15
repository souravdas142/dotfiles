#!/bin/bash

cliphist list | rofi -show-icons false -dmenu -display-columns 2 -p "Search Clipboard" -theme ~/.config/cliphist/cliphist-rofi.rasi | cliphist decode | wl-copy

