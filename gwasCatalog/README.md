## Extracting disease-specific genomic coordinates from GWAS catalog

* `gwas2bed.py` - A Pyhton script to download the coordinates and separate them into disease-specific .bed files

Get GWAScatalog data from the UCSC MySQL server, extract hg19 genomic coordinates into separate files defined by the 'title' column. At this time, only standard chromosome names are considered.

Sort disease-associated SNP sets by size, specified by the first argument to the program. If a disease has less than 15 SNPs, it is not recommended to run enrichment analysis on it.  (Trynka et al. Chromatin marks identify critical cell types  for fine mapping complex trait variants. Nat Genet. 2013 Feb;45(2): 124-30. doi: 10.1038/ng.2504).

Usage:
```
make
```

Output: A 'gwasCatalog-[date].bed' file with the coordinates of all GWAS SNPs. Two subfolders under 'bed' folder, 'more15' and 'less15', containing sets having more that 15 SNPs, or less.

`data` folder
===

[db_snps3d.org](http://www.snps3d.org/download/)
---
	- `Candidate_genes.xlsx` - a set of pre-compiled candidate genes for 76 selected diseases. 

[db_HuGeNavigator](http://64.29.163.162:8080/HuGENavigator/downloadCenter.do)
---
	- `Disease-GeneID.xlsx` - Phenopedia. Disease-gene relationships
	- `GWAS.xlsx` - GWASintegrator, like gwasCatalog
	- `Cancer_GAMA.xlsx` - Cancer GAMAdb. Cancer type-gene-SNP relationships

`./make.sh` will make SNP files from GWAS.txt

[db_Phenuma](http://cath.gisum.uma.es:8080/Phenuma/resources/networks/phenuma_networks.zip)
---

gene2gene.txt - many different scores

omim2omim.txt - score column 5, "inferred_gene" some NULL but most are OK. OMIM IDs

orpha2orpha.txt - score column 5, "inferred_gene" some NULL but most are OK. But this is for Ophranet IDs.

[db_GWASdb2](http://jjwanglab.org/gwasdb)
---

`./make.sh` will create trait-specific files
