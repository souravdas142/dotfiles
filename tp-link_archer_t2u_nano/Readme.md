Perfectly Compatible under Linux 6.14+ (I am using Archlinux 6.17.9 as of Today and is plug & Play below are the details). Arch Linux, Ubuntu, Kali, fedora

I got Version 3, (V1.8 printed on the box, so might hardware change in other version)

with lshw its showing TP-Link AC600 wireless Realtek RTL8811AU [Archer T2U Nano]. And in kernel driver is present
 for more info see the rtw88 backport repo: https://github.com/lwfinger/rtw88 

`hwinfo` shows using in kernel driver Driver: "rtw_8821au" 
chip-ID: 2357:011e

If led is irritating you disable the led with udev rules to particular led node:

File: /etc/udev/rules.d/99-t2u-led-off.rules
ACTION=="add", SUBSYSTEM=="leds", \
  ATTRS{idVendor}=="2357", ATTRS{idProduct}=="011e", \
  RUN+="/bin/sh -c 'echo none > /sys/class/leds/%k/trigger'"

Build quality : 9.5/10
Signal Quality: 9/10
Speed: Getting 100%
Range: Decent (Good Penetration through wall)
Linux Compatibility: 100% with Linux 6.14+
There is no heat issue, inspite of continuous streaming or downloading.


