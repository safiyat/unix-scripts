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
if [ "`which iostat`" == "" ]
then
    echo "${bold}sysstat${normal} not installed. Installing it..."
    if [ -f "/etc/debian_version" ]
    then
    #for ubuntu
        sudo apt-get -y install sysstat
    elif [ -f "/etc/redhat-release" ]
    then
    #for fedora
        sudo yum -y install sysstat
    else
        echo "Suitable linux distro not found. Exiting..."
        exit
    fi
fi

stty -echo
while [ true ]
do
    ios=`iostat -m`                 # Run the command.
    echo -n ${bold}                 # Enable bold.
    date +%H:%M:%S
    echo -n ${normal}               # Disable bold.
    printf "\033[J"                 # Clear till the end of screen.
    printf "$ios"                   # Echo the whole output.
    lines=`printf "$ios" | wc -l`   # Calculate the lines of output.
    lines=`echo $lines + 1 | bc`    # Comensate for timestamp output.
    waitForQ
    printf "\033["$lines"F"         # Time to go back.
done
stty echo
echo
