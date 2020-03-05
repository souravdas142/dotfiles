# enable service NetworkManager-dispatcther.service
# move this script to /etc/NetworkManager/dispatcher.d/
# give user and group ownership to root and set permission to 755

# shebang to eliminate confusion if users using antoher shell
#!/bin/bash 
if [ ! -L /home/root ];then  # if pid own by root thn simple redirect to /root 
	ln -fs /root/ /home/root # from /home/root, here we can treat root is a 
fi							 # non-root user (but actually not :/ )

# by default NetworkManager-dispatcher pass connected Iface is up or down in $2
if [ "$2" == "up" ];then #check if IFace connected with a ssid, if yes then,
	procString=`ps aux | grep -i ".*netload.*.so" | grep -v "grep" | head -1` # search proc string for netload
	pid=$(echo $procString | awk '{print $2}') # extract process id for netload
	if [ "$pid" != "" ]; then #if pid exists then
       	user=$(echo $procString | awk '{print $1}') # Extract User name 

		netloadNum=$(echo $procString | awk '{print $13}') # which config file use for that pid 
		netloadPath=/home/$user/.config/xfce4/panel/netload-$netloadNum.rc # set config path for netload
		if [ -f $netloadPath ]; then #if netload config file exists then
	#			cur_dev=$(ip route  | tail -1 | cut -d' ' -f3) #set curr Iface using,from ip route, default gateway
				cur_dev=$1 # by default NetworkManager-dispatcher pass interface name in $1
				pre_dev=$(awk -F'=' '/Network_Device/ {print $2}'  $netloadPath) #Iface previously used
				if [ "$pre_dev" != "$cur_dev" ];then #if current interface change then
					sed -i -e  "s/Network_Device=.*/Network_Device=$cur_dev/" $netloadPath # replace prev Iface with curr
					kill -1 $pid # send SIGHUP signal for reread its configuration file
				fi
			fi
	fi
fi
