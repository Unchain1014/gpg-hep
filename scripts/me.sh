#! /bin/bash
stty -echo
encryption="Twofish"
clear
/bin/bash -c "./scripts/logo.sh | lolcat"
echo -e "\e[1;37mMEDIA ENCRYPTION SCRIPT STARTED \e[0m"
echo "GPG-HEP is configured to use $encryption encryption."
echo
echo -e "\e[37mEnter target file name (with extension): \e[0m"
stty echo
read target_filename
stty -echo

if [ ! -f files/$target_filename ]
then
 echo
 echo -e "\e[31mTarget file not found. \e[0m"
 echo
 /bin/bash -c "./scripts/exit-error.sh"
 stty echo
 exit 0
fi

if [ -f files/$target_filename.gpg ]
then
 echo
 echo -e "\e[33mThis will overwrite an existing file! \e[0m"
 stty echo
 read -p 'Do you wish to continue? (y/N) ' continue1
 stty -echo
 if [[ $continue1 != "y" ]] && [[ $continue1 != "Y" ]]
 then
  echo
  /bin/bash -c "./scripts/exit-cancel.sh"
  stty echo
  exit 0
 fi
fi

echo
stty echo
read -p 'Do you want to strip this file of metadata? (y/N) ' strip
stty -echo
if [[ $strip = "y" ]] || [[ $strip = "Y" ]]
then
 echo "Stripping metadata from target file..."
 exiftool -quiet -all= files/$target_filename || { echo ; /bin/bash -c "./scripts/exit-error.sh" ; exit 1 ; }
 shred files/"${target_filename}_original"
 rm -f files/"${target_filename}_original"
 echo -e "\e[32mStripped all metadata. \e[0m"
fi

echo
echo -e "\e[37mEnter name of shared key file (with extension): \e[0m"
stty echo
read key_filename
stty -echo
echo
echo -e "\e[37mEnter shared password for key file: \e[0m"
gpg -d --quiet --no-symkey-cache files/$key_filename || { echo ; /bin/bash -c "./scripts/exit-error.sh" ; exit 1 ; }
echo
echo -e "\e[37mCopy shared key for the next step (Triple Click, Ctrl + Shift + C). \e[0m"
echo -e "You will not get another chance to copy the key before being prompted!"
read -p 'Press enter to continue...' continue2
echo
echo
echo -e "\e[37mEnter shared key for encryption: \e[0m"
gpg --batch --yes -c --cipher-algo $encryption --quiet --no-symkey-cache files/$target_filename || { echo ; /bin/bash -c "./scripts/exit-error.sh" ; exit 1 ; }
echo -e "\e[32mEncrypted file with shared key. \e[0m"
echo
stty echo
read -p 'Do you want to delete the original file? (y/N) ' delete
stty -echo
if [[ $delete = "y" ]] || [[ $delete = "Y" ]]
then
 shred files/$target_filename
 echo -e "\e[32mOriginal file shredded. \e[0m"
 rm -f files/$target_filename
 echo -e "\e[32mOriginal file deleted. \e[0m"
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
