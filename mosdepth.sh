for i in {1..9}
do
	mosdepth -n --by /mnt/Exome_Sequencing/nexterarapidcapture_exome_targetedregions_liftover_hg38.bed BN00$i.wes BN00$i.sorted.bam
done
for i in {10..12}
do
        mosdepth -n --by /mnt/Exome_Sequencing/nexterarapidcapture_exome_targetedregions_liftover_hg38.bed BN0$i.wes BN0$i.sorted.bam
done
