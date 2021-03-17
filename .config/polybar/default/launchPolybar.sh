#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1-$EUID.log /tmp/polybar2-$EUID.log
polybar example -c $HOME/.config/polybar/default/config >>/tmp/polybar1-$EUID.log 2>&1 &

echo "Bars launched..."
