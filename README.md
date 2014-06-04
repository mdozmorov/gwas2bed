Extracting disease-specific genomic coordinates from GWAS catalog
========================================================

A collection of scripts to download and extract genomic coordinates of disease-, trait-, or phenotype-specific sets of SNPs from the [GWAS catalog](http://www.genome.gov/gwastudies/).

* `gwas2bed.py` - A Pyhton script to download the coordinates and separate them into disease-specific .bed files

Get GWAScatalog data from the UCSC MySQL server, 
extract hg19 genomic coordinates into separate files 
defined by 'title' column. 
##
At any time, only standard chromosome names are considered.
##
Sort disease-associated SNP sets by size, specified by the first 
argument to the program. If a disease has less than 15 SNPs,
it is not recommended to run enrichment analysis on it. 
(Trynka et al. Chromatin marks identify critical cell types 
for fine mapping complex trait variants. Nat Genet. 2013 Feb;45(2):
124-30. doi: 10.1038/ng.2504).

* Usage: `python gwas2bed.py [count]`

* Example: `python gwas2bed.py 15`

Output: A 'gwasCatalog-[date].bed' file with the coordinates of all
GWAS SNPs. Two folders, 'more' and 'less', containing sets having more
or less SNPs than the specified count.