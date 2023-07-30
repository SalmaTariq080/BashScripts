#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR139/004/ERR1395554/ERR1395554_1.fastq.gz
#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR139/004/ERR1395554/ERR1395554_2.fastq.gz
#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR139/007/ERR1395557/ERR1395557_1.fastq.gz
#wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR139/007/ERR1395557/ERR1395557_2.fastq.gz
fastq_path="/mnt/wgs/fastq_file"
ref_path="/mnt/wgs/Reference/ref2"
reference_path='/home/salmatariq/reference/GRCH38/hg38.fa'
#samtools faidx chm13v2.0.fa
#bwa index GCA_009914755.4.fa -a bwts
#bwa index -a bwtsw chm13v2.0.fa.gz
#bwa mem $ref_path/chm13v2.0.fa -t 11 -M -a -I 400 -R "@RG\tID:BN_PGx_Genome_Run1\tSM:BN_PGx_Genome_Run1_ERR1395554\tLB:Lib1\tPL:ILL" $fastq_path/ERR1395554_1.fastq.gz $fastq_path/ERR1395554_2.fastq.gz | samtools sort -n -o - | samtools fixmate - -m - | samtools sort - -o - | samtools markdup - -l 100 $fastq_path/ERR1395554_markdup.bam
#bwa mem $ref_path/chm13v2.0.fa -t 11 -M -a -I 400 -R "@RG\tID:BN_PGx_Genome_Run1\tSM:BN_PGx_Genome_Run1_ERR1395557\tLB:Lib1\tPL:ILL" $fastq_path/ERR1395557_1.fastq.gz $fastq_path/ERR1395557_2.fastq.gz | samtools sort -n -o - | samtools fixmate - -m - | samtools sort - -o - | samtools markdup - -l 100 $fastq_path/ERR1395557_markdup.bam
#bwa mem $reference_path -t 11 -M -a -I 400 -R "@RG\tID:BN_PGx_Genome_Run1\tSM:BN_PGx_Genome_Run1_ERR1395554\tLB:Lib1\tPL:ILL" $fastq_path/ERR1395554_1.fastq.gz $fastq_path/ERR1395554_2.fastq.gz | samtools sort --threads 11 -n -o - | samtools fixmate - --threads 11 -m - | samtools sort - --threads 11 -o - | samtools markdup - -l 100 --threads 11 ERR1395554_markdup.bam
#samtools stats ERR1395554_markdup.bam --threads 11 > ERR1395554_markdup.stats.txt
bwa mem $reference_path -t 11 -M -a -I 400 -R "@RG\tID:BN_PGx_Genome_Run1\tSM:BN_PGx_Genome_Run1_ERR1395557\tLB:Lib1\tPL:ILL" $fastq_path/ERR1395557_1.fastq.gz $fastq_path/ERR1395557_2.fastq.gz | samtools sort --threads 11 -n -o - | samtools fixmate - --threads 11 -m - | samtools sort - --threads 11 -o - | samtools markdup - -l 100 --threads 11  ERR1395557_markdup.bam
#samtools stats ERR1395557_markdup.bam --threads 11 > ERR1395557_markdup.stats.txt
