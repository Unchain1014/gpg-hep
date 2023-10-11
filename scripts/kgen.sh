#! /bin/bash
stty -echo
encryption="Twofish"
clear
/bin/bash -c "./scripts/logo.sh | lolcat"
echo -e "\e[1;37mKEY GENERATION SCRIPT STARTED \e[0m"
echo "GPG-HEP is configured to use $encryption encryption."
echo
echo -e "\e[37mEnter a name for your key file (without extension): \e[0m"
stty echo
read key_filename
stty -echo

if [[ -f files/$key_filename.gpg ]]
then
 echo
 echo -e "\e[33mThis will overwrite an existing key file! \e[0m"
 paplay misc/warn.ogg
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

key=$(< /dev/urandom tr -dc 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-=`[];,./\~!@#$%^&*()_+{}|:"<>?' | head -c${1:-250};)
echo "$key" > files/$key_filename
echo
echo -e "\e[37mCreate a shared password for your key file. \e[0m"
echo "You must share this password with the recipient of the key."
read -p 'Press enter to continue...' continue2
echo
echo
echo -e "\e[37mEnter shared password for your key file: \e[0m"
gpg --batch --yes -c --cipher-algo $encryption --quiet --no-symkey-cache files/$key_filename || { shred files/$key_filename ; rm -f files/$key_filename ; paplay misc/error.ogg ; echo ; /bin/bash -c "./scripts/exit-cancel.sh" ; exit 1 ; }
echo -e "\e[32mEncrypted key file with shared password. \e[0m"
shred files/$key_filename
rm -f files/$key_filename
echo -e "\e[32mRaw key deleted. \e[0m"
echo
/bin/bash -c "./scripts/exit.sh"
stty echo
exit 0
