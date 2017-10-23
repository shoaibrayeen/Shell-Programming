echo "This script prints no. of logged in users along with their occurences"

who | awk 'BEGIN { 
            system("clear") 
           }
		       { 
                array[$1]+=1 
           }
	        END {	
                printf"Username\t: No. of logged in\n"
		            print "------------------------------------"
		            for(i in array) {
		                printf"%s\t\t: %d\n ", i , array[i]
                }
		}'
echo
