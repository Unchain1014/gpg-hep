#! /bin/bash
stty -echo
echo -e "\e[1;37mOPERATION FAILED \e[0m"
paplay misc/beep.ogg
read -p 'Press enter to clear terminal...' finish
clear
/bin/bash -c "./start.sh"
stty echo
exit 0


   
   
  

