## ==================================================================
## List of disease-associated lead and LD SNPs from "Linking disease
## associations with regulatory information in the human genome" 
## http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=3431491
##
## Sort disease-associated SNP sets by size. If a disease has 15 SNPs
## or less, it is not recommended to run enrichment analysis on it,
## and the file is coplied into 'less15' folder, otherwise, into 'more15'
## folder (Trynka et al. Chromatin marks identify critical cell types 
## for fine mapping complex trait variants. Nat Genet. 2013 Feb;45(2):
## 124-30. doi: 10.1038/ng.2504).
##
## Remove special characters from file names
##
## Usage: python gwas2bed.py [output dir]
##
## Example: python gwas2bed.py gwascatalog
##
## Output: A [output dir] folder containing .BED file with genomic
## coordinates of all SNPs from GWAScatalog, and two subfolders,
## "less15" and "more15", each containing .BED files with coordinates of
## less than or more than 15 trait-specific SNPs, respectively.
## ==================================================================

all:	H3K4me3
	for file in $</*.csv; do echo $$file; awk 'BEGIN {FS=";"; OFS="\t";} {print $$1, $$2, $$3}' $$file | sort -k1,1 -k2,2n - > `basename $$file .csv`.bed; done

H3K4me3.tar.gz:
	wget --no-check-certificate https://www.broadinstitute.org/mpg/epigwas/H3K4me3.tar.gz

H3K4me3:	H3K4me3.tar.gz
	tar xvf $<

clean:
	rm -r H3K4me3/;
	rm H3K4me3.tar.gz