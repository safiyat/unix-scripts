IFS_bak=$IFS

function waitForQ
{
    read -n 1 -s -t 0.1 key   # read a single character, with timeout
    if [[ $key == "q" ]]
    then
        break
    fi
}

filename=$1
IFS=$'\n'
for line in `cat $filename`
do
	#Anything here.
	waitForQ
done

IFS=$IFS_bak
