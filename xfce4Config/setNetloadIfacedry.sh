# enable service NetworkManager-dispatcther.service
# move this script to /etc/NetworkManager/dispatcher.d/
# give user and group ownership to root and set permission to 755

# shebang to eliminate confusion if users using antoher shell
#!/bin/bash 

# by default NetworkManager-dispatcher pass connected Iface is up or down in $2
if [ "$2" == "up" ];then #check if IFace connected with a ssid, if yes then,
	procString=`ps aux | grep -i ".*netload.*.so" | grep -v "grep"` # search proc string for netload
	pid=$(echo $procString | awk '{print $2}') # extract process id for netload
	if [ "$pid" != "" ]; then #if pid exists then
       	user=$(echo $procString | awk '{print $1}') # Extract User name 

		netloadPath=/home/$user/.config/xfce4/panel/netload-10.rc # set config path for netload
		if [ -f $netloadPath ]; then #if netload config file exists then
	#			cur_dev=$(ip route  | tail -1 | cut -d' ' -f3) #set curr Iface using,from ip route, default gateway
				cur_dev=$1 # by default NetworkManager-dispatcher pass interface name in $1
				pre_dev=$(awk -F'=' '/Network_Device/ {print $2}'  $netloadPath) #Iface previously used
				echo "User = $user"
				echo "Pid = $pid"
				echo "Path = $netloadPath"
				echo "cur_dev = $cur_dev"
				echo "pre_dev = $pre_dev"
				if [ "$pre_dev" != "$cur_dev" ];then #if current interface change then
					sed  -e  "s/Network_Device=.*/Network_Device=$cur_dev/" $netloadPath # replace prev Iface with curr
				#	kill -1 $pid # send SIGHUP signal for reread its configuration file
				fi
			fi
	fi
fi
