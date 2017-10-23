echo "This script indentify the type of input"

awk 'BEGIN{	
            system("clear")
	   }
     /^$/ {       
            print "NULL" 
            next
     }
		 /^([+-]?)[0-9]*([.]?[0-9]+)$/ {
            print "NUMERIC"
					  next
     }
		 /^[ -~]$/ {
            print "CHARACTER"
				    next
     }
		 {
            print "STRING"
     }'
