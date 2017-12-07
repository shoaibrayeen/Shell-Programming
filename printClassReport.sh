clear
echo "This script prints a class report"
awk 'BEGIN{ FS=" " }
	NR>1 {	tot[$1]=$2+$3+$4+$5+$6
		if(tot[$1]/5 > 90)     { grade[$1]="A+";  n1++ }
		else if(tot[$1]/5 >80) { grade[$1]="A";   n2++ }
		else if(tot[$1]/5 >70) { grade[$1]="B+";  n3++ }
		else if(tot[$1]/5 >60) { grade[$1]="B";   n4++ }
		else if(tot[$1]/5 >50) { grade[$1]="C";   n5++ }
		else if(tot[$1]/5 >40) { grade[$1]="D";   n6++ }
		else if(tot[$1]/5 >30) { grade[$1]="E";   n7++ }
		else		       { grade[$1]="F";   n8++ }
	    }
	   END{ printf"\nStudents Report :"
		printf"\n------------------------------------------------------------------------"
		printf"\nSr.No.\t\tName\t\tTotal\t\tAverage\t\tGrade\t"
		printf"\n------------------------------------------------------------------------"
		for(i in tot){
			printf"\n%2d\t%10s\t\t%d\t\t%.2f\t\t%s\t",++n,i,tot[i],tot[i]/5,grade[i]
			ctot+=tot[i]
		 }
		printf"\n------------------------------------------------------------------------\n"
		for(i in tot){
		  if(tot[i]/5 >= ctot/((NR-1)*5)) above++
		  else	below++
		}
		printf"\nClass Report :\n---------------------------------------------------------"
		printf"\nClass strength\t :%d  \n---------------------------------------------------------",NR-1
	        printf"\nAverage of the class\t\t\t:\t%.2f\t\n---------------------------------------------------------",ctot/((NR-1)*5)
		printf"\nNo. of students above class average\t:   %d ",above
		printf"\nNo. of students below class average\t:   %d ",below
		printf"\n---------------------------------------------------------"
		printf"\nNo. of students having grade A+  :  %d ",n1
		printf"\nNo. of students having grade A   :  %d ",n2
		printf"\nNo. of students having grade B+  :  %d ",n3
		printf"\nNo. of students having grade B   :  %d ",n4
		printf"\nNo. of students having grade C   :  %d ",n5
		printf"\nNo. of students having grade D   :  %d ",n6
		printf"\nNo. of students having grade E   :  %d ",n7
		printf"\nNo. of students having grade F   :  %d\n---------------------------------------------------------\n\n",n8
		}' "printClassReport.ext"
