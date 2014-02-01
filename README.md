Extracting disease-specific genomic coordinates from GWAS catalog
========================================================

A collection of scripts to download and extract genomic coordinates of disease-, trait-, or phenotype-specific sets of SNPs from the [GWAS catalog](http://www.genome.gov/gwastudies/).


* `gwas2bed.py` - A Pyhton script to download the coordinates and separate them into disease-specific .bed files

* `renameSpecial.sh` - A script to remove spaces and special characters from file names

* `gwassort.sh` - A script to sort large/small SNP sets into separate folders

* `more15` - Files with disease- and trait-specific sets of SNPs, each set has at least 15 SNPs. Accessed 01/31/2014

* `less15` - Files with disease- and trait-specific sets of SNPs, each set has less than 15 SNPs. Accessed 01/31/2014

* `gwascatalog.bed` - coordinates of all GWAS catalog SNPs. Accessed 01/31/2014. 14,182 SNPs total.