for i in 01 02 03 04 05 06 07 08 09 10 11 12
do
	samtools depth -a BN0$i.sorted.bam | awk '{c++;s+=$3}END{print s/c}'
	samtools depth -a BN0$i.sorted.bam | awk '{c++; if($3>0) total+=1}END{print (total/c)*100}'
done
