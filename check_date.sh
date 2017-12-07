clear
touch t
echo "This program checks date"
if [ $# -eq 1 ]
then
	 echo $1 > t
	 awk 'BEGIN{  
				FS="/"   }
		 {
			if(NF==3)
			{
				if($1>0 && $1<13)
				{
					if($2>0 && $2<32)
					{
						if($1!=2)
						{
							if($1==4 || $1==6 || $1==9 || $1==11)
							{
								if($2>30)
								{
									print "Invalid Day"
									exit
								}
							}
							if($3%4==0 && $3%100!=0)
							{
								print "Leap Yaer"
							}			
							else if($3%4==0 && $3%100==0)
							{
								if($3%400==0)
								{
									print "Leap Yaer"
								}
							}
							print $0
							system("date -d "$0" +%A")
							system("date -d "$0" +%B")
						}
						else
						{
							if($2<30)
							{
								if($3%4==0 && $3%100!=0)
								{
									print "Leap Yaer"
								}			
								else if($3%4==0 && $3%100==0)
								{
									if($3%400==0)
									{
										print "Leap Yaer"
									}
								}
								else
								{
									if($2>28)
									{
										print "Invalid day"
										exit
									}
								}
										print $0
										system("date -d "$0" +%A")
										system("date -d "$0" +%B")
							}
							else
							{
								print "Invalid Day"
							}
						}	
						
					}
					else
					{
						print "invalid Day"
					}
				}
				else
				{
					print "Invalid Month"
					if($2>31)
						print "Invalid day"
				}
				
			}		
			else
			{
				print "Wrong Input"
			}	
     		    }' t
else
	echo "Invalid date"
fi
rm t
