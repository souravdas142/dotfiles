#shel scripting 3
for i in $* ;do
	touch ~/Desktop/shell/test/$i
	echo $i
done
