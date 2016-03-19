#!/bin/bash

# https://data.mendeley.com/datasets/ckz9mtgrjj/1
# Download full dataset
wget https://data.mendeley.com/archiver/ckz9mtgrjj?version=1 -O genotype-data-for-a-set-of-163-worldwide-populations.zip
# Extract files BusbyWorldwidePopulations.bed/bim/fam/csv
unzip genotype-data-for-a-set-of-163-worldwide-populations.zip
# Recode PLINK files into .raw file containing one identifier per allele
# Results are in pop163.raw. 
# For each SNP, we have NA, 0 or -9 as missing/non-interesting IDs. 
# We care about 1 (homozygous) and 2 (heterozygous) SNPs, http://pngu.mgh.harvard.edu/~purcell/plink/dataman.shtml#recode
plink --bfile BusbyWorldwidePopulations --recodeA --tab --out pop163 --nonfounders
# Process the resulting pop163.raw file
python exome3.py pop163.raw --outdir pop163.txt --verbose 2>>notfound
# Post-process individual-specific two-column SNP-genotype files into one-column SNP files
# All SNPs
mkdir -p pop163.all
for file in pop163.txt/*; do echo $file; cut -f1 $file | sort > pop163.all/`basename $file`; gzip pop163.all/`basename $file`; done
# # "1" genotypes
# mkdir -p pop163.1
# for file in pop163.txt/*; do echo $file; awk '$2 == 1 {print $1}' $file | sort > pop163.1/`basename $file`; done
# "2" genotypes
mkdir -p pop163.2
for file in pop163.txt/*; do echo $file; awk '$2 == 2 {print $1}' $file | sort > pop163.2/`basename $file`; gzip pop163.2/`basename $file`; done
# Get all SNPs
head -n 1 pop163.raw | cut -f7- | tr "\t" "\n" | cut -d "_" -f1 | sort | uniq > all_pop163.txt


# Cleanup
rm -r genotype-data-for-a-set-of-163-worldwide-populations* BusbyWorldwidePopulations* notfound pop163.raw pop163.log pop163.hh pop163.txt