echo long text
sleep 1
printf "\033[1A"
printf "\033[3C"
printf "\033[K"
echo foo
