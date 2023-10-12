#! /bin/bash
stty -echo
encryption="Twofish"
clear
/bin/bash -c "./scripts/logo.sh"
echo -e "\e[1;37mTEXT ENCRYPTION SCRIPT STARTED \e[0m"
echo "GPG-HEP is configured to use $encryption encryption."
echo
echo -e "\e[37mCreate a file name (without extension): \e[0m"
stty echo
read filename
stty -echo

if [[ -f files/$filename.gpg ]]
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
echo -e "\e[37mEnter your message: \e[0m"
stty echo
read message
stty -echo
echo
echo "$message" > files/$filename
echo -e "\e[37mEnter name of shared key file (with extension): \e[0m"
stty echo
read key_filename
stty -echo
echo
echo -e "\e[37mEnter shared password for key file: \e[0m"
gpg -d --quiet --no-symkey-cache files/$key_filename || { shred files/$filename ; rm -f files/$filename ; echo ; /bin/bash -c "./scripts/exit-error.sh" ; exit 1 ; }
echo
echo -e "\e[37mCopy shared key for the next step (Triple Click, Ctrl + Shift + C). \e[0m"
echo -e "You will not get another chance to copy the key before being prompted!"
read -p 'Press enter to continue...' continue2
echo
echo
echo -e "\e[37mEnter shared key for encryption: \e[0m"
gpg --batch --yes -c --cipher-algo $encryption --quiet --no-symkey-cache files/$filename || { shred files/$filename ; rm -f files/$filename ; echo ; /files/bash -c "./scripts/exit-cancel.sh" ; exit 1 ; }
echo -e "\e[32mEncrypted message with shared key. \e[0m"
shred files/$filename
echo -e "\e[32mRaw message data shredded. \e[0m"
rm -f files/$filename
echo -e "\e[32mRaw message data deleted. \e[0m"
echo
/bin/bash -c "./scripts/exit.sh"
stty echo
exit 0
