echo "User defined wc"
echo "only mywc -l ,mywc -w & mywc -c accepted"
if [ $# -eq 2 ]
then
	fname=$2
else
	echo "wrong input"
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
awk -v var="$1" 'BEGIN{   system("clear")
		p=k=0;
				
		}
		{
			k+=length($0)
			p+=NF
			
		}END{
			if(var~/^-lcw/  ||  var~/^-clw/   ||  var~/^-wcl/)
			{
				printf "Number of Lines : %d\n",NR
				printf "Number of Character : %d\n",k
				printf "Number of Words : %d\n" ,p
			}
			else if(var~/^-lc/   ||   var~/^-cl/)
			{
				printf "Number of Lines : %d\n",NR
				printf "Number of Character : %d\n",k
			}
			else if(var~/^-lw/  ||  var~/^-wl/)
			{
				printf "Number of Lines : %d\n",NR
				printf "Number of Words : %d\n" ,p
			}
			else if(var~/^ -wc/   ||   ch~/^-cw/)
			{
				printf "Number of Words : %d\n" ,p
				printf "Number of Character : %d\n",k
			}
			else if(var~/^-c/)
			{
				printf "Number of Character : %d",k   
			}
			else if(var~/^-l/)
			{
				printf "Number of Lines : %d",NR
			}
			else if(var~/^-w/)
			{
				printf "Number of Words : %d" ,p
			}
			else
			 	print "Wrong Input"
		   }' "$fname"
echo
