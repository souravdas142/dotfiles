#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

function startwayland() {


	count=0
	LogFile=/home/$USER/.local/share/wayland/startwayland.log

	echo -e "\n\nStart logging for $USER@tty$XDG_VTNR Time : $(date) ........" >> $LogFile

	if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
		exec sway
	fi

	while [[ ! $WAYLAND_DISPLAY && $XDG_VTNR -eq 1 ]]
	do
	
		count=$( expr $count + 1 )
		echo -e "\ntrying to start Wayland $count"
		
		
		if systemctl -q is-active graphical.target; then
		
			echo -e "\nstarting Wayland......($count) "
		
			exec sway -- -keeptty 2>&1 | tee -a $LogFile
			flag2=$?
			if [ $flag2 -eq 0 ]; then
				echo -e "\nexecuted starting Wayland..."
				break
			fi
		
		elif [[ $count -gt 45 ]]; then
		
		echo -e "\n\tunable to start or taking long time to finish graphical.target\
			  \n\ttry reloggin or reboot your machine.\
			  \n\t\`systemctl list-dependenies graphical.target\` issue the command\
			  \n\tto see its dependency chain." 
		
		
		sleep 10
		echo -e "\nexiting...\n"
		
		sleep 2
		break
		
		else
			echo -e "\nwaiting(4 sec) to finish unit grphical.target..." 
		
			sleep 4
		
		fi
	
	done

}

function startxorg() {

	count=0
	LogFile=/home/$USER/.local/share/xorg/startx.log
	
	echo -e "\n\nStart logging for $USER@tty$XDG_VTNR Time : $(date) ........" >> $LogFile
	
	while [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]
	do
	
	count=$( expr $count + 1 )
	echo -e "\ntrying to startX $count"
	
	
	if systemctl -q is-active graphical.target; then
	
		echo -e "\nstarting startX......($count) "
	
		exec startx -- -keeptty 2>&1 | tee -a $LogFile
		flag2=$?
		if [ $flag2 -eq 0 ]; then
			echo -e "\nexecuted startX..."
			break
		fi
	
	elif [[ $count -gt 45 ]]; then
	
	echo -e "\n\tunable to start or taking long time to finish graphical.target\
		  \n\ttry reloggin or reboot your machine.\
		  \n\t\`systemctl list-dependenies graphical.target\` issue the command\
		  \n\tto see its dependency chain." 
	
	
	sleep 10
	echo -e "\nexiting...\n"
	
	sleep 2
	break
	
	else
		echo -e "\nwaiting(4 sec) to finish unit grphical.target..." 
	
		sleep 4
	
	fi
	
	done

}

#startxorg
startwayland

############### Leave this thing on cron job monthly ############

#	find $LogPath -type f -iname "startx.log" -size +5M \( -exec cp  -u --backup=simple -S$(date '+%d%m%y_%I%M%P').bak '{}' '{}'.bak \; -a -exec  rm -f '{}' \; \)

# opam configuration
test -r /home/sourav/.opam/opam-init/init.sh && . /home/sourav/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
