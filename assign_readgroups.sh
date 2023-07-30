#!/bin/bash
RG_added='/home/salmatariq/exome_sequencing/Combined_strands/RG_added'
Temp='/home/salmatariq/exome_sequencing/Combined_strands/Temp'
mark_duplicates='/home/salmatariq/exome_sequencing/Combined_strands/mark_duplicates'
flowcell='HG7W7AFX2'
for i in {1..9}
do
samtools view $mark_duplicates/BN00$i.marked_duplicates.bam | grep 'HG7W7AFX2:1' | samtools view -S > $Temp/lane1.bam
samtools view $mark_duplicates/BN00$i.marked_duplicates.bam | grep 'HG7W7AFX2:2' | samtools view -S > $Temp/lane2.bam
samtools view $mark_duplicates/BN00$i.marked_duplicates.bam | grep 'HG7W7AFX2:3' | samtools view -S > $Temp/lane3.bam
samtools view $mark_duplicates/BN00$i.marked_duplicates.bam | grep 'HG7W7AFX2:4' | samtools view -S > $Temp/lane4.bam
	for j in {1..4}
	do
	picard AddOrReplaceReadGroups \
       	I=$Temp/lane$j.bam \
       	O=$Temp/output_lane$j.bam \
       	RGID=$flowcell.$j \
       	RGLB=lib1 \
       	RGPL=ILLUMINA \
       	RGPU=unit1 \
       	RGSM=20
	done
samtools merge $Temp/output_lane1.bam $Temp/output_lane2.bam $Temp/output_lane3.bam $Temp/output_lane4.bam -o $RG_added/BN00$i.output.bam
done
#picard AddOrReplaceReadGroups I= $mark_duplicates/BN00$i.marked_duplicates.bam O= $RG_added/BN00$i.output.bam RGID=4 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=20
