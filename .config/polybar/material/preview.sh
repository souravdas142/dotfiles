#!/usr/bin/env bash

DIR="$HOME/.config/polybar/material"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the preview bar
polybar -l warning -q top -c "$DIR"/preview.ini 2>&1 >> p1.log &
polybar -l warning -q mid -c "$DIR"/preview.ini 2>&1 >> p2.log &
polybar -l warning -q bottom -c "$DIR"/preview.ini 2>&1 >> p3.log &
