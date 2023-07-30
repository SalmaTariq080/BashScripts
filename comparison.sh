#!/bin/bash
GrCh38_p13="/mnt/Known_sites/GCF_000001405.39"
AN_ID="/mnt/Known_sites/names_ids.txt"
while read line 
do
	var1=$(echo $line | cut -d " " -f1)
	echo $var1
	var2=$(echo $line | cut -d " " -f2)
	echo $var2
        sed --quiet 's/'"$var1"'/'"$var2"'/gp' $GrCh38_p13 >> GCF_000001405.39_CA
done< <(tail -n +1 $AN_ID)

