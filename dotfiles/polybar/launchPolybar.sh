#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "--- $(date)" | tee -a /tmp/polybar1$USER.log /tmp/polybar2$USER.log
polybar example >>/tmp/polybar1$USER.log 2>&1 &

echo "Bars launched..."
