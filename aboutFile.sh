#this scipt
echo "This script display content and permission of given file and searches and modifies the given file"
clear
#get correct file name
function getfname()

{
	k=$1
	echo 
	source function
	isnull $k
	while [ $? -eq 0 ]
	do
		echo you entered a null character
		echo Enter file name again or 1 to exit
		read k
		isexit $k
		isnull $k
	done
	source function
	isfile $k	
	while [ $? -ne 0 ]
	do
		echo "file doesn't exist"
		echo Enter file name again or 1 to exit
		read k
		isexit $k
		isfile $k
	done	
fname=$k
}

#display Contents of file

function display(){
echo "Contents of file are :- "
cat $fname
}

#display permissions
function displayp(){
	
	isfile $fname
	echo "Permissions are "
	echo -n "$fname is "
	echo
	isfwrite $fname
	if [ $? -eq 0 ]
	then 

	 echo Writeable
	fi
	
	isfexecute $fname
	if [ $? -eq 0 ]
	then 
	 echo Executeable
	fi

	isfread $fname
	if [ $? -eq 0 ]
	then 	
 	echo Readable
	fi

}
#Search for a given pattern
function search(){

echo "Enter pattern you want to search in the file."
read pattern

echo "For Case sensitive search press 1 else 0 for insensitivity "
read x

if [ $x -eq 1 ]
then 
	grep "$pattern" $fname || echo "Pattern not found."
else
	grep -i "$pattern" $fname || echo "Pattern not found."
fi		
}
#replace 
function replace(){
echo "Enter character u want to replace in file."
read s1
echo "Enter character with which u want to replace in file."
read s2
tr "$s1" "$s2" <$fname >temp
mv temp $fname
cat $fname
}
#main

if [ $# -eq 0 ]
then
	
	echo "Enter filename"
	read fname
	getfname $fname
else
	getfname $1
fi
while [ true ]
do
clear
echo "Menu"
echo "Enter Choice"
echo "1.Display contents of file."
echo "2.Display permission of file."
echo "3.Search for a pattern."
echo "4.Replace a given letter."
echo "5.Enter a new file name."
echo "6. Exit"
read choice 
case $choice in
	1)	display;;
	2)	displayp;;
	3)	search;;
	4)	replace;;
	5)	echo "Enter filename"
		read fname
		getfname $fname;;
	6)	exit 0;;
	*)	
	echo wrong choice
	echo enter again;;
esac
read x
done
