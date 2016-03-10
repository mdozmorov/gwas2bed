export LC_CTYPE=C 
export LANG=C

DIR=MAPPED_TRAIT
mkdir -p $DIR

# Columns 22 - SNPS, 35 - MAPPED_TRAIT
# Remove leading "_", convert commas in trait names to tabs, keep two columns, convert spaces/dashes to underscores
# Delete quotes, convert to lower case, print each SNP to the corresponding trait file
zcat < current_gwas_catalog.txt.gz | sed '1d' | cut -f22,35 | sed 's/^\_//' | tr "," "\t" | cut -f1-2 | tr " " "_" | tr "-" "_" | tr -d '[{}(),!];:/' | tr -d "'" | tr -d '`' | tr '[A-Z]' '[a-z]' | sed 's/_-_/_/g' | awk -v dir=$DIR 'BEGIN {OFS="\t"} {print $1 >> (dir"/"$2".txt"); close(dir"/"$2".txt")}'

cd $DIR

# Delete wrong files
rm _*.txt

# Keep the first portion of rsID having "_"-separated appendix. Keep rsIDs only
for file in *.txt; do echo $file; cat $file | tr "_" "\t" | cut -f1 | grep "^rs" | sort | uniq > tmp.txt && mv tmp.txt $file; done

# Save all SNPs
cat *.txt | sort | uniq > ../all_current_gwas_catalog.txt

# Remove files smaller than the number of lines
NUM=5
for file in *.txt; do wc -l $file; done | awk -v num=$NUM '$1 < num {print $2}' | xargs rm

cd ..
