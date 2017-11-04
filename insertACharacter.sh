clear
echo "This script inserts a character at a particular position in every line of a file"
if [ $# -eq 0 ]
then
	echo "Enter a filename"
	while [ -z "$fname" ]
	do
		read fname
	done
else
	fname=$1
fi
if [ ! -f "$fname" ]
then
	echo "File not exist."; exit 1
fi

awk 'BEGIN{		printf "Enter the character\t:  "
			while(!ch)
			getline ch <"/dev/tty"
			if(ch!~/^[ -~]$/){ printf"Only Character Accepted \n"; exit }
			printf "Enter the position \t:  "
			while(!pos)
			getline pos <"/dev/tty"
			if(pos!~/^[0-9]+$/){ printf"Invalid position.\n"; exit }
		}
		{	printf "%s%s%s\n",substr($0,1,pos-1),ch,substr($0,pos) }' "$fname"
