# ifs=$IFS
# IFS='
# '

# cur=0
# prev=1

# printf "\033[s"

# while [[ $cur != $prev ]]
# do
# 	prev="cur"
# 	sleep 1
# 	ios="cpupower monitor"
# 	printf "\033[u"
#       printf "\033[J"
# 	printf "\033[s"
# 	printf "`$ios`"
# 	cur=""
# 	for i in $ios
# 	do
# 	    IFS=' '
# 	    cur="$cur $(echo $k | cut -d \  -f 6)"
# 	    IFS='
# '
# 	done
# done
# echo
# IFS=$ifs

printf "\033[s"

while [ true ]
do
    sudo cpupower monitor
    printf "\033[u"
    printf "\033[J"
    printf "\033[s"

    sudo cpupower monitor
    sleep 1
done
