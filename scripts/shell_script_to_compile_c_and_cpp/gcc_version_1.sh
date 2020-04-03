#!/bin/bash

#substitute gcc command options and arguments
gccf(){
	cstd=`echo c11`
	read -p "Enter Language ( GCC OR G++ ) : " lang
	case "$lang" in
		gcc | g++)
			echo "You're Ready..."
			;;
			*)
				echo "Enter language properly..."
				return 1
				;;
		esac
		if [ $lang = "gcc" ]
		then
			extn=`echo "c"`
		else
			extn=`echo "cpp"`
		fi

	#echo "Enter Source file Name : \c"
	read -p "Enter Source file Name : " source
	#echo "Object file Name : \c"
	read -p "Enter object file name : " obj
	read -p "Enter Standard ( Default -std=c11 ) : " rcstd
	if [ -z $rcstd ]
	then
		echo "you're compiling with -std=$cstd"
	else
		cstd=$rcstd
		echo "you're compiling with -std=$cstd"
	fi

	$lang -Wall -Wextra -Werror -pedantic -g -std=$cstd $source.$extn -o $obj
}
