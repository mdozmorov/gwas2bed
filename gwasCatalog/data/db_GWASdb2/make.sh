FILE=ftp://jjwanglab.org/GWASdb/gwasdb_20140908_snp_trait.gz

wget $FILE

mkdir bed

zcat <  gwasdb_20140908_snp_trait.gz | sed '1d' | cut -f1-3,15 | tr ' ' '_' | tr -d '[{}(),!]' | tr -d "'" | tr -d '`' | tr '[A-Z]' '[a-z]' | sed 's/_-_/_/g' | tr '\/' '_' | tr '-' '\_' | awk 'BEGIN {OFS="\t"} {print "chr"$1, $2, $2+1, $3 >> ("bed/"$4".bed"); close("bed/"$4".bed")}' 