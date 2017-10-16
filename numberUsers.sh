#this script tells the number of users loggedin.
clear
users=`who|cut -d " " -f1|uniq`
who|cut -d " " -f1 >temp
for i in $users
do
	echo " $i  `grep $i temp | wc -l` "
done
