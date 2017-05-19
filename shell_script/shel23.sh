#for loo[
for i in *
do
	if [ -d $i ]
	then
		echo "$i a direcotory"
	else
		echo "$i a file"
	fi
done
