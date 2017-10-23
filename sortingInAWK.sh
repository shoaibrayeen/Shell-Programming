echo "This program Sort an array"
awk 'BEGIN{	
		print "Enter Size"
		getline number
    
		print "\nEnter array\n"
		for( i=1 ; i <= number ; i++ ) {
		    getline array[i]
    }
    
	  for(j=2 ; j <= number ; j++) {
			  key=array[j];
			  i=j-1;
        
			  while(array[i]>key && i>0) {
				    array[i+1]=array[i];
				    i=i-1;
			  }
        
			  array[i+1]=key
		}
		print "\nDisplay Array\n"
		for( i=1 ; i<=number ; i++ ) {
		    printf " " array[i]
    }
}'
echo
	
