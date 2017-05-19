HISTFILE=~/.bash_history
set -o history
echo "enter a initial number : \c"
read init
echo "Enter a terminal number \c"
read trem
while [ $init -le $trem ]
do
	history -d $init
	init=`expr $init + 1`
done
