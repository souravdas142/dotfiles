#run a chaecks on strings
str1="sourav"
str2="Das"
read str3
[ "$str1" = "$str2" ]
echo $?
[ "$str1" != "$str2" ]
echo $?
[ -z "$str3" ]
echo $?

