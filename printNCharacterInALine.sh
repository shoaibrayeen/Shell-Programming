echo "This program prints n characters in a line"   //N is given by user

echo "Enter file name"
read fname
echo "Enter Number"
read number

awk '{
		len = length($0)
		i = 1
		while(len > number-1) {
			  print substr($0,i,number)
			  i = i + number
			  len = len - number
		}
		print substr($0,i)
 }' "$fname"
