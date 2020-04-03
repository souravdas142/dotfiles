#!/bin/bash


#substitute gcc command options and arguments
gccf(){
	read -p "Enter Language ( gcc ( for C ) OR g++ ( for C++ ) ) : " lang
	if [ $lang = "gcc" ]
	then
		extn=`echo "c"`
		std=`echo c11`
	elif [ $lang = "g++" ]
	then
		extn=`echo "cpp"`
		std=`echo "c++14"`
	else
		echo "Enter language properly..."
		return 1
	fi

	read -p "Enter Source file Name : " source
	read -p "Enter object file name : " obj
	read -p "Enter Standard ( Default -std=c11 ) : " rstd
	if [ ! -z $rstd ]
	then
		std=$rstd
	fi
	echo "$source.$extn compiling with -std=$std"
	echo "please wait... generating object $obj..."

	$lang -Wall -Wextra -Werror -pedantic -g -std=$std $source.$extn -o $obj
	if [ $? -eq 0 ]
	then
		echo "object successfully generated..."
	fi
}

gccf			#Call the function
