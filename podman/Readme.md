# why binary saved ?

As my hp and dell shares same os, and dell is extremely slow to build. we will place some hooks, whenever this package build, we replace this.

# Why using pods instead of podman-desktop

as podman-desktop based on electron, and we will be not running a full chromium wrapper for a small things we will end up using 400+MiB ram instead
we are using pods which is rust based. and really leaves small footprint

### sway starts

instead of starting sway like

        #exec env -u SWAYSOCK dbus-run-session sway

simply start

        exec sway

and from sway config

# Force DBus & systemd to adopt Wayland session environment variables
exec systemctl --user import-environment XDG_RUNTIME_DIR DBUS_SESSION_BUS_ADDRESS WAYLAND_DISPLAY
exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_RUNTIME_DIR DBUS_SESSION_BUS_ADDRESS



┌─[shilpa@Arch-Linux]─[podman]
└──╼ $ cat /etc/subuid | grep $(whoami)
shilpa:100000:65536
shilpa2:231072:65536
┌─[shilpa@Arch-Linux]─[podman]
└──╼ $ cat /etc/subgid | grep $(whoami)
shilpa:100000:65536
shilpa2:231072:65536
┌─[shilpa@Arch-Linux]─[podman]
└──╼ $

and then 

loginctl enable-linger $USER

$ loginctl show-user $USER --property=Linger
Linger=yes

$ ls /var/lib/systemd/linger/
sourav

start podman

systemctl start --user podman.sock

check running a hellow world

podman run --rm docker.io/library/hello-world




