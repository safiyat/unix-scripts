ifs=$IFS
IFS='
'

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
	printf "$ios"
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
