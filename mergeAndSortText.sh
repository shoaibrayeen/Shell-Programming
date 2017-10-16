# Shell-Programming
#this script merges the content of three given file , sort the text and display the sorted output
clear 
echo "this script merges the content of three given file , sort the text and display the sorted output."
if [ $# -eq 0 ]
then 
	echo "Enter first file name"						#Reading first file name
	read fname1
	source function
	isnull $fname1
	while [ $? -eq 0 ]
	do
		read fname1
		isnull $fname1
	done
	source function
	isfile $fname1
	if [ $? -ne 0 ]
	then
		echo "$fname1 doesn't exist."
		exit 1;
	fi	
	echo "Enter second file name"						#Reading second file name
	read fname2
	source function
	isnull $fname2
	while [ $? -eq 0 ]
	do
		read fname2
		isnull $fname2
	done
	source function
	isfile $fname2
	if [ $? -ne 0 ]
	then
		echo "$fname2 doesn't exist."
		exit 1;
	fi
		
	echo "Enter third file name"						#Reading third file name
	read fname3
	source function
	isnull $fname3
	while [ $? -eq 0 ]
	do
		read fname3
		isnull $fname3
	done
	source function
	isfile $fname3
	if [ $? -ne 0 ]
	then
		echo "$fname3 doesn't exist."
		exit 1;
	fi	
	echo "Sorted output of three merged file." 
	cat <$fname1 >temp
	cat <$fname2 >>temp
	cat <$fname3 >>temp
	sort temp
else
	source function
	isfile $1
	if [ $? -ne 0 ]
	then
		echo "$1 doesn't exist."
		exit 1;
	fi
	
	source function
	isfile $2
	if [ $? -ne 0 ]
	then
		echo "$2 doesn't exist."
		exit 1;
	fi
	
	source function
	isfile $3
	if [ $? -ne 0 ]
	then
		echo "$3 doesn't exist."
		exit 1;
	fi
	echo "Sorted output of three merged file."
	cat <$1 >temp
	cat <$2 >>temp
	cat <$3 >>temp
	sort temp
fi
