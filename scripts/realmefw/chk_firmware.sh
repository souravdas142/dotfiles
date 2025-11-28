#!/bin/sh

BASE_URL="https://rms01.realme.net/sw/RMX3471export_11_14.0.0.1900EX01_202502220223"

i=0
while [ $i -le 9999 ]; do
    PADDED_I=$(printf "%04d" "$i")
    URL="${BASE_URL}${PADDED_I}.ofp"
    str=""
	stat=0
	if wget --spider "$URL" 2> /dev/null; then
		str=$(echo "FoundXy: $URL")
		stat=1
	else
		str=$(echo "Not Found $URL")
	fi

	echo $str | tee -a realme.log
	if [ $stat -eq 1 ]; then
		exit
	fi
    
    i=$((i + 1))
done
