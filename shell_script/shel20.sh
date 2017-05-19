#word check
echo "Enter a word : \c"
read word
case $word in
	[aeiouAEIOU]*)
		echo "word start with vowel letter"
		;;
	[0-9]*)
		echo "word start with number"
		;;
	*[0-9])
		echo "word start with letter but end with number"
		;;
	???)
		echo "word with three charecters"
		;;
	*)
		echo "nothing"
		;;
esac
