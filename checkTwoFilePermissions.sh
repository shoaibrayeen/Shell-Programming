touch tempFile
clear
echo "this program checks the permission of two file"
if [ $# -eq 2 ]
then
	ls -l "$1" | cut -d" " -f1 > tempFile
	ls -l "$2" | cut -d" " -f1 >> tempFile
	awk '{
			    array[$0]+=1
		  }
	    END {
			    for ( i in array ) {
			        if(array[i]==2)
			            print "Permision are Identical"
			        else
			            print "Permission are Different"
			        break
		        }
	      }' temoFile

else
	echo "Only Two Arguments Acceptable"
fi
rm "tempFile"
