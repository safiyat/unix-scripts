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

ifs=$IFS
IFS='
'

cur=0
prev=1

printf "\033[s"

while [ $cur != $prev ]
do
        waitForQ
	prev="cur"

	ios=`iostat -m`
	printf "\033[u"
        printf "\033[J"
	printf "\033[s"
        echo -n ${bold}
        date +%H:%M:%S
        echo -n ${normal}

	printf "$ios"

        waitForQ

	cur=""
	for i in $ios
	do
		k=$(echo $i | grep ^sd)
		if [ `echo $k | wc -w` -gt 0 ]
		then
			IFS=' '
			cur="$cur $(echo $k | cut -d \  -f 6)"
			IFS='
'
		fi
	done
done
echo
IFS=$ifs
