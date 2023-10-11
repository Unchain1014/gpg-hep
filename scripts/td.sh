#! /bin/bash
stty -echo
encryption="Twofish"
clear
/bin/bash -c "./scripts/logo.sh | lolcat"
echo -e "\e[1;37mTEXT DECRYPTION SCRIPT STARTED \e[0m"
echo "GPG-HEP is configured to use $encryption encryption."
echo
echo -e "\e[37mEnter target file name (with extension): \e[0m"
stty echo
read filename
stty -echo

if [[ ! -f files/$filename ]]
then
 echo
 echo -e "\e[31mTarget file not found. \e[0m"
 echo -e "\e[31mBe sure to include extension. \e[0m"
 paplay misc/error.ogg
 echo
 /bin/bash -c "./scripts/exit-error.sh"
 stty echo
 exit 0
fi

echo
echo -e "\e[37mEnter name of shared key file (with extension): \e[0m"
stty echo
read key_filename
stty -echo
echo
echo -e "\e[37mEnter shared password for key file: \e[0m"
gpg -d --quiet --no-symkey-cache files/$key_filename || { paplay misc/error.ogg ; echo ; /bin/bash -c "./scripts/exit-error.sh" ; exit 1 ; }
echo
echo -e "\e[37mCopy shared key for the next step (Triple Click, Ctrl + Shift + C). \e[0m"
echo -e "You will not get another chance to copy the key before being prompted!"
read -p 'Press enter to continue...' continue
echo
echo
echo -e "\e[37mEnter shared key to decrypt file: \e[0m"
message=$(gpg -d --quiet --no-symkey-cache files/$filename) || { paplay misc/error.ogg ; echo ; /bin/bash -c "./scripts/exit-error.sh" ; exit 1 ; }
echo -e "\e[32mTarget file decrypted. \e[0m"
echo
echo -e "\e[37mDisplaying file contents: \e[0m"
paplay misc/chime.ogg 
echo -e "\e[1;33m$message \e[0m"
echo
stty echo
read -p 'Do you want to delete this message file? (y/N) ' delete
stty -echo
if [[ $delete = "y" ]] || [[ $delete = "Y" ]]
then
 shred files/$filename
 rm -f files/$filename
 echo -e "\e[32mTarget file deleted. \e[0m"
 echo
 /bin/bash -c "./scripts/exit.sh"
 stty echo
 exit 0
else
 echo
 /bin/bash -c "./scripts/exit.sh"
 stty echo
 exit 0
fi
