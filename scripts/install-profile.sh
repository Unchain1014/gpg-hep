#! /bin/bash
stty -echo
clear
sudo apt update
echo
echo "Checking for prerequisite packages..."
echo

if dpkg -l dconf-editor >/dev/null ; then 
    echo DCONF-EDITOR is already installed.
else
    sudo apt install dconf-editor
fi

dconf reset -f /org/gnome/terminal/legacy/profiles:/
dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < scripts/gpg-hep.dconf
echo
echo "GPG-HEP GNOME terminal profile has been installed."
echo
echo -e "\e[1;33mRESTART FOR CHANGES TO TAKE EFFECT \e[0m"
read -p 'Press enter to close terminal...' finish
clear
stty echo
exit 0

# Use the following commands to backup current profile
# dconf list /org/gnome/terminal/legacy/profiles:/
# dconf dump /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ > scripts/gpg-hep.dconf
