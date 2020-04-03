#renameing a file
# taking argument as the target folder as $1
# taking argument as the target folder as $2
#taking argument as the extension name as $3
# this is sourav das and i promise this code to work in more efficient way... Thanks

#for i in `ls ~/Desktop/shell/test/`;
for i in `ls $1`;
do
	temp=$i
	i=`echo $i | cut -d . -f1`
#	mv ~/Desktop/shell/test/$temp ~/Desktop/shell/test/$i.$1
	mv $1$temp $2$i.$3
	echo $i.$3
done
