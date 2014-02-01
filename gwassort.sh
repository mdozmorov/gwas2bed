#!/bin/bash
## ==================================================================
## Sort disease-associated SNP sets by size. If a disease has 15 SNPs
## or less, it is not recommended to run enrichment analysis on it,
## and the file is coplied into 'less15' folder, otherwise, into 'more15'
## folder (Trynka et al. Chromatin marks identify critical cell types 
## for fine mapping complex trait variants. Nat Genet. 2013 Feb;45(2):
## 124-30. doi: 10.1038/ng.2504).
##
## Usage: ./gwassort.sh [dir with *.bed files]
##
## Example: ./gwassort.sh gwascatalog
## ==================================================================

mkdir less15
mkdir more15

for file in `ls $1`; do
	echo $file
	# wc -l $file | cut -d " " -f1 -
	if [ ! `wc -l $1"/"$file" |cut -d " " -f1 -` -ge 15 ]
	then
		cp $1"/"$file" less15
	else
		cp $1"/"$file" more15
	fi
done