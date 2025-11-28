#!/usr/bin/env bash

# Unified LED Control + JSON Status for Waybar
# TP-Link Archer T2U (RTL8811AU/8821AU)
# Sourav Das version (optimized)

VID="2357"
PID="011e"
IPC_SIGNAL=9  # Waybar listens on SIGRTMIN+9

find_led_path() {
    for led in /sys/class/leds/*; do
        udev_info=$(udevadm info -a "$led" 2>/dev/null)
        case "$udev_info" in
            *"ATTRS{idVendor}==\"$VID\""* )
                case "$udev_info" in
                    *"ATTRS{idProduct}==\"$PID\""* )
                        echo "$led"
                        return
                        ;;
                esac
                ;;
        esac
    done
}

notify_waybar() {
    pkill -RTMIN+$IPC_SIGNAL waybar
}

LED_PATH=$(find_led_path)
ICON_ON="󰛨"
ICON_OFF="󱐋"
ICON_MISSING=""

# If LED not present
if [ -z "$LED_PATH" ]; then
    if [ "$1" = "--status" ]; then
        echo "{\"text\":\"$ICON_MISSING\",\"tooltip\":\"Device not found\"}"
        exit 0
    fi
    echo "Device not found" >&2
    exit 1
fi

TRIGGER="$LED_PATH/trigger"
CURRENT=$(grep -o '\[[^]]*\]' "$TRIGGER" | tr -d '[]')

do_on() {
    echo phy0tpt | sudo tee "$TRIGGER" >/dev/null
    notify_waybar
}

do_off() {
    echo none | sudo tee "$TRIGGER" >/dev/null
    notify_waybar
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
        echo "{\"text\":\"<span color='#ff5555'>󱐋</span>\",\"tooltip\":\"T2U LED: OFF\"}"
    else
        echo "{\"text\":\"<span color='#50fa7b'>󰛨</span>\",\"tooltip\":\"T2U LED: ON\"}"
    fi

}

case "$1" in
    --on)     do_on ;;
    --off)    do_off ;;
    --toggle|"")  do_toggle ;;
    --status) do_status ;;
    *)
        echo "Unknown option: $1"
        exit 1
        ;;
esac

