#
echo "Enter a name : "
read a b
if mv $a $b
then
	echo successfully moved
else
	echo not possible move
fi

