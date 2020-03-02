
## This Script Automatically set the InterfaceName for netload plugin for Xfce4 panel

first enable service `NetworkManager-dispatcher.service`

move this script to `/etc/NetworkManager/dispatcher.d/`
change its user and group ownership to root

For more information check : [NetworkManager 1](https://www.linuxsecrets.com/archlinux-wiki/wiki.archlinux.org/index.php/NetworkManager.html)
[NetworkManager 2](https://wiki.archlinux.org/index.php/NetworkManager)

If someone want change the conept, check : [Various Triggering 1](https://askubuntu.com/questions/436943/how-to-run-a-script-when-there-is-a-change-in-your-local-ip) & [Various Triggering 2](https://askubuntu.com/questions/258580/how-to-run-a-script-depending-on-internet-connection)
