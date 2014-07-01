Extracting disease-specific genomic coordinates from GWAS catalog
===================================================================

`gwas_catalog_download.pl` - processes [GWAScatalog](http://www.genome.gov/gwastudies/) into disease-specific BED files. It also extracts disease-specific genes. Output:
- `diseases.genes` - a subfolder containing lists of names of disease-specific genes;
- `diseases.snps_bed` - a subfolder containing lists of coordinates of disease-specific SNPs;
- `diseases.snps_empty` - a subfolder containing lists of diseases that don't have SNPs;
- `diseases.snp_not_found` - a subfolder containing lists of SNPs that can't be mapped.

(C) Krista Bean