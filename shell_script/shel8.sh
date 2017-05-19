#this is shell scripting eighth
echo "Enter a number : \c"
read num
if [ $num -gt 80 ]
then
	echo "first division"
elif [ $num -gt 70 ]
then
	echo "secon division"
elif [ $num -ge 40 ]
then
	echo "third division"
else
	echo "fail"
fi

