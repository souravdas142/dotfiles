## <br/><br/>&nbsp;&nbsp;&nbsp;Ubuntu Release Checker ( FOR DESKTOP & MOBILE PHONES )

###### &nbsp;&nbsp;Description : 
<p>
			&nbsp;&nbsp;&nbsp;This script check whether Ubuntu 20.04 is released or not, if released,then it show you a notification with <br /> &nbsp;&nbsp;&nbsp;download button, if you select "Download", script redirect you to your default browser and automatically <br />&nbsp;&nbsp;&nbsp;start download "Ubuntu 20.04" (For Mobile-phones : clicking on "Download" option, will let you directly<br/>&nbsp;&nbsp; download with your default download manager). Script can be used from any distro. Suppose you want to<br/>&nbsp;&nbsp; come back to Ubuntu 20.04 as soon as it will be released or you want to  fresh install upon release or you<br/>&nbsp;&nbsp;&nbsp;want to test the latest release Then the script is for you. The script is far different from `do-release-upgrade`.<br/>&nbsp;&nbsp; So `do-release-upgrade` lacks of feature being checked on every minutes or seconds, but script can do. <br />&nbsp;&nbsp;Another thing, How can you run `do-release-upgrade` if you are in another distro.<br/>

</p>

###### &nbsp;&nbsp;&nbsp;Usage 

>	    -h,--help  Show this help
>
>		--desktop  use this script for desktop or pc
>
>		--mobile-phone use this script in mobile with termux

&nbsp;&nbsp;&nbsp;**Some Screenshots :**<br/><br/>
&nbsp;&nbsp;&nbsp;**Manjaro-Kde :**<br/><br/>

&nbsp;&nbsp;&nbsp;&nbsp; ![Manaro-Kde](https://github.com/souravdas142/dot_config_shell_files/blob/master/scripts/Ubuntu/images/manjarokde.png)

&nbsp;&nbsp;&nbsp;**Ubuntu :**<br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp; ![Ubuntu](https://github.com/souravdas142/dot_config_shell_files/blob/master/scripts/Ubuntu/images/ubuntu.png)

 **i3WM + rofi**	|	**ManjaroXfce**
:-------------------------------:|:--------------------------:
 ![i3wm](https://github.com/souravdas142/dot_config_shell_files/blob/master/scripts/Ubuntu/images/i3wm.jpg)	|  ![ManjaroXfce](https://github.com/souravdas142/dot_config_shell_files/blob/master/scripts/Ubuntu/images/manjaroXfce.jpg)

<br/><br/><br/>
&nbsp;&nbsp;**Youtube Videos to demonstrate**<br/>


|	**Desktop**	|	**Mobile-Phones**|
|		:---:	|			:---:	 | 
|	[<img src="https://img.youtube.com/vi/77UbtN_Cz8E/maxresdefault.jpg" width="330" height="190">](https://youtu.be/77UbtN_Cz8E) | [<img src="https://img.youtube.com/vi/32Ouuq_zYi8/hqdefault.jpg" width="390" height="235">](https://youtu.be/32Ouuq_zYi8) | 



## &nbsp;&nbsp;This script works in both desktop or phone

&nbsp;&nbsp;&nbsp;**Dependencies :**

|  **Dekstop**	| **Mobile Phones** |
|	  :---      |		:---	    |
|  <ol><li>cURL</li><li>grep</li><li>[dunst](https://github.com/dunst-project/dunst)</li><li>dunstify (follow dunst)</li><li>libnotify</li><li>dmenu compatible<br/> menu (like [rofi](https://github.com/davatorium/rofi)) [Optional]</li></ol>	|	<ol><li>[termux](https://f-droid.org/en/packages/com.termux/)</li><li>[termux-api](https://f-droid.org/en/packages/com.termux.api/)</li><li>[termux-boot](https://f-droid.org/en/packages/com.termux.boot/) (optional)</li><li>cURL</li><li>grep</li></ol>	|

&nbsp;&nbsp;**first install all dependencies otherwise this script will not work.**<br/><br/>

## &nbsp;&nbsp;For Desktop :
```bash
curl -LJO "https://raw.githubusercontent.com/souravdas142/dot_config_shell_files/master/scripts/Ubuntu/chkUbuntuRelease"
chmod 755 chkUbuntuRelease
./chkUbuntuRelease --desktop
```
&nbsp;&nbsp;**Note 1 :** For Debian like distro you have to build [dunstify](https://github.com/dunst-project/dunst/wiki/Installation) from source. Otherwise you can also download prebuild binary from this repo
```bash
curl -LJO "https://raw.githubusercontent.com/souravdas142/dot_config_shell_files/master/scripts/Ubuntu/dunstify"
sudo chmod 755 dunstify
sudo cp -v dunstify /usr/local/bin/
```

&nbsp;&nbsp;**Note 2 :** if you are using any window manager (not DE) and you are using rofi :

```bash
curl -LJO "https://raw.githubusercontent.com/souravdas142/dot_config_shell_files/master/scripts/Ubuntu/dunstDmenu"
chmod 755 dunstMenu
cp -v dunstMenu ~/
```
<br/> &nbsp;&nbsp;Then go to `~/.config/dunst/dunstrc` edit or add bellow line
```bash
dmenu=/home/$USER/dunstMenu
```
 &nbsp;&nbsp; **$USER must be expanded manually**

## &nbsp;&nbsp;For Mobile Phones
&nbsp;&nbsp;1. First Install all Dependencies for Mobile phones.<br/>
&nbsp;&nbsp;2. Update && upgrade all packages in termux<br/>
&nbsp;&nbsp;3. Feed the bellow commands 
```bash
termux-setup-storage    	# grant storage permission
apt install curl termux-api

curl -LJO "https://raw.githubusercontent.com/souravdas142/dot_config_shell_files/master/scripts/Ubuntu/chkUbuntuRelease"
chmod 755 chkUbuntuRelease
./chkUbuntuRelease --mobile-phone
```
&nbsp;&nbsp;4. It will alert (By alarm) you when Ubuntu released.<br/>
&nbsp;&nbsp;5. It will copy download url to your clipboard<br/>
&nbsp;&nbsp;6. It will show you a download option in notification<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offering you download directly with your default download manager<br/>

### &nbsp;&nbsp;**Configuration**<br/>
&nbsp;&nbsp;The top most part of the script is reserved to Configure the script behaviour. [Configuration](https://github.com/souravdas142/dot_config_shell_files/blob/f34944262b2014eda4b96ea7922f7f752a1a865a/scripts/Ubuntu/chkUbuntuRelease#L3-L13) <br/>

|	**Options**	| **Description** |
|	:---				|		:---	  |
|	`url` & `dwnUrl` | you can change the url if you want to use differnet flavours (or the vanilla ubuntu) . you can change the dwnUrl to use different server of different flavours. |
|	`ver`		|	you can change the ver (version) of the ubuntu or its derivative if required.	|
|	`chkFreq`	|	You can also change the interval or frequency (i.e. how much time script waits after running once) of the script.  |
|	`mode`		|	You can change the mode of the script (default is "$1", possible values : "--desktop", "--mobile-phone"), this is usefull unless you want to run it as autostart script, otherwise changing this doesn't make any sense. |


### &nbsp;&nbsp;Example : <br/>
```bash

./chkUbuntuRelease --desktop & 
			or,
./chkUbuntuRelease --mobile-phone &

```

### &nbsp;&nbsp;&nbsp;Autostart<br/>

&nbsp;&nbsp;&nbsp;[**Desktop**]<br/><br/>
&nbsp;&nbsp;&nbsp;For Desktop There is a serparate service available. To make autostart with boot, do as bellow.<br/>

```bash

curl -LJO "https://raw.githubusercontent.com/souravdas142/dot_config_shell_files/master/scripts/Ubuntu/chkUbuntuRelease.service"
sudo chmod 644 dunstMenu
sudo cp -v chkUbuntuRelease.service /etc/systemd/user/

# Move the script to `/usr/local/bin/` otherwise it doesn't work. Or you
# can change the path of the service file, you have to edit then `ExecStart`
sudo mv -v chkUbuntuRelease /usr/local/bin/

systemctl --user daemon-reload

```

&nbsp;&nbsp;&nbsp; *Then Enable the service,*

```bash

#(for current user-specific) -
systemctl --user enable chkUbuntuRelease

#(for all-User) - As root
systemctl --user --global enable chkUbuntuRelease

#To start the service immidiately,
systemctl --user start chkUbuntuRelease

#To see the status of the started service,
systemctl --user status chkUbuntuRelease

```

&nbsp;&nbsp;&nbsp;[**Mobile Phone**]

```bash
#install termux-boot see dependencies & create directory 

mkdir -p ~/.termux/boot

#move the script to `~/.termux/boot/`

mv -v chkUbuntuRelease ~/.termux/boot/

# Open termux-boot just once form app launcher 
# icon to grant permission for autostart the app on boot
# if its not showing you to grant the permission manually do it
# by going app manager && reboot your phone

```


	
**TO Do**<br/>
- [x] termux-wakelock
- [x] no need to start with `nohup` - this scrip is immune to stoping
