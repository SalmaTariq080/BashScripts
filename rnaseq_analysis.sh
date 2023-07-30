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
ASSEM_PATH_4='/mnt/RNAseq-samples/AssemblTranscrpt4'
Cufflink_input='/mnt/RNAseq-samples/Cufflink_input'
Cufflink_output='/mnt/RNAseq-samples/Cufflink_output'

#stringtie --merge -p 8 -G /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -o $ASSEM_PATH_2/all_MP_Control.gtf $ASSEM_PATH_2/all_MP_Control.txt
#stringtie --merge -p 8 -G /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -o ER_PR_HG_Control.gtf ER_PR_HG_Control.txt
#stringtie --merge -p 8 -G /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -o TP_Control.gtf TP_Control.txt
#stringtie --merge -p 8 -G /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -o ER_PR_LG_Control.gtf ER_PR_LG_Control.txt
#stringtie --merge -p 8 -G $annotation_path/Homo_sapiens.GRCh38.104.gtf -o ctrl_HGrade_merged.gtf $assemble_path/Ctrl_HGrade.txt
#stringtie --merge -p 8 -G $annotation_path/Homo_sapiens.GRCh38.104.gtf -o ctrl_GradeII_all_merged.gtf $assemble_path/Ctrl_GradeII_all.txt
#stringtie --merge -p 8 -G /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -o ER_PR_HG_Control.gtf ER_PR_HG_Control.txt
stringtie --merge -p 11 -G /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -o $ASSEM_PATH_4/group1.gtf $ASSEM_PATH_4/group1.txt
stringtie --merge -p 11 -G /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -o $ASSEM_PATH_4/group2.gtf $ASSEM_PATH_4/group2.txt
stringtie --merge -p 11 -G /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -o $ASSEM_PATH_4/group3.gtf $ASSEM_PATH_4/group3.txt
#trim_galore --phred33 --fastqc --length 36 --illumina -j 4 --paired $TRIMM_PA/AS013\_R1.fastq.gz $TRIMM_PA/AS013\_R2.fastq.gz
#for i in {1..9}
#do
#fastqc for raw fastq files
	#fastqc $TRIMM_PA1/AS0$i\_R1.fastq.gz $TRIMM_PA1/AS0$i\_R2.fastq.gz

	#trimming the adapters
	#trimmomatic PE -threads 11 -phred33 -trimlog trimLogFile.txt \
	#$fastq_path/AS0$i\_R1.fastq.gz $fastq_path/AS0$i\_R2.fastq.gz \
	#$TRIMM_PA1/AS0$i\_R1.fastq.gz $TRIMM_UP1/AS0$i\_R1_UP.fastq.gz \
	#$TRIMM_PA1/AS0$i\_R2.fastq.gz $TRIMM_UP1/AS0$i\_R2_UP.fastq.gz \
	#ILLUMINACLIP:/mnt/RNAseq-samples/Combined_strands/adapters_batch1.fa:2:30:10 \
	#LEADING:5 TRAILING:5 SLIDINGWINDOW:4:15 MINLEN:35
        
        #fastqc after trimming adapters using trimmomatic 
        #fastqc $TRIMM_PA/AS0$i\_R1.fastq.gz $TRIMM_PA/AS0$i\_R2.fastq.gz
        #hisat2 -p 8 --dta -x $ref_path -1 $After_TGlore1/AS002\_R1_val_1.fq.gz -2 $After_TGlore1/AS002\_R2_val_2.fq.gz --summary-file Alignment.txt | samtools sort -@ 8 -o AS002.bam
        #hisat2 -p 8 --dta-cufflinks -x $ref_path -1 $After_TGlore1/AS00$i\_R1_val_1.fq.gz -2 $After_TGlore1/AS00$i\_R2_val_2.fq.gz --summary-file $Cufflink_input/AS00$i.txt | samtools sort -@ 8 -o $Cufflink_input/AS00$i.bam
        #trim_galore --phred33 --fastqc --length 36 --illumina -j 4 --paired $TRIMM_PA/AS0$i\_R1.fastq.gz $TRIMM_PA/AS0$i\_R2.fastq.gz
	#hisat2 -p 8 --dta -x $ref_path -1 $After_TGlore/AS0$i\_R1_val_1.fq.gz -2 $After_TGlore/AS0$i\_R2_val_2.fq.gz --summary-file Alignment.txt | samtools sort -@ 8 -o AS0$i.bam
        #stringtie -p 8 -G $annotation_path/Homo_sapiens.GRCh38.104.gtf -o $assemble_path/AS0$i.gtf $align_path/AS0$i.bam
#	stringtie -e -B -p 8 -G $assemble_path/ctrl_gradII+_merged.gtf -o $ballgown1_path/ballgown/AS0$i/AS0$i.gtf $align_path/AS0$i.bam
        #stringtie -e -B -p 8 -G $ballgown1_path/merged_prep.gtf -o $ballgown6_path/ballgown/AS0$i/AS0$i.gtf $align_path/AS0$i.bam
	#cufflinks -p 8 -o $Cufflink_output/AS00$i $Cufflink_input/AS00$i.bam
#done
#for i in {10..12}
#do
	#hisat2 -p 8 --dta-cufflinks -x $ref_path -1 $After_TGlore1/AS0$i\_R1_val_1.fq.gz -2 $After_TGlore1/AS0$i\_R2_val_2.fq.gz --summary-file $Cufflink_input/AS0$i.txt | samtools sort -@ 8 -o $Cufflink_input/AS0$i.bam
         #cufflinks -p 8 -o $Cufflink_output/AS0$i $Cufflink_input/AS0$i.bam
#done


#for i in {13..20}
#do
	#hisat2 -p 8 --dta-cufflinks -x $ref_path -1 $After_TGlore2/AS0$i\_R1_val_1.fq.gz -2 $After_TGlore2/AS0$i\_R2_val_2.fq.gz --summary-file $Cufflink_input/AS0$i.txt | samtools sort -@ 8 -o $Cufflink_input/AS0$i.bam
 #        cufflinks -p 8 -o $Cufflink_output/AS0$i $Cufflink_input/AS0$i.bam
#done

#for i in {1..9}

#do
 #        stringtie -e -B -p 8 -G $ASSEM_PATH_2/all_MP_Control.gtf -o $ASSEM_PATH_2/Ballgown4/ballgown/AS00$i/AS00$i.gtf $AlIG_PATH_2/AS00$i.bam

	 #isat2 -p 8 --dta -x $ref_path -1 $After_TGlore1/fastq_after_TrGl/AS00$i\_R1_val_1.fq.gz -2 $After_TGlore1/fastq_after_TrGl/AS00$i\_R2_val_2.fq.gz --summary-file Alignment.txt | samtools sort -@ 8 -o AS0$i.bam
#	stringtie -p 8 -v -C $ASSEM_PATH_2/AS00$i\_refs.gtf -t -m 75 -G $annotation_path/Homo_sapiens.GRCh38.104.gtf -o $ASSEM_PATH_2/AS00$i.gtf $AlIG_PATH_2/AS00$i.bam -A $ASSEM_PATH_2/AS00$i\_abund.tab 
#done
#for i in {10..20}
#do  
	#hisat2 -p 8 --dta-cufflinks -x $ref_path -1 $fastq_path/AS0$i\_R1.fastq.gz -2 $fastq_path/AS0$i\_R2.fastq.gz | samtools sort -@ 8 -o AS0$i.bam
	#stringtie -e -B -p 8 -G $ASSEM_PATH_2/all_MP_Control.gtf -o $ASSEM_PATH_2/Ballgown4/ballgown/AS0$i/AS0$i.gtf $AlIG_PATH_2/AS0$i.bam
	#hisat2 -p 8 --dta -x $ref_path -1 $After_TGlore1/fastq_after_TrGl/AS0$i\_R1_val_1.fq.gz -2 $After_TGlore1/fastq_after_TrGl/AS0$i\_R2_val_2.fq.gz --summary-file Alignment.txt | samtools sort -@ 8 -o AS0$i.bam
#	stringtie -p 8 -v -C $ASSEM_PATH_2/AS0$i\_refs.gtf -t -m 75 -G $annotation_path/Homo_sapiens.GRCh38.104.gtf -o $ASSEM_PATH_2/AS0$i.gtf $AlIG_PATH_2/AS0$i.bam -A $ASSEM_PATH_2/AS0$i\_abund.tab
#done

#for i in 13 16 10 15
#do
 #       hisat2 -p 8 --dta-cufflinks -x $ref_path -1 $fastq_path/AS0$i\_R1.fastq.gz -2 $fastq_path/AS0$i\_R2.fastq.gz | samtools sort -@ 8 -o AS0$i.bam
#	 stringtie -e -B -p 8 -G $ASSEM_PATH_2/TP_Control.gtf -o $ASSEM_PATH_2/Ballgown1/ballgown/AS0$i/AS0$i.gtf $AlIG_PATH_2/AS0$i.bam
#uffmerge -g /mnt/RNAseq-samples/hisat_reference/annotation/hg38.ensGene.gtf -s /home/salmatariq/reference/GRCH38/hg38.fa -p 8 $Cufflink_output/TP_Control.txt 
#python /usr/bin/cuffmerge -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -s /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 $Cufflink_output/TP_Control.txt 
#cuffdiff -o diff_out -b /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 --labels C1,C2 -u /mnt/RNAseq-samples/Cufflink_output/TP_Control/merged.gtf \
#$Cufflink_input/AS013.bam,$Cufflink_input/AS016.bam $Cufflink_input/AS010.bam,$Cufflink_input/AS015.bam --output-dir $Cufflink_output/TP_Control/
#featureCounts -p -B -a /mnt/RNAseq-samples/Cufflink_output/TP_Control/merged.gtf -o $Cufflink_output/TP_Control/example_featureCounts_output.txt $Cufflink_input/AS013.bam $Cufflink_input/AS016.bam $Cufflink_input/AS010.bam $Cufflink_input/AS015.bam
#done

#for i in 06 07 17 18 10 15
#do
 #      hisat2 -p 8 --dta-cufflinks -x $ref_path -1 $fastq_path/AS0$i\_R1.fastq.gz -2 $fastq_path/AS0$i\_R2.fastq.gz | samtools sort -@ 8 -o AS0$i.bam
#	stringtie -e -B -p 8 -G $ASSEM_PATH_2/ER_PR_HG_Control.gtf -o $ASSEM_PATH_2/Ballgown2/ballgown/AS0$i/AS0$i.gtf $AlIG_PATH_2/AS0$i.bam
#python /usr/bin/cuffmerge -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -s /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 $Cufflink_output/ER_PR_HG_Control.txt 
#cuffdiff -o diff_out -b /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 --labels C1,C2 -u /mnt/RNAseq-samples/Cufflink_output/ER_PR_HG_Control/merged.gtf \
#$Cufflink_input/AS006.bam,$Cufflink_input/AS007.bam,$Cufflink_input/AS017.bam,$Cufflink_input/AS018.bam $Cufflink_input/AS010.bam,$Cufflink_input/AS015.bam --output-dir $Cufflink_output/ER_PR_HG_Control/

#done

#for i in 01 02 03 08 09 11 12 19 20 10 15
#do
     # stringtie -e -B -p 8 -G $ASSEM_PATH_2/ER_PR_LG_Control.gtf -o $ASSEM_PATH_2/Ballgown3/ballgown/AS0$i/AS0$i.gtf $AlIG_PATH_2/AS0$i.bam
 #     hisat2 -p 8 --dta-cufflinks -x $ref_path -1 $fastq_path/AS0$i\_R1.fastq.gz -2 $fastq_path/AS0$i\_R2.fastq.gz | samtools sort -@ 8 -o AS0$i.bam
#python /usr/bin/cuffmerge -g /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.104.gtf -s /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 $Cufflink_output/ER_PR_LG_Control.txt
#cuffdiff -o diff_out -b /mnt/RNAseq-samples/hisat_reference/annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa -p 8 --labels C1,C2 -u /mnt/RNAseq-samples/Cufflink_output/ER_PR_LG_Control/merged.gtf \
#$Cufflink_input/AS001.bam,$Cufflink_input/AS002.bam,$Cufflink_input/AS003.bam,$Cufflink_input/AS008.bam,$Cufflink_input/AS009.bam,$Cufflink_input/AS011.bam,$Cufflink_input/AS012.bam,\
#$Cufflink_input/AS019.bam,$Cufflink_input/AS020.bam $Cufflink_input/AS010.bam,$Cufflink_input/AS015.bam --output-dir $Cufflink_output/ER_PR_LG_Control/
#done
