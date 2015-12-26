#!/bin/bash
#PBS -S /bin/bash
#PBS -V
#PBS -l nodes=1:ppn=1
#PBS -M mdozmorov@vcu.edu
#PBS -N GRASP
#PBS -j oe
# PBS -o /home/glasser/Dissertation/Dozmorov/RNA-seq/cuffdiffout3

cd $PBS_O_WORKDIR

export LC_CTYPE=C 
export LANG=C

FILE=GRASP2fullDataset
PVAL=1e-4
DIR=bed.$PVAL

mkdir -p $DIR

# Extract columns
# - 5, SNPid(dbSNP134)
# - 6, chr(hg19)
# - 7, pos(hg19)
# - 11, Pvalue
# - 12, Phenotype
# - 14, PaperPhenotypeCategories

cat $FILE | sed '1d' | cut -f 5-7,11,12,14 | tr ' ' '_' | tr -d '[{}(),!]' | tr -d "'" | tr -d '`' | tr '[A-Z]' '[a-z]' | tr '\/' '_' | tr ":" "_" | awk -v pval=$PVAL -v dir=$DIR 'BEGIN {OFS="\t"} $4<pval {print "chr"$2,$3,$3+1,"rs"$1,$4,$5,$6 >> (dir"/"$5".txt"); close(dir"/"$5".txt")}'
