#! /bin/bash
stty -echo
clear
echo "Checking for prerequisite packages..."
echo
if dpkg -l gpg >/dev/null ; then 
    echo GPG is already installed.
else
    sudo apt install gpg
fi
if dpkg -l exiftool >/dev/null ; then 
    echo EXIFTOOL is already installed.
else
    sudo apt install exiftool
fi
echo
echo -e "\e[1;37mPREREQUISITES READY \e[0m"
read -p 'Press enter to start launcher...' finish
clear
cd ~/gpg-hep
/bin/bash -c "./scripts/launcher.sh"
stty echo
exit 0
