#until lopp
num=1
until [ $num -gt 10 ]
do 
	echo "$num"
	num=`expr $num + 1`
done
