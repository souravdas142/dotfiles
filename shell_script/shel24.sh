#ifs internal field separator
IFS=:
echo "Enter a sentance : \c"
read sentence
set $sentence
echo $1
echo $2
echo $3
echo $4
