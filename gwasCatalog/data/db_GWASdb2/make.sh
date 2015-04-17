FILE=ftp://jjwanglab.org/GWASdb/gwasdb_20140908_snp_trait.gz

wget $FILE

mkdir bed

# Separates disease-specific SNPs into individual files
zcat <  gwasdb_20140908_snp_trait.gz | sed '1d' | cut -f1-3,15 | tr ' ' '_' | tr -d '[{}(),!]' | tr -d "'" | tr -d '`' | tr '[A-Z]' '[a-z]' | sed 's/_-_/_/g' | tr '\/' '_' | tr '-' '\_' | awk 'BEGIN {OFS="\t"} {print "chr"$1, $2-1, $2, $3 >> ("bed/"$4".bed"); close("bed/"$4".bed")}' 

# Creates a list of all GWASdb2 SNPs, 223874 SNPs total
zcat < gwasdb_20140908_snp_trait.gz | sed '1d' | cut -f1-3 | awk 'BEGIN {OFS="\t"} {print "chr"$1, $2-1, $2, $3}' | bedtools sort -i - | uniq > all_gwasdb2.bed 