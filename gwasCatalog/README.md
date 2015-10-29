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

[db_Johnson](http://www.biomedcentral.com/1471-2350/10/6)
---
	- `JohnsonOdonnell_Table.txt.gz` - 56,411 GWAS genotype-phenotype associations and annotation.

[db_Phenuma](http://cath.gisum.uma.es:8080/Phenuma/resources/networks/phenuma_networks.zip)
---

gene2gene.txt - many different scores

omim2omim.txt - score column 5, "inferred_gene" some NULL but most are OK. OMIM IDs

orpha2orpha.txt - score column 5, "inferred_gene" some NULL but most are OK. But this is for Ophranet IDs.

[db_GWASdb2](http://jjwanglab.org/gwasdb)
---

`./make.sh` will create trait-specific BED files

[db_DisGeNet](http://www.disgenet.org/web/DisGeNET/menu/downloads)
---

`./make.sh` will create trait-specific EntrezIDs list files

[db_DiseaseConnect](http://disease-connect.org/)
---

`Disease-Gene_v1.csv.gz` - Format: Concept ID, Disease Name, Type, Gene. There are three types of disease-gene relations as follows:

GWAS: Genes that are reported to be relevant to the disease based on the catalog of published genome-wide association studies (GWAS).

OMIM: Genes that are relevant to Arthritis based on the OMIM Gene Map.

DEG: Genes that are differentially expressed (DEG) between an condition related to the disease and other condition.

`Disease-Disease_v1.csv.gz` - Format: Disease 1, Disease 2, P value. The disease-disease relations are determined by the significance of the shared GWAS/OMIM/DEG genes between two diseases using hypergeometric test.

[phenotypes](https://github.com/joepickrell/phenotypes) - JSON files with genetic score models
---

See [README.md](https://github.com/joepickrell/phenotypes/blob/master/README.md) in the Git repository.

# Summary statistics

49 traits from 24 phenotypes. Summary statistics from [Bulik-Sullivan B, Finucane HK, Anttila V, Gusev A, Day FR, Consortium R, Genomics Consortium P, of the Wellcome Trust Consortium GC for A, Perry JRB, Patterson N, Robinson E, Daly MJ, Price AL, Neale BM: An Atlas of Genetic Correlations across Human Diseases and Traits. bioRxiv 2015, 47:1–44.](http://www.nature.com/ng/journal/v47/n11/full/ng.3406.html#supplementary-information)

Processing method, using the script [munge_sumstats.py](https://github.com/bulik/ldsc/blob/master/munge_sumstats.py) included with [ldsc](https://github.com/bulik/ldsc):

1. For studies that provide a measure of imputation quality, filter to INFO above 0.9.
2. For studies that provide sample MAF, filter to sample MAF above 1%.
3. To restrict to well-imputed SNPs in studies that do not provide a measure of imputation quality, filter to SNPs in the HapMap 3 panel61 with a 1000 Genomes Project EUR (European) MAF above 5%, which tend to be well imputed in most studies. This step should be skipped if INFO scores are available for all studies.
4. If the sample size varies from SNP to SNP, remove SNPs with an effective sample size less than 0.67 times the 90th percentile of sample size.
5. For meta-analyses with specialty chips (for example, the Metabochip), remove SNPs with a sample size above the maximum GWAS sample size.
6. Remove indels and structural variants.
7. Remove strand-ambiguous SNPs.
8. Remove SNPs whose alleles do not match the alleles in the 1000 Genomes Project.

- PGC (psychiatric) summary statistics, http://www.med.unc.edu/pgc/ downloads;
- GIANT (anthropometric) summary statistics, http:// www.broadinstitute.org/collaboration/giant/index.php/GIANT_ consortium_data_files; 
- EGG (Early Growth Genetics) summary statistics, http://www.egg-consortium.org/; 
- MAGIC (insulin, glucose) summary statistics, http://www.magicinvestigators.org/downloads/; 
- CARDIoGRAM (coronary artery disease) summary statistics, http://www.cardiogramplusc4d.org/; 
- DIAGRAM (type 2 diabetes) summary statistics, http://www.diagram-consortium.org/; 
- rheumatoid arthritis summary statistics, http://www.broadinstitute. org/ftp/pub/rheumatoid_arthritis/Stahl_etal_2010NG/; 
- IGAP (Alzheimer’s) summary statistics, http://www.pasteur-lille.fr/en/ recherche/u744/igap/igap_download.php; 
- IIBDGC (inflammatory bowel disease) summary statistics (we used a newer version of these data with 1000 Genomes Project imputation), http://www.ibdgenetics. org/downloads.html; 
- plasma lipid summary statistics, http://www. broadinstitute.org/mpg/pubs/lipids2010/; 
- SSGAC (educational attainment) summary statistics, http://www.ssgac.org/.