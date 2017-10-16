#this scripts compare two files and if contents are same remove the second one.
clear
echo "this scripts compare two files and if contents are same remove the second one."

if [ $# -eq 0 ]
then
	echo "Enter first file name"
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
	echo "Enter Second file name"
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
	cmp $fname1 $fname2 1>/dev/null 2>/dev/null
	if [ $? -eq 0 ]
	then
		echo "Both files are same."
		rm $fname2
		echo "Second file removed."
	else 
		echo "Files are not same."
	fi
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
	
	cmp $1 $2 1>/dev/null 2>/dev/null
	if [ $? -eq 0 ]
	then
		echo "Both files are same."
		rm $2
		echo "Second file removed."
	else
		echo "Files are not same."
	fi
fi
