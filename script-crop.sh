for a in `ls *.png`
do
	if [ -f "$a" ]
	then
		cp "$a" image.png
		python ~/Desktop/crop.py
		mv cropped.png "$a"
	fi
done
read a
rm image.png
