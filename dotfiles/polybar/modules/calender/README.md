hows the current date and time. When clicked, a calendar popup is created.

This is similar to the rofi-calendar blocklet, but without the rofi dependency and with a slightly more advanced popup (at least in my opinion).

![](screenshot1.png)

![](screenshot2.png)

# Dependencies

* yad
* xdotool (for positioning of the popup)
* lxappearance (change theme)


* Add `for_window [class="Yad"] floating enable` to your i3 config file.


##polybar
```
[date]
label = %{A1:/home/$USER/.config/polybar/modules/calender/calender:}%date% %time%%{A}
```
