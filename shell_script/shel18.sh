#check whether input is vowel or not
echo "Enter a character : \c"
read var
if [ `echo $var | wc -c` = 2 ]
then
	if [ $var = a -o $var = e -o $var = i -o $var = o -o $var = u ]
	then
		echo "vowel"
	else
		echo "consonent"
	fi
else
	echo "wrong input"
fi
