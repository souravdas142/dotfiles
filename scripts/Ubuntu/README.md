## <br/><br/>&nbsp;&nbsp;&nbsp;Ubuntu Release Checker

###### &nbsp;&nbsp;Description : 
<p>
			&nbsp;&nbsp;&nbsp;This script check whether Ubuntu 20.04 is released or not, if released,then it show you a notification with <br /> &nbsp;&nbsp;&nbsp;download button, if you select "Download", script redirect you to your default browser and automatically <br />&nbsp;&nbsp;&nbsp;start download "Ubuntu 20.04" (For Mobile-phones : clicking on "Download" option, will let you directly<br/>&nbsp;&nbsp;&nbsp; download with your default download manager). <br />&nbsp;&nbsp;&nbsp;
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
&nbsp;&nbsp;**For Mobile Phones with termux**<br/>

&nbsp;&nbsp;&nbsp; ![Gif](mobilePhonesGif)
<br/><br/><br/>
&nbsp;&nbsp;**Youtube Videos to demonstrate**<br/>

&nbsp;&nbsp;&nbsp; ![youtube](Yutubevideos)


## &nbsp;&nbsp;This script works in both desktop or phone

&nbsp;&nbsp;&nbsp;**Dependencies :**

|  **Dekstop**	| **Mobile Phones** |
|	  :---      |		:---	    |
|  <ol><li>cURL</li><li>grep</li><li>dunst</li><li>dunstify</li><li>libnotify</li><li>dmenu compatible<br/> menu (like rofi) [Optional]</li></ol>	|	<ol><li>[termux](https://f-droid.org/en/packages/com.termux/)</li><li>[termux-api](https://f-droid.org/en/packages/com.termux.api/)</li><li>cURL</li><li>grep</li></ol>	|

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
&nbsp;&nbsp;3. Do as bellow 
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
	
**TO Do**<br/>
- [x] termux-wakelock
- [] run script with `nohup` command

