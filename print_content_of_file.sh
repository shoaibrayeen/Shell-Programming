echo "enter file name"
read fname
awk ' a[$0]++<1 {print $0}' $fname
