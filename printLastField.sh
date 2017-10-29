clear
echo "This program prints last field of all lines"
if [ $# -eq 0 ]
then
	echo "Enter Filename "
	read fname
	while [ -z "$fname" ]
	do
		read fname
	done
else
	fname=$1
fi
if [ ! -f "$fname" ]
then
	echo "File not exist."
	exit 1
fi
if [ ! -r "$fname" ]
then
	echo "File not readable."
	exit 2
fi
awk 'BEGIN { 
        system("clear") 
    }
    {
        printf "Line%d : %s\n", NR, $NF 
    }' $fname
