#!/usr/bin/env bash


#
#
# read -n 1 -s
#
#


bold=$(tput bold)
normal=$(tput sgr0)

if [ "`which iostat`" == "" ]
then
    echo "${bold}sysstat${normal} not installed. Installing it..."
    if [ -f "/etc/debian_version" ]
    then
    #for ubuntu
        sudo apt-get -y install sysstat
    elif [ -f "/etc/redhat-release" ]
    #for fedora
    then
        sudo yum -y install sysstat
    else
        echo "Suitable linux distro not found. Exiting..."
        exit
    fi
fi

ifs=$IFS
IFS='
'

count=0

cur=0
prev=1

printf "\033[s"

while [ $cur != $prev ]
do
	prev="cur"
        sleep 1
	ios=`iostat -m`
	printf "\033[u"
        printf "\033[J"
	printf "\033[s"
        date +%_H:%_M:%_S
	printf "$ios"


#        key=""
#        timeout 3s read -n1 -s key
#        count=`echo $count + 1 | bc`
#        echo "$count $key"


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
