touch tempFile
clear
echo "This script removes empty lines from a file"
if [ $# -eq 0 ]
then
	echo "Enter fileName : "
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
echo "Old contents of file "
cat "$fname"
awk ' NF>0 { print $0 > "t" }
	END {system("mv " "tempFile " FILENAME) }' "$fname"
echo "New Contents of file "
cat "$fname"
rm tempFile
