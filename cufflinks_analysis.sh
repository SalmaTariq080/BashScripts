#!/bin/bash
#final sample files for the first batch are in the folder combined_strands
fastq_path='/mnt/RNAseq-samples/Combined_strands'
align_path='/mnt/RNAseq-samples/Alignment'
#final sample files for the second batch are in the folder batch2_raw_fastq
rem_files='/mnt/RNAseq-samples/2nd_batch/batch2_raw_fastq'
ref_path='/home/salmatariq/hisat_reference/grch38_genome/grch38/genome'
annotation_path='/mnt/RNAseq-samples/hisat_reference/annotation'
assemble_path='/mnt/RNAseq-samples/assemble_transcript'
ballgown1_path='/mnt/RNAseq-samples/Ballgown1'
ballgown2_path='/mnt/RNAseq-samples/Ballgown2'
ballgown3_path='/mnt/RNAseq-samples/Ballgown3'

TRIMM_PA='/mnt/RNAseq-samples/assemble_transcript/TRIMMO_RESULTS/paired_batch2'
TRIMM_UP='/mnt/RNAseq-samples/assemble_transcript/TRIMMO_RESULTS/unpaired_batch2'
After_TGlore1='/mnt/RNAseq-samples/assemble_transcript/trim_galore_batch1/fastq_after_TrGl'
After_TGlore2='/mnt/RNAseq-samples/assemble_transcript/trim_galore_batch2/fastq_after_trGa'
Adapter_batch1='/mnt/RNAseq-samples/Combined_strands/adapters_batch1.fa'
Adapter_batch2='/mnt/RNAseq-samples/2nd_batch/adapters.fa'
TRIMM_PA1='/mnt/RNAseq-samples/assemble_transcript/TRIMMO_RESULTS/paired_batch1'
TRIMM_UP1='/mnt/RNAseq-samples/assemble_transcript/TRIMMO_RESULTS/unpaired_batch1'
AlIG_PATH_2='/mnt/RNAseq-samples/assemble_transcript/batch2_alignment'
ASSEM_PATH_2='/mnt/RNAseq-samples/assembl_transcrpt_2'
#Cufflink_input='/mnt/RNAseq-samples/Cufflink_input'
Cufflink_input='/mnt/RNAseq-samples/Cufflink_input/Align_Files'
Cufflink_output='/mnt/RNAseq-samples/Cufflink_output'
Cufflink_output_2='/mnt/RNAseq-samples/Cufflink_output2'
ALL='/mnt/RNAseq-samples/Cufflink_output2/ALL_Samples'


#for i in {1..9}
#do
	#hisat2 -p 8 --dta-cufflinks -x $ref_path -1 $After_TGlore1/AS00$i\_R1_val_1.fq.gz -2 $After_TGlore1/AS00$i\_R2_val_2.fq.gz --summary-file $Cufflink_input/AS00$i.txt | samtools sort -@ 8 -o $Cufflink_input/AS00$i.bam
#	cufflinks -p 8 -o $Cufflink_output_2/AS00$i $Cufflink_input/AS00$i.bam -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf
#done
#for i in {10..12}
#do
        #hisat2 -p 8 --dta-cufflinks -x $ref_path -1 $After_TGlore1/AS0$i\_R1_val_1.fq.gz -2 $After_TGlore1/AS0$i\_R2_val_2.fq.gz --summary-file $Cufflink_input/AS0$i.txt | samtools sort -@ 8 -o $Cufflink_input/AS0$i.bam
 #       cufflinks -p 8 -o $Cufflink_output_2/AS0$i $Cufflink_input/AS0$i.bam -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf
#done
#for i in {13..20}
#do
        #hisat2 -p 8 --dta-cufflinks -x $ref_path -1 $After_TGlore2/AS0$i\_R1_val_1.fq.gz -2 $After_TGlore2/AS0$i\_R2_val_2.fq.gz --summary-file $Cufflink_input/AS0$i.txt | samtools sort -@ 8 -o $Cufflink_input/AS0$i.bam
	#cufflinks -p 8 -o $Cufflink_output_2/AS0$i $Cufflink_input/AS0$i.bam -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf
#done
#for i in 10 13 15 16
#do
#	cufflinks -p 8 -o $Cufflink_output_2/AS0$i $Cufflink_input/AS0$i.bam -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf
#done
#for i in 06 07 17 18 10 15
#do
#	cufflinks -p 8 -o $Cufflink_output_2/AS0$i $Cufflink_input/AS0$i.bam -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf
#done
#for i in 01 02 03 08 09 11 12 19 20 10 15
#do
#	cufflinks -p 8 -o $Cufflink_output_2/AS0$i $Cufflink_input/AS0$i.bam -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf
#done
#for i in 04 05 14 19
#do
 #       cufflinks -p 8 -o $Cufflink_output_2/AS0$i $Cufflink_input/AS0$i.bam -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf
#done
#####################################################################Group1######################################################################################################
#python /usr/bin/cuffmerge -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -s /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 $Cufflink_output_2/TP_Control.txt
#cuffdiff -o diff_out -b /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 --labels C1,C2 -u $Cufflink_output_2/TP_Control/merged.gtf \
#$Cufflink_input/AS013.bam,$Cufflink_input/AS016.bam $Cufflink_input/AS010.bam,$Cufflink_input/AS015.bam --output-dir $Cufflink_output_2/TP_Control/
####################################################################Group2#########################################################################################################
#python /usr/bin/cuffmerge -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -s /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 $Cufflink_output_2/ER_PR_HG_Control.txt
#cuffdiff -o diff_out -b /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 --labels C1,C2 -u $Cufflink_output_2/ER_PR_HG_Control/merged.gtf \
#$Cufflink_input/AS006.bam,$Cufflink_input/AS007.bam,$Cufflink_input/AS017.bam,$Cufflink_input/AS018.bam $Cufflink_input/AS010.bam,$Cufflink_input/AS015.bam --output-dir $Cufflink_output_2/ER_PR_HG_Control/
####################################################################Group3#########################################################################################################
#as cuffmerge is a python script so was unable to run this script on python in conda so running this script on python the other version on pc by deactivating anaconda
#python /usr/bin/cuffmerge -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -s /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 $Cufflink_output_2/ER_PR_LG_Control.txt
#cuffdiff -o diff_out -b /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 --labels C1,C2 -u /mnt/RNAseq-samples/Cufflink_output2/ER_PR_LG_Control/merged.gtf \
#$Cufflink_input/AS001.bam,$Cufflink_input/AS002.bam,$Cufflink_input/AS003.bam,$Cufflink_input/AS008.bam,$Cufflink_input/AS009.bam,$Cufflink_input/AS011.bam,$Cufflink_input/AS012.bam,\
#$Cufflink_input/AS019.bam,$Cufflink_input/AS020.bam $Cufflink_input/AS010.bam,$Cufflink_input/AS015.bam --output-dir $Cufflink_output_2/ER_PR_LG_Control/
######################################################################################################################################################################################
#for i in {1..9}
#do
 #      cufflinks -p 11 -o $Cufflink_output_2/AS00$i $Cufflink_input/AS00$i.bam -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf --no-update-check
#done
#cufflinks -p 11 -o $Cufflink_output_2/AS014 $Cufflink_input/AS014.bam -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf --no-update-check
#cufflinks -p 11 -o $Cufflink_output_2/AS017 $Cufflink_input/AS017.bam -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf --no-update-check
#for i in {18..20}
#do
#       cufflinks -p 11 -o $Cufflink_output_2/AS0$i $Cufflink_input/AS0$i.bam -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf --no-update-check
#done

#python /usr/bin/cuffmerge -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -s /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 11 $Cufflink_output_2/ALL_samples.txt --verbose
#cuffdiff -o diff_out -b /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 --labels C1,C2 -u /mnt/RNAseq-samples/Cufflink_output2/ALL_Samples/merged.gtf \
#$Cufflink_input/AS001.bam,$Cufflink_input/AS002.bam,$Cufflink_input/AS003.bam,$Cufflink_input/AS004.bam,$Cufflink_input/AS005.bam,$Cufflink_input/AS006.bam,$Cufflink_input/AS007.bam,$Cufflink_input/AS008.bam,$Cufflink_input/AS009.bam,$Cufflink_input/AS011.bam,$Cufflink_input/AS012.bam,$Cufflink_input/AS013.bam,$Cufflink_input/AS014.bam,$Cufflink_input/AS016.bam,$Cufflink_input/AS017.bam,$Cufflink_input/AS018.bam,$Cufflink_input/AS019.bam,$Cufflink_input/AS020.bam $Cufflink_input/AS010.bam,$Cufflink_input/AS015.bam --output-dir $Cufflink_output_2/ALL_Samples/
#cuffquant -p 10 /mnt/RNAseq-samples/Cufflink_output2/ALL_Samples/merged.gtf $Cufflink_input/AS001.bam,$Cufflink_input/AS002.bam,$Cufflink_input/AS003.bam,$Cufflink_input/AS004.bam,$Cufflink_input/AS005.bam,$Cufflink_input/AS006.bam,$Cufflink_input/AS007.bam,$Cufflink_input/AS008.bam,$Cufflink_input/AS009.bam,$Cufflink_input/AS011.bam,$Cufflink_input/AS012.bam,$Cufflink_input/AS013.bam,$Cufflink_input/AS014.bam,$Cufflink_input/AS016.bam,$Cufflink_input/AS017.bam,$Cufflink_input/AS018.bam,$Cufflink_input/AS019.bam,$Cufflink_input/AS020.bam
#for i in {1..9}
#do
 #       cuffquant -p 11 /mnt/RNAseq-samples/Cufflink_output2/ALL_Samples/merged.gtf $Cufflink_input/AS00$i.bam --no-update-check
 #       mv abundances.cxb AS00$i.cxb
#done
#for i in 10 15
#do
#	cuffquant -p 10 /mnt/RNAseq-samples/Cufflink_output2/ALL_Samples/merged.gtf $Cufflink_input/AS0$i.bam
#	mv abundances.cxb AS0$i.cxb
#done
#for i in {10..20}
#do 
#	cuffquant -p 11 /mnt/RNAseq-samples/Cufflink_output2/ALL_Samples/merged.gtf $Cufflink_input/Align_Files/AS0$i.bam --no-update-check
#       mv abundances.cxb AS0$i.cxb
#done
cuffdiff -o diff_out -b /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 11 --labels C1,C2 -u $Cufflink_output_2/TP_Control/merged.gtf \
$Cufflink_input/AS010.bam,$Cufflink_input/AS015.bam $Cufflink_input/AS013.bam,$Cufflink_input/AS016.bam --output-dir $Cufflink_output_2/TP_Control/
cuffdiff -o diff_out -b /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 11 --labels C1,C2 -u $Cufflink_output_2/ER_PR_LG_Control/merged.gtf  \
$Cufflink_input/AS010.bam,$Cufflink_input/AS015.bam $Cufflink_input/AS001.bam,$Cufflink_input/AS002.bam,$Cufflink_input/AS003.bam,$Cufflink_input/AS008.bam,$Cufflink_input/AS009.bam,$Cufflink_input/AS011.bam,$Cufflink_input/AS012.bam,$Cufflink_input/AS019.bam,$Cufflink_input/AS020.bam --output-dir $Cufflink_output_2/ER_PR_LG_Control/
cuffdiff -o diff_out -b /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 11 --labels C1,C2 -u $Cufflink_output_2/ER_PR_HG_Control/merged.gtf \
$Cufflink_input/AS010.bam,$Cufflink_input/AS015.bam $Cufflink_input/AS006.bam,$Cufflink_input/AS007.bam,$Cufflink_input/AS017.bam,$Cufflink_input/AS018.bam --output-dir $Cufflink_output_2/ER_PR_HG_Control/

#Cuffdiff -o diff_out -p 11 -b /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa --labels C1,C2 -u /mnt/RNAseq-samples/Cufflink_output2/ALL_Samples/merged.gtf $ALL/AS001/AS001.cxb,$ALL/AS002/AS002.cxb,$ALL/AS003/AS003.cxb,$ALL/AS004/AS004.cxb,$ALL/AS005/AS005.cxb,$ALL/AS006/AS006.cxb,$ALL/AS007/AS007.cxb,$ALL/AS008/AS008.cxb,$ALL/AS009/AS009.cxb,$ALL/AS011/AS011.cxb,$ALL/AS012/AS012.cxb,$ALL/AS013/AS013.cxb,$ALL/AS014/AS014.cxb,$ALL/AS016/AS016.cxb,$ALL/AS017/AS017.cxb,$ALL/AS018/AS018.cxb,$ALL/AS019/AS019.cxb,$ALL/AS020/AS020.cxb $ALL/AS010/AS010.cxb,$ALL/AS015/AS015.cxb --no-update-check 
