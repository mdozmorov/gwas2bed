Extracting disease-specific genomic coordinates from GWAS catalog
========================================================

A collection of scripts to download and extract genomic coordinates of disease-, trait-, or phenotype-specific sets of SNPs from the [GWAS catalog](http://www.genome.gov/gwastudies/).

* `gwas2bed.py` - A Pyhton script to download the coordinates and separate them into disease-specific .bed files

## Get GWAScatalog data from the UCSC MySQL server, 
## extract hg19 genomic coordinates into separate files 
## defined by 'title' column
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