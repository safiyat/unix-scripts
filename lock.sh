test1="The screensaver is inactive"
test2=`gnome-screensaver-command -q`
echo HealthPack deployed.
while [ $# -gt 0 ]
do
	echo -n Here at
	date
	sleep 10
	echo -n Logging out at 
	date
	gnome-screensaver-command -l
	i=`$test2 = $test1`
	while [ i -ne 0 ]
	do
		i=`test $test2 = $test1`
		echo Locked
	done
done
