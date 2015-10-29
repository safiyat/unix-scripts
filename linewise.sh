IFS_bak=$IFS
filename=$1
IFS=$'\n'
for line in `cat $filename`
do
	#Anything here.
done

IFS=$IFS_bak
