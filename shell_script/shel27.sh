#count the words and sentences without using wc

echo "Enter a file name : \c"
read file
if [ -f $file ]
then
	echo "file exists"
elif [ -z $file ]
then
	exit
else
	echo "file doesn't exists"
fi
terminal=`tty`
exec < $file
count=0
word=0
while read line
do
	set $line
	word=`expr $word + $(echo $#)`
	count=`expr $count + 1`
done
echo "Word : $word"
echo "Line : $count"
exec < $terminal
	

