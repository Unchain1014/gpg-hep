#! /bin/bash
stty -echo
clear
sudo apt update
echo
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

if dpkg -l pulseaudio >/dev/null ; then 
    echo PULSEAUDIO is already installed.
else
    sudo apt install pulseaudio
fi

if dpkg -l lolcat >/dev/null ; then 
    echo LOLCAT is already installed.
else
    sudo apt install lolcat
fi

echo
/bin/bash -c "./scripts/exit.sh"
stty echo
exit 0
