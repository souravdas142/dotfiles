#this is tenth file of shell scripting
echo "Enter a number : \c"
read num
if [ $num -le 20 ]
then 
	echo "not a good marks"
elif [ $num -eq 25 ]
then
	echo "thats average"
elif [ $num -ge 30 ]
then
	echo "ok ok thats good"
else
	echo "wrong input"
fi
	
