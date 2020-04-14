#!/bin/bash

url="https://ubuntu.com/download/desktop"
ver="19.10"
dwnUrl="https://ubuntu.osuosl.org/releases/$ver/ubuntu-$ver-desktop-amd64.iso"
id=2004



while :
do

    count=`curl -s $url | grep -ic $ver`
    echo "count = $count"

    if [ "$count" != "0" ]; then

        echo "After matched count = $count"
        echo "Ubuntu $ver LTS Launched ..!!" 

		recieve=$(dunstify -a "Ubuntu $ver" \
			-u "critical" \
			-r $id \
			--action="Download,Download" \
			--action="cancel,Cancel" \
			"Ubuntu $ver Launched...!!" \
			"\n<b>Yupii...Ubuntu $ver is Launched..!!</b>\n\n Download")

		case $recieve in
			"Download")
				xdg-open $dwnUrl
				;;
			"cancel")
				dunstify -C $id

		esac

	fi
done



