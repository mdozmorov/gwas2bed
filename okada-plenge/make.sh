## ==================================================================
## Curated list of disease-associated SNPs (SNPs in LD removed) from
## [PubMed](http://www.ncbi.nlm.nih.gov/pubmed/24390342)
## `Makefile` - downloads list of SNPs
## ==================================================================

# wget http://plaza.umin.ac.jp/~yokada/datasource/files/Gwascatalog_20130131.xlsx
# manually convert to TXT format

mkdir bed

cat Gwascatalog_20130131.txt | sed '1d' | cut -f2,4 | tr ' ' '_' | tr -d '[{}(),!]' | tr -d "'" | tr -d '`' | tr '[A-Z]' '[a-z]' | sed 's/_-_/_/g' | tr '\/' '_' | tr '-' '\_' | awk 'BEGIN {OFS="\t"} {print $2 >> ("bed/"$1".bed"); close("bed/"$1".bed")}'

