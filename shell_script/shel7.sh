#this is 7th shell script
#check on numbers
echo "enter a number between 10 and 20 : "
read num
if [ $num -lt 10 ]
then
	echo "that was under the belt partner"
elif [ $num -gt 20 ]
then
	echo "that went over my head"
elif[ $num -eq ]
else
echo	"Now you are making sense!"
fi
