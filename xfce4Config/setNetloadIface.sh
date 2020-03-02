if [ "$2" == "up" ];then
	netloadPath=/home/sourav/.config/xfce4/panel/netload-10.rc
	if [ -f $netloadPath ]; then
		pid=$(ps aux | grep -i "netload" | grep -v "grep"|awk '{print $2}')
		if [ "$pid" != "" ]; then
#			cur_dev=$(ip route  | tail -1 | cut -d' ' -f3)
			cur_dev=$1
			pre_dev=$(awk -F'=' '/Network_Device/ {print $2}'  $netloadPath)
			if [ "$pre_dev" != "$cur_dev" ];then
				sed -i -e  "s/Network_Device=.*/Network_Device=$cur_dev/" $netloadPath
				kill -1 $pid
			fi
		fi
	fi
fi
