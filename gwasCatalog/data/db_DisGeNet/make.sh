export LC_CTYPE=C 
export LANG=C

mkdir -p genes

zcat < curated_gene_disease_associations.txt.gz | sed '1d' | cut -f1,5 | tr ' ' '_' | tr -d '[{}(),!]' | tr -d "'" | tr -d '`' | tr '[A-Z]' '[a-z]' | sed 's/_-_/_/g' | tr '\/' '_' | tr '-' '\_' | awk 'BEGIN {OFS="\t"} {print $1 >> ("genes/"$2".txt"); close("genes/"$2".txt")}'

for file in genes/*.txt; do echo $file; sort $file | uniq > tmp.txt && mv tmp.txt $file; done 

zcat < all_gene_disease_associations.txt.gz | sed '1d' | cut -f1 | sort | uniq > allgenes.txt
