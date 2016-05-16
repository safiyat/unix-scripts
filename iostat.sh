#!/usr/bin/env bash

bold=$(tput bold)
normal=$(tput sgr0)

# Provide the `q` action like in less.
function waitForQ
{
    read -n 1 -s -t 0.1 key   # read a single character, with timeout
    if [[ $key == "q" ]]
    then
        break
    fi
}

# If iostat is not available...
if [ "`command -v iostat`" == "" ]
then
    echo "${bold}sysstat${normal} not installed. Installing it..."
    if [ -f "/etc/debian_version" ]
    then
    #for ubuntu
        sudo apt-get -y install sysstat
    elif [ -f "/etc/redhat-release" ]
    then
    #for fedora
        sudo dnf -y install sysstat
    else
        echo "Suitable linux distro not found. Exiting..."
        exit
    fi
fi

stty -echo
while [ true ]
do
    ios=$(iostat -md)               # Run the command.
    text=$(printf "$ios" | tail -n+3)
    echo -n ${bold}                 # Enable bold.
    date +%H:%M:%S
    echo -n ${normal}               # Disable bold.
    printf "\033[J"                 # Clear till the end of screen.
    printf "$text"                  # Echo the whole output.
    lines=$(expr `printf "$text" | wc -l` + 1) # Calculate the lines of output.
    waitForQ
    printf "\033["$lines"F"         # Time to go back.
done
stty echo
echo
