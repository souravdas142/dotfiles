#this is twelveth shell scripting
echo "enter a name : \c"
read dname
if [ -b $dname ]
then
	echo "this is a direcotry"
else
	echo "this is a file"
fi

