awk -F " " '{print $1}' /home/salmatariq/Downloads/enumeration_chrysophanol.smi  > enumeration_chrysophanol.csv
i=1
while read line
do
a=$line
b=chrysophanol_$i
echo $a,$b >> enumeration_chrysophanol_1.csv 
let "i+=1"
done < <(tail -n +1 enumeration_chrysophanol.csv)
