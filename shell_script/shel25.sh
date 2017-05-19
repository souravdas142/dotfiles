#passwd
echo "Enter username : "
read user
user=`cat /etc/passwd | grep $user`
IFS=:
set $user
echo "UserName : $1"
echo "UserId : $3"
echo "GrooupId : $4"
echo "Comment : $5"
echo "Home Folder : $6"
echo "Default Shell : $7"
