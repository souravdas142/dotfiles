#shell scripting 4
for i in `ls ~/Desktop/shell/test/`;
do
	mv $i $i.$1
	echo $i.$1
done
