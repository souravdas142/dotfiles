# take a name from the user
#check the name if the exist or not
#check the file has write permission or not if exist
#if has write permission write somehting 
# and terminate with a massage hasbeen written successfully
#if has not permission terminate with a message 
#you've no permission to write

echo "Enter a name : \c"
read fname
if [ -f $fname ]
then
	if [ -w $fname ]
	then
		cat >> $fname
	else
		echo "you've no write permission"
	fi
else
	echo "sorry wrong input"
fi
