clear
echo "This script replaces the acronyms by their full-forms"
if [ $# -eq 0 ]
then
	echo "Enter a fileName"
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

awk  'FILENAME~/replaceAcronyms/ { for(i=2;i<=NF;i++)
				ar[$1]=ar[$1]$i" "
			next }	
	{
		for(i=1;i<=NF;i++)
		{
			if($i in ar)
			{
				 k=$i
				 $i=ar[$i] 
				 delete ar[k]
			}
		}
		print $0
	}' "replaceAcronyms" "$fname"
