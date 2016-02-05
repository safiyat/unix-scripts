#!/usr/bin/env bash

IFS_BAK=$IFS

function waitForQ
{
    if [ -z $1 ]
    then
        TIMEOUT=1
    else
        TIMEOUT=$1
    fi

    read -n 1 -s -t $TIMEOUT KEY   # read a single character, with timeout

    if [[ $KEY == "q" ]]
    then
        break
    fi
}

if [ $# -lt 1 ]
then
    echo "Usage: $0 INPUT_FILENAME OUTPUT_FILENAME wait_time_in_seconds"
    exit
fi

if [ $1 == "--help" ]
then
    echo "Usage: $0 INPUT_FILENAME OUTPUT_FILENAME wait_time_in_seconds"
    exit
fi

INPUT_FILENAME=$1

if [ -n "$2" ]
then
    OUTPUT_FILENAME=$2
else
    exit 1
fi

echo -e "IP: " $INPUT_FILENAME "\t" "OP: " $OUTPUT_FILENAME "\t" "WAIT: " $3

IFS=$'\n'
COUNT=0
echo -n "Logs pushed: "
printf "\033[s"

for line in `cat $INPUT_FILENAME`
do
        COUNT=`echo $COUNT+1|bc`
        echo -n "$COUNT"
	waitForQ $3
        printf "\033[u"
        printf "\033[J"
done
echo

IFS=$IFS_BAK
