Extracting disease-specific genomic coordinates from GWAS catalog
========================================================

A collection of scripts to download and extract genomic coordinates of disease-, trait-, or phenotype-specific sets of SNPs from GWAS catalog.

```{python}
gwas2bed.py
```
A Pyhton script to download the coordinates and separate them into disease-specific .bed files

```{bash}
renameSpecial.sh
```
A script to remove spaces and special characters from file names

```{bash}
gwassort.sh
```
A script to sort large/small SNP sets into separate folders



`gwascatalog.bed` - coordinates of all GWAS catalog SNPs, accessed 01/12/2014