echo "This program remove duplicates lines"
echo "Enter Filename"
read fname

awk 'BEGIN{
		system("clear")
	  }
		{
			array[$0]+=1
		}
	END{
		for ( i in array )
		print i
		}' "$fname"
echo
