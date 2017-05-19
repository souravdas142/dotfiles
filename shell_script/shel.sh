#this is first shell scripting
echo $1 file will be modified
ls -l | grep $1
mv $1 $2
echo listing $1
ls -l | grep $1
echo listing $2
ls -l | grep $2



