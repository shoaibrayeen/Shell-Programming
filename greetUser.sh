#This script greets you according to the time of the day
clear
#echo "This scripts greets you according to the time of day"
currentTime=`date +%H`
if [ $currentTime -le 0 -o $currentTime -gt 24 ]
then
	echo invalid time
	exit
elif [ $currentTime  -ge 0 -a $currentTime -lt 12 ]
	then
		echo Good Morning 
		exit
elif [ $currentTime  -ge 12 -a $currentTime -lt 16 ]
	then
		echo Good Afternoon
		exit
elif [ $currentTime  -ge 16 -a $currentTime -lt 20 ]
	then
		echo Good Evening
		exit
elif [ $currentTime -ge 20 -a $currentTime -lt 24 ]
	then
		echo Good Night
		exit
fi
