#this is eleventh shell scriptin
echo "Enter a name : \c"
read fname
if [ -f $fname ]
then 
	echo "its a file"
else
	echo "thats not a file "
fi
