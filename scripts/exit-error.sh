#! /bin/bash
stty -echo
echo -e "\e[1;37mOPERATION FAILED \e[0m"
read -p 'Press enter to clear terminal...' finish
clear
/bin/bash -c "./scripts/launcher.sh"
stty echo
exit 0


   
   
  

