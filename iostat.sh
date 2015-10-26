#!/usr/bin/env bash

bold=$(tput bold)
normal=$(tput sgr0)

function waitForQ
{
        read -n 1 -s -t 0.1 key
        if [[ $key == "q" ]]
        then
            break
        fi
}


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


while [ true ]
do
        waitForQ

	ios=`iostat -m`
        echo -n ${bold}
        date +%H:%M:%S
        echo -n ${normal}
        printf "\033[J"
	printf "$ios"
        lines=`printf "$ios" | wc -l`
        lines=`echo $lines + 1 | bc`
        printf "\033[s"
        waitForQ
        printf "\033["$lines"F"
        # read -n 1
done
printf "\033[u"
echo
