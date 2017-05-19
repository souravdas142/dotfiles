#this is character count on user input
echo "Enter a number : \c"
read num
if [ `echo $num | wc -c` -eq 2 ]
then
	echo "the character is one length"
else
	echo "the input is more than one character"
fi
