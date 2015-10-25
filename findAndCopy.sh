for a in *
do
	if [ ${a:0:1} = '[' ]
	then
#		echo "\nFilename starts with a \["
		a=${a/'['/'\['}
#		echo "Renamed to $a\n\n"
	fi
	cd "/run/media/safiyat/The Wierd Sisters/Music/Hindi"
	b=`find -name "$a"`
#	echo "$a"
#	echo "$b"
	cp "${b/mp3*/mp3}" /home/safiyat/Unzero/
	cd - > /dev/null

#	echo "->>>> $b"
#	echo "+>>>> ${b/mp3*/mp3}"
done
