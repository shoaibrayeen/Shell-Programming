echo "This program Sort an array"
awk 'BEGIN{	
		print "Enter Size"
		getline n <"/dev/tty"
		print "\nEnter array\n"
		for( i=1 ; i<=n ; i++ )
		getline a[i] <"/dev/tty"
		insertion(a,n)
	  }
		function insertion ( a,n )
		{
	        	for(j=2;j<=n;j++)
			{
				 key=a[j];
				 i=j-1;
				while(a[i]>key && i>0)
				{
					a[i+1]=a[i];
					i=i-1;
				}
				a[i+1]=key
			}
		}
	END{
		print "\nDisplay Array\n"
		for( i=1 ; i<=n ; i++ )
		printf " " a[i]
	}' /dev/null
echo
