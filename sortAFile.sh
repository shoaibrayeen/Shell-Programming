if [ $# -eq 1 ]
then
	fname=$1
elif [ $# -eq 2 ]
then
	fname=$2
else
	echo "1st argument as file name"
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


awk -v var="$1" 'BEGIN {
		        system("clear")
		        print "This program sort a file"
	            }
	            {
                  	array[i++]=$0
                  } 
     	        {	  
		                for( i = 0 ; i < NR ; i++ ) {
			                  for( j = 0 ; j < NR-i-1 ; j++ ) {
				                    if( array[j] > array[j+1] ) {
					                      temp=array[j]
					                      array[j]=array[j+1]
					                      array[j+1]=temp
				                    }
			                  }
		                }
	            }
	    END {	
		          if( var~/^-r/ ) {
			            for( i = NR ; i >= 0 ; i--)
			                printf "\n%s", array[i]
		          }
		          else  {
			            for( i = 0 ; i <= NR ; i++)
			              printf "\n%s", array[i]
		          }
	    }' "$fname"
echo
