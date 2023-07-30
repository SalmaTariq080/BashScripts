for i in 02 03 04 05 06 07 08 09 10 11 12
do
		picard CollectHsMetrics I=BN0$i.sorted.bam O=BN0$i\_hs_metrics.txt R=/home/salmatariq/exome_sequencing/hg38.fa.gz BAIT_INTERVALS=/mnt/Exome_Sequencing/nexterarapidcapture_exome_targetedregions_liftover.interval_list TARGET_INTERVALS=/mnt/Exome_Sequencing/nexterarapidcapture_exome_targetedregions_liftover.interval_list
done
