#read file stream
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
count=1
while read line
do
	echo "$count.\t$line"
	count=`expr $count + 1`
done
tty
exec < $terminal		#well you don't need to do this 
#because of the shell call a subshell when invoke your script
#but for security we can do that...


