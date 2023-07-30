reference_path='/home/salmatariq/reference/GRCH38/hg38.fa'

gatk --java-options "-Xmx64G"\
   DepthOfCoverage \
   --reference $reference_path \
   --output file_name_base \
   --input input_bams.list \
   --summary-coverage-threshold 5 --summary-coverage-threshold 15 --summary-coverage-threshold 30 \
   --intervals /mnt/Exome_Sequencing/annovar/nexterarapidcapture_exome_targetedregions_liftover_hg38.bed --tmp-dir `pwd`/tmp
