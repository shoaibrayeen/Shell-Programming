#this script accepts directory or file name and if file exists overwrite or append new content in file
clear
#modify function
function modify(){
fname=$1
if [ ! -e $fname ]
then
	echo "entered file or directory doen't exist"
	exit
else
	source function
	isfile $fname
	if [ $? -ne 0 ]
	then
		echo "you entered a directory"
		exit
	else
		echo "Content of file - $fname"
		echo
		cat $fname
		echo "Press 1 to overwrite file or 2 to append new content"
		read p
		case $p in
		1) 	echo "Enter content to overwrite file "
		 	cat >$fname;;
		2) 	echo "Enter content to append in file "
		 	cat >>$fname;;
		*) echo wrong choice
			return
		esac
		echo
		echo "Updated content of file - $fname"
		echo
		cat $fname
	fi
fi
}

#main
if [ $# -eq 0 ]
then
echo "This script accepts directory or file name and if file exists overwrite or append new content in file"
echo "Enter file name"
read fname
modify $fname
else
	for i in $*
	do
		modify $i
	done
fi
