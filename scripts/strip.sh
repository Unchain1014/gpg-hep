#! /bin/bash
stty -echo
clear
/bin/bash -c "./scripts/logo.sh | lolcat"
echo -e "\e[1;37mMETADATA STRIPPING SCRIPT STARTED \e[0m"
echo "GPG-HEP uses EXIFTOOL to strip metadata."
echo
echo -e "\e[37mEnter target file name (with extension): \e[0m"
stty echo
read target_filename
stty -echo

if [[ ! -f files/$target_filename ]]
then
 echo
 echo -e "\e[31mTarget file not found. \e[0m"
 paplay misc/error.ogg
 echo
 /bin/bash -c "./scripts/exit-error.sh"
 stty echo
 exit 0
fi

echo
stty echo
read -p 'Are you sure you want to strip this file? (y/N) ' strip
stty -echo
if [[ $strip = "y" ]] || [[ $strip = "Y" ]] ; then
    echo "Stripping metadata from target file..."
    exiftool -quiet -all= files/$target_filename || { paplay misc/error.ogg ; echo ; /bin/bash -c "./scripts/exit-error.sh" ; exit 1 ; }
    shred files/"${target_filename}_original"
    echo -e "\e[32mStripped all shredded. \e[0m"
    rm -f files/"${target_filename}_original"
    echo -e "\e[32mStripped all metadata. \e[0m"
else
    if [[ $strip = "n" ]] || [[ $strip = "N" ]] ; then
    echo
    /bin/bash -c "./scripts/exit-cancel.sh"
    stty echo
    exit 0
    fi
fi

echo
/bin/bash -c "./scripts/exit.sh"
stty echo
exit 0

