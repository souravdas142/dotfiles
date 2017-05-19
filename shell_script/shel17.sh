#count the user input
echo "Enter something : \c"
read some
temp=`expr $(echo $some | wc -c) - 1`
#temp=`expr 5 - 1 `
echo "total character : $temp"
