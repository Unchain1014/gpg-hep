#! /bin/bash
stty -echo
clear
cd ~/gpg-hep
/bin/bash -c "./scripts/prereq.sh"
stty echo
exit 0
