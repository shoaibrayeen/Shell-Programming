#This script prints last n lines entered by user and sorts the file
clear
function getfname()
{
	k=$1
	echo 
	source function
	isnull $k
	while [ $? -eq 0 ]
	do
		echo you entered a null character
		echo Enter file name or 1 to exit
		read k
		isexit $k
		isnull $k
	done
	source function
	isfile $k
	while [ $? -ne 0 ]
	do
		echo "file doesn't exist"
		echo Enter file name or 1 to exit
		read k
		isexit $k
		isfile $k
	done	
fname=$k
}
#print last n line
function print(){

expr $1 + 1 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]
then
	echo "number of lines should be integer "
	return
fi 

if [ $1 -lt 0 ]
then
	echo Number of lines should be positive.
	return 
fi
	echo	
	echo "$n lines from end are :"
	echo
	tail -$n $fname
}
#Main
echo "This script prints last n lines entered by user and sorts the file"
if [ $# -eq 0 ]
then
	echo "Enter filename."
	read fname
	getfname $fname
else
	getfname $1
fi

while [ true ]
do
	clear
	echo "Menu"
	echo "1. Print last n lines from the given file."
	echo "2. Sort the given file."
	echo "3. Enter a new file name."	
	echo "4. Exit"
	read choice
case $choice in
	1)
	echo "Enter number of lines to be printed ."
		read n
		print $n	;;
	2)
	echo "File after sorting "
	echo
	sort $fname;;
	
	3)
	read fname
	getfname $fname
	;;
	4) exit 0;;
	*)echo "Wrong choice"
	 echo "Enter again";;
esac
read x
done
