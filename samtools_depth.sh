for i in 01 02 03 04 05 06 07 08 09 10 11 12
do 
	#samtools depth BN0$i.sorted.bam >> BN0$i.depth.txt
	#samtools coverage -b BN0$i.sorted.bam -o BN0$i.coverage.txt
done
