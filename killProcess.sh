clear
echo "This program kill a process by its name"

ps -e | awk     'BEGIN{
			printf "\nEnter Process Name : "
			getline processName < "/dev/tty"
		  }	
			$4==processName{
				  id=$1
			}
		  END { 
          if(id==0) {
			        printf "Invalid process name.\n\n"
          }
		      else { 
                system("kill " id)
			          printf "Process \"%s\" has been killed.\n",pn 
          }
		  }'
