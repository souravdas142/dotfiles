#
# ~/.bash_profile
#

wayLandLogFile=/home/$USER/.local/share/wayland/startwayland.log
xOrgLogFile=/home/$USER/.local/share/wayland/startxOrg.log



function log() {

	LogFile=""

	if [ "$1" == "xorg" ]; then
		LogFile=$xOrgLogFile
		check_display= $WAYLAND_DISPLAY
	elif [ "$1" == "wayland" ]; then
		LogFile=$wayLandLogFile
		check_display=$DISPLAY
	fi


	if [ -z "$check_display" ] && [ "$XDG_VTNR" -eq 1 ]; then
		echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] $@" 2>&1 | tee -a $LogFile

	fi
}

[[ -f ~/.bashrc ]] && . ~/.bashrc

function startwayland() {


	count=0

	log "wayland" "$@" "Start logging for $USER@tty$XDG_VTNR ........"

	if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
		#unset SWAYSOCK
		#exec dbus-run-session sway
		exec env -u SWAYSOCK dbus-run-session sway
	fi

	while [[ ! $WAYLAND_DISPLAY && $XDG_VTNR -eq 1 ]]
	do

		count=$( expr $count + 1 )
		log "wayland" "trying to start Wayland $count"


		if systemctl -q is-active graphical.target; then

			log "wayland" "starting Wayland......($count) "

			#unset SWAYSOCK
			#exec dbus-run-session sway -- -keeptty 2>&1 | tee -a $LogFile
			exec env -u SWAYSOCK dbus-run-session sway
			flag2=$?
			if [ $flag2 -eq 0 ]; then
				log "wayland" "executed starting Wayland..."
				break
			fi

		elif [[ $count -gt 45 ]]; then

		log "wayland" "\n\tunable to start or taking long time to finish graphical.target\
			  \n\ttry reloggin or reboot your machine.\
			  \n\t\`systemctl list-dependenies graphical.target\` issue the command\
			  \n\tto see its dependency chain."


		sleep 10
		log "wayland" "\nexiting...\n"

		sleep 2
		break

		else
			log "wayland" "\nwaiting(4 sec) to finish unit grphical.target..."

			sleep 4

		fi

	done

}

function startxorg() {

	count=0

	log "xorg" "\n\nStart logging for $USER@tty$XDG_VTNR ........"

	while [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]
	do

	count=$( expr $count + 1 )
	log "xorg" "\ntrying to startX $count"


	if systemctl -q is-active graphical.target; then

		log "xorg" "\nstarting startX......($count) "

		exec startx -- -keeptty 2>&1 | tee -a $LogFile
		flag2=$?
		if [ $flag2 -eq 0 ]; then
			log "xorg" "\nexecuted startX..."
			break
		fi

	elif [[ $count -gt 45 ]]; then

	log "xorg" "\n\tunable to start or taking long time to finish graphical.target\
		  \n\ttry reloggin or reboot your machine.\
		  \n\t\`systemctl list-dependenies graphical.target\` issue the command\
		  \n\tto see its dependency chain."


	sleep 10
	log "xorg" "\nexiting...\n"

	sleep 2
	break

	else
		log "xorg" "\nwaiting(4 sec) to finish unit grphical.target..."

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
