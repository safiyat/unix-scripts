printf "\033[s"            # Save the cursor position

command="sudo cpupower monitor"

while [ true ]
do
    printf "\033[s"        # Save the cursor position
    # sudo cpupower monitor
    op=`command`
    # echo -e "TEST\n$op"
    printf "\033[u"        # Restore the cursor position
    printf "\033[J"
    printf "\033[s"

    sudo cpupower monitor
    sleep 1
done
