#!/bin/sh

# Configuration:
# Shutdown threshold (percent)
THRESHOLD=10

# POSIX-compliant low battery checker

# Read battery capacity and status (works on most Linux laptops)
for bat in /sys/class/power_supply/BAT*; do
    [ -e "$bat" ] || exit 0
    CAPACITY=$(cat "$bat/capacity" 2>/dev/null)
    STATUS=$(cat "$bat/status" 2>/dev/null)
    break
done

# Ensure values are valid
[ -z "$CAPACITY" ] && exit 0
[ -z "$STATUS" ] && exit 0

# Only if discharging and below threshold
if [ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -le "$THRESHOLD" ]; then
    logger -t "lowbatt-check" "Battery critically low ($CAPACITY%), powering off"
    /usr/local/bin/force-poweroff.sh
fi

exit 0

