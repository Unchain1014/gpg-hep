#! /bin/bash
stty -echo
clear
/bin/bash -c "./scripts/logo.sh | lolcat"
echo -e "\e[1;37mGPG-HEP LAUNCHER v1-lc \e[0m"
echo
echo "P - Prerequisites"
echo "K - Key Generation"
echo "TE or TD - Text Encrypt/Decrypt"
echo "ME or MD - Media Encrypt/Decrypt"
echo "SM - Strip Metadata"
echo "T - Terminal Theme"
echo "F - Files"
echo "H - Help"
echo "E - Exit"
echo
stty echo
read -p "What would you like to do? " input
stty -echo
echo

# Switch on option
if [[ $input = "e" ]] || [[ $input = "E" ]] || [[ $input = "ex" ]] || [[ $input = "EX" ]] || [[ $input = "eX" ]] || [[ $input = "Ex" ]] || [[ $input = "et" ]] || [[ $input = "ET" ]] || [[ $input = "eT" ]] || [[ $input = "Et" ]] || [[ $input = "exit" ]] || [[ $input = "EXIT" ]] ; then
clear
stty echo
exit 0
else
    if [[ $input = "vh" ]] || [[ $input = "VH" ]] || [[ $input = "vH" ]] || [[ $input = "Vh" ]] || [[ $input = "hv" ]] || [[ $input = "HV" ]] || [[ $input = "hV" ]] || [[ $input = "Hv" ]] || [[ $input = "H" ]] || [[ $input = "h" ]] ; then
    stty -echo
    echo -e "\e[37mDisplaying readme file: \e[0m"
    echo
    cat readme
    echo
    echo -e "\e[1;37mEND OF README FILE \e[0m"
    paplay misc/beep.ogg
    read -p 'Press enter to clear terminal...' finish
    clear
    /bin/bash -c "./start.sh"
    exit 0
    else
        if [[ $input = "f" ]] || [[ $input = "F" ]] ; then
        stty -echo
        open /home/$USER/gpg-hep/files
        echo -e "\e[37mDirectory opened in new window. \e[0m"
        paplay misc/beep.ogg
        read -p 'Press enter to clear terminal...' finish
        clear
        /bin/bash -c "./start.sh"
        exit 0
        else
            if [[ $input = "sm" ]] || [[ $input = "SM" ]] || [[ $input = "sM" ]] || [[ $input = "Sm" ]] || [[ $input = "ms" ]] || [[ $input = "MS" ]] || [[ $input = "mS" ]] || [[ $input = "Ms" ]] ; then
            option="strip"
            else
                if [[ $input = "ip" ]] || [[ $input = "IP" ]] || [[ $input = "iP" ]] || [[ $input = "Ip" ]] || [[ $input = "pi" ]] || [[ $input = "PI" ]] || [[ $input = "pI" ]] || [[ $input = "Pi" ]] || [[ $input = "i" ]] || [[ $input = "I" ]] || [[ $input = "p" ]] || [[ $input = "P" ]] ; then
                option="prereq"
                else
                    if [[ $input = "kg" ]] || [[ $input = "KG" ]] || [[ $input = "kG" ]] || [[ $input = "Kg" ]] || [[ $input = "gk" ]] || [[ $input = "GK" ]] || [[ $input = "gK" ]] || [[ $input = "Gk" ]] || [[ $input = "k" ]] || [[ $input = "K" ]] || [[ $input = "g" ]] || [[ $input = "G" ]] ; then
                    option="kgen"
                    else
                        if [[ $input = "te" ]] || [[ $input = "TE" ]] || [[ $input = "tE" ]] || [[ $input = "Te" ]] || [[ $input = "et" ]] || [[ $input = "ET" ]] || [[ $input = "eT" ]] || [[ $input = "Et" ]] ; then
                        option="te"
                        else
                            if [[ $input = "td" ]] || [[ $input = "TD" ]] || [[ $input = "tD" ]] || [[ $input = "Td" ]] || [[ $input = "dt" ]] || [[ $input = "DT" ]] || [[ $input = "dT" ]] || [[ $input = "Dt" ]] ; then
                            option="td"
                            else
                                if [[ $input = "me" ]] || [[ $input = "ME" ]] || [[ $input = "mE" ]] || [[ $input = "Me" ]] || [[ $input = "em" ]] || [[ $input = "EM" ]] || [[ $input = "eM" ]] || [[ $input = "Em" ]] ; then
                                option="me"
                                else
                                    if [[ $input = "md" ]] || [[ $input = "MD" ]] || [[ $input = "mD" ]] || [[ $input = "Md" ]] || [[ $input = "dm" ]] || [[ $input = "DM" ]] || [[ $input = "dM" ]] || [[ $input = "Dm" ]] ; then
                                    option="md"
                                    else
                                        if [[ $input = "tt" ]] || [[ $input = "TT" ]] || [[ $input = "tT" ]] || [[ $input = "Tt" ]] || [[ $input = "t" ]] || [[ $input = "T" ]]; then
                                        option="install-profile"
                                        else
                                            option="null"
                                            failed="true"
                                            stty -echo
                                            echo -e "\e[31mOption was not recognized. \e[0m"
                                            echo -e "\e[31mPlease check letter code again. \e[0m"
                                            echo
                                        fi
                                    fi
                                fi
                            fi
                        fi
                    fi
               fi
            fi
        fi
    fi
fi

# If option was not null
if [[ $option != "null" ]] ; then
    # If unable to find script for entered option
    if [[ ! -f scripts/$option.sh ]] ; then
     stty -echo
     failed="true"
     echo -e "\e[31mCould not find associated script. \e[0m"
     echo -e "\e[31mPlease check directory order. \e[0m"
     echo
    else
     stty -echo
     # Actually launches the entered option    
     /bin/bash -c "./scripts/$option.sh"
     fi
fi

# If launching option failed for any reason
if [[ $failed = "true" ]] ; then
    stty -echo
    echo -e "\e[1;37mUNABLE TO LAUNCH OPTION \e[0m"
    paplay misc/error.ogg
    read -p 'Press enter to restart...' finish
    clear
    /bin/bash -c "./start.sh"
fi
