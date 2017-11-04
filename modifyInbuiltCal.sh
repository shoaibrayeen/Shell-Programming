#This scripts modifies the cal program
echo this script enhances the inbuilt cal program
function month(){
k=`echo "$1"|cut -c1-3|tr "[a-z]" "[A-Z]"`
case $k in
JAN)mon=1;;
FEB)mon=2;;
MAR)mon=3;;
APR)mon=4;;
MAY)mon=5;;
JUN)mon=6;;
JUL)mon=7;;
AUG)mon=8;;
SEP)mon=9;;
OCT)mon=10;;
NOV)mon=11;;
DEC)mon=12;;
*)echo "Wrong month name"
	exit 
	;;
esac
return $mon
}
#main
if [ $# -eq 0 ]
then 
	cal
elif [ $# -eq 1 ]
then
	source function
	isnum $1
	if [ $? -eq 0 ]
	then
		cal $1
	else
		month $1
		year=`date +%Y`		
		cal $mon $year
	fi
elif [ $# -eq 2 ]
then
	source function	
	isnum $2	
	if [ $? -ne 0 ]
	then
		echo "Year must be positive integer"
		exit
	else	
		source function
		isnum $1
		if [ $? -eq 0 ]
		then
			cal $1 $2
		else
			month $1		
			cal $mon $2
		fi
	fi			
fi
