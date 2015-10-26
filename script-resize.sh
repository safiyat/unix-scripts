cd resized

for a in *
do
	if [ -d $a ]
	then
		cd $a
		mkdir thumbs
		i=1
		for b in `ls`
		do
			echo processing $b in $a
			if [ -f $b ]
			then
				echo processing $b in $a
				mv $b $a-$i.jpg
				b=$a-$i.jpg
				cp $b image.jpg
				python ~/Desktop/resize.py
				mv resized.jpg ./thumbs/$b
				i=`echo $i + 1 | bc`
			fi
		done
		rm image.jpg
		cd ..
	fi
done
