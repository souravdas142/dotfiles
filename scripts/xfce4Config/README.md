
## This Script Automatically set the InterfaceName for netload plugin for Xfce4 panel

### This script triggers when NetworkManager connects to a network Interface


| :warning: WARNING: |
| :----------------  |
|	**This Script is made for Only One Instance of netload and for One user at a time</br> It may show unknown behaviour if uses with multiple Instance and multiple user at a time** |

|:pencil2: **Dependencies :**|
|:-----------------|
|<ol><li> Xfce4 Panel </li><li> Network Monitor (netload)</li><li> Network Manager</li><li> awk</li><li> sed</li><li> cut</li><li> grep</li>|
|---------------|


first enable service `NetworkManager-dispatcher.service`

move this script to `/etc/NetworkManager/dispatcher.d/`
change its user and group ownership to root set permission to 755



For more information check :
 [NetworkManager-1](https://www.linuxsecrets.com/archlinux-wiki/wiki.archlinux.org/index.php/NetworkManager.html)
[NetworkManager-2](https://wiki.archlinux.org/index.php/NetworkManager)

If someone want change the conept, check : 
[Various_Triggering-1](https://askubuntu.com/questions/436943/how-to-run-a-script-when-there-is-a-change-in-your-local-ip) 
[Various_Triggering-2](https://askubuntu.com/questions/258580/how-to-run-a-script-depending-on-internet-connection)
