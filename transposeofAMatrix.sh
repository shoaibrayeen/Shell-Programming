clear
echo "This script prints the transpose of a matrix"
awk 'BEGIN {
	            print "Original Matrix "
	            print "----------------------------" 
          }
	        {
              print
		          for(i=1; i<=NF; i++) {
                  array[i]=array[i]" "$i" "  
              }
	        }
     END  {	
          print "Transpose "
		      print "---------------------------"
		      for(i=1; i<=NF; i++)
		      printf"\n%s ",array[i]  
	    }' "matrix"
echo
