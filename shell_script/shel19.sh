#case statement for multiple choice
echo "ENter a single character"
read char
case $char in
	[a-z])
		echo "the character you typed was small alphabet"
		;;
	[A-Z])
		echo "you have entered block letter"
		;;
	[0-9])
		echo "you have entered a number "
		;;
	?)
		echo "you have entered a special character"
		;;
	*) 
		echo "you have enter multiple character"
		;;
esac
