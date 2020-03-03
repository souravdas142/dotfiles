# enable service NetworkManager-dispatcther.service
# give user and group ownership to root and set permission to 755
# move this script to /etc/NetworkManager/dispatcher.d/

# shebang to eliminate confusion if users using antoher shell
#!/bin/bash 

if [ "$2" == "up" ];then #check if interface connected with a ssid, if yes then,

        user="sourav" # Change User name to yours

	netloadPath=/home/$user/.config/xfce4/panel/netload-10.rc #set where is your config file for netload
	if [ -f $netloadPath ]; then #if netload config file exists then
		pid=$(ps aux | grep -i "netload" | grep -v "grep"|awk '{print $2}') # search process id for netload
		if [ "$pid" != "" ]; then #if pid exists then
#			cur_dev=$(ip route  | tail -1 | cut -d' ' -f3) #set what is your current device using,from ip route, default gateway
			cur_dev=$1 # by default NetworkManager-dispatcher pass interface name in $1
			pre_dev=$(awk -F'=' '/Network_Device/ {print $2}'  $netloadPath) #what is your interface using previously?
			if [ "$pre_dev" != "$cur_dev" ];then #if current interface change then
				sed -i -e  "s/Network_Device=.*/Network_Device=$cur_dev/" $netloadPath # replace previous intface with current one
				kill -1 $pid # send SIGHUP signal for reread its configuration file
			fi
		fi
	fi
fi
