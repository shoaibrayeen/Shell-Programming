//This Program reverses the command line arguments.

clear
if [ $# -eq 0 ]
then 
	echo -e "\n no command line argument to reverse"
elif [ $# -ge 1 ]
then
	for i in $*
	do	
		str="$i $str"
	done
	echo
	echo "$str"
	echo
fi
