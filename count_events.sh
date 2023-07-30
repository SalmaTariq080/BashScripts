echo "The number of snps intergenic regions" >> Summary.txt
awk '{if($6 =="intergenic") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l >> Summary.txt
echo "The number of snps UTR3" >> Summary.txt
awk '{if($6 =="UTR3") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l >> Summary.txt
echo "The number of snps exonic" >> Summary.txt
awk '{if($6 =="exonic") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l >> Summary.txt
echo "The number of snps intronic" >> Summary.txt
awk '{if($6 =="intronic") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l >> Summary.txt
echo "The number of snps upstream" >> Summary.txt
awk '{if($6 =="upstream") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l >> Summary.txt
echo "The number of snps downstream" >> Summary.txt
awk '{if($6 =="downstream") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l
echo "The number of snps UTR5" >> Summary.txt
awk '{if($6 =="UTR5") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l
echo "The number of snps ncRNA_exonic" >> Summary.txt
awk '{if($6 =="ncRNA_exonic") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l
echo "The number of snps ncRNA_intronic" >> Summary.txt
awk '{if($6 =="ncRNA_intronic") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l
echo "The number of snps splicing" >> Summary.txt
awk '{if($6 =="splicing") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l
echo "The number of snps ncRNA_splicing" >> Summary.txt
awk '{if($6 =="ncRNA_splicing") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l
echo "The number of snps upstream;downstream" >> Summary.txt
awk '{if($6 =="upstream;downstream") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l
echo "The number of snps UTR5;UTR3" >> Summary.txt
awk '{if($6 =="UTR5;UTR3") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l
echo "The number of snps exonic;splicing" >> Summary.txt
awk '{if($6 =="exonic;splicing") print $6}' rnaseq_anno.hg38_multianno.txt | wc -l





