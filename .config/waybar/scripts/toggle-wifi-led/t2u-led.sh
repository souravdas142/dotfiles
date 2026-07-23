#!/usr/bin/env bash

##############################################
# T2U LED Unified Script (toggle + status)
# With cached path lookups for 0% CPU impact
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
    # 1. Use cached path if it still exists on disk
    if [ -f "$CACHE_FILE" ]; then
        cached_path=$(cat "$CACHE_FILE")
        if [ -d "$cached_path" ]; then
            echo "$cached_path"
            return
        fi
    fi

    # 2. Fallback to udevadm search if cache is missing or invalid
    for led in /sys/class/leds/*; do
        udev_info=$(udevadm info -a "$led" 2>/dev/null)
        [[ "$udev_info" == *"ATTRS{idVendor}==\"$VID\""* ]] &&
        [[ "$udev_info" == *"ATTRS{idProduct}==\"$PID\""* ]] && {
            echo "$led" | tee "$CACHE_FILE" >/dev/null
            echo "$led"
            return
        }
    done
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

if [ -z "$LED_PATH" ]; then
    rm -f "$CACHE_FILE" 2>/dev/null
    if [ "$1" = "--status" ]; then
        echo '{"text":"","class":"missing","tooltip":"Device not found"}'
        exit 0
    fi
    exit 1
fi

TRIGGER="$LED_PATH/trigger"
CURRENT=$(grep -o '\[[^]]*\]' "$TRIGGER" | tr -d '[]')

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
    if [ -z "$LED_PATH" ]; then
        echo '{"text":"","class":"missing","tooltip":"Device not found"}'
        exit 0
    fi

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
