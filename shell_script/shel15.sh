#this is example of logical operator
echo "Enter a number in between 50 and 100 : \c"
read num
if [ $num -le 100 -a $num -ge 50 ]
then
	echo "number is valid"
else
	echo "number is not valid"
fi
