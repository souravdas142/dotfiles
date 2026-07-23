#!/usr/bin/env bash

##############################################
# T2U LED Unified Script (toggle + status)
# Runs udevadm ONCE on first load, then uses cache
##############################################

VID="2357"
PID="011e"
IPC_SIGNAL=9
CACHE_FILE="/tmp/t2u_led_path"

appName="T2U LED"
notiId="4201"
ntfy_sync="t2u_led_sync"
icon_on="network-transmit-receive"
icon_off="network-error"

##############################################

find_led_path() {
    # 1. If cache file exists, use it immediately (NO udevadm)
    if [ -f "$CACHE_FILE" ]; then
        /usr/bin/cat "$CACHE_FILE"
        return
    fi

    # 2. Cache missing: Run udevadm ONCE to discover path
    local found_path=""
    for led in /sys/class/leds/*; do
        udev_info=$(udevadm info -a "$led" 2>/dev/null)
        [[ "$udev_info" == *"ATTRS{idVendor}==\"$VID\""* ]] &&
        [[ "$udev_info" == *"ATTRS{idProduct}==\"$PID\""* ]] && {
            found_path="$led"
            break
        }
    done

    # 3. Save discovered path (or hardcoded fallback) to cache
    if [ -n "$found_path" ]; then
        echo "$found_path" > "$CACHE_FILE"
        echo "$found_path"
    else
        # Fallback path if auto-discovery fails
        local fallback_path="/sys/class/leds/rtw88-1-3:1.0"
        echo "$fallback_path" > "$CACHE_FILE"
        echo "$fallback_path"
    fi
}

refresh_waybar() {
    pkill -RTMIN+$IPC_SIGNAL waybar
}

notify_led() {
    local state="$1"
    local msg icon

    if [ "$state" = "on" ]; then
        msg="LED is now ON"
        icon="$icon_on"
    else
        msg="LED is now OFF"
        icon="$icon_off"
    fi

    notify-send \
      -h string:private-synchronous:$ntfy_sync \
      -a "$appName" \
      -u normal \
      -i "$icon" \
      -r "$notiId" \
      "$appName" \
      "$msg"
}

##############################################

LED_PATH=$(find_led_path)

# Ensure the path saved in cache actually exists on sysfs
if [ ! -d "$LED_PATH" ]; then
    if [ "$1" = "--status" ]; then
        echo '{"text":"","class":"missing","tooltip":"Device not found"}'
        exit 0
    fi
    exit 1
fi

TRIGGER="$LED_PATH/trigger"
CURRENT=$(grep -o '\[[^]]*\]' "$TRIGGER" 2>/dev/null | tr -d '[]')

do_on() {
    echo phy0tpt | sudo tee "$TRIGGER" >/dev/null
    notify_led "on"
    refresh_waybar
}

do_off() {
    echo none | sudo tee "$TRIGGER" >/dev/null
    notify_led "off"
    refresh_waybar
}

do_toggle() {
    if [ "$CURRENT" = "none" ]; then
        do_on
    else
        do_off
    fi
}

do_status() {
    if [ "$CURRENT" = "none" ]; then
        echo '{"text":"","class":"off","tooltip":"T2U LED: OFF"}'
    else
        echo '{"text":"󰛨","class":"on","tooltip":"T2U LED: ON"}'
    fi
}

##############################################

case "$1" in
    --on)     do_on ;;
    --off)    do_off ;;
    --toggle|"") do_toggle ;;
    --status) do_status ;;
    *)
        echo "Unknown option: $1"
        exit 1
        ;;
esac
