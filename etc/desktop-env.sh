
if { env | grep -i "sway" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=sway
elif { env | grep -i "river" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=river
elif { env | grep -i "weston" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=weston
elif { env | grep -i "mir" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=mir
elif { env | grep -i "hikari" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=hikari
elif { env | grep -i "hyprland" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=hyprland
elif { env | grep -i "i3" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=i3
elif { env | grep -i "openbox" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=openbox
elif { env | grep -i "xmonad" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=xmonad
elif { env | grep -i "awesome" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=awesome
elif { env | grep -i "fluxbox" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=fluxbox
elif { env | grep -i "cinnamon" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=cinnamon
elif { env | grep -i "mate" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=mate
elif { env | grep -i "compiz" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=compiz
elif { env | grep -i "enlightenment" >/dev/null 2>&1; }; then
    export XDG_CURRENT_DESKTOP=enlightenment
fi

