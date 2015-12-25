## Extracting genomic coordinates of disease-associated SNPs from GWAS catalog

* `gwas2bed.py` - A Pyhton script to download the coordinates of disease-associated SNPs and separate them into disease-specific .bed files

Get GWAScatalog data from the UCSC MySQL server, extract hg19 genomic coordinates into separate files defined by the 'title' column. At this time, only standard chromosome names are considered.

Sort disease-associated SNP sets by size, specified by the first argument to the program. If a disease has less than 15 SNPs, it is not recommended to run enrichment analysis on it.  (Trynka et al. Chromatin marks identify critical cell types  for fine mapping complex trait variants. Nat Genet. 2013 Feb;45(2): 124-30. doi: 10.1038/ng.2504).

Usage:
```
python gwas2bed.py 5
```

Output: A 'gwasCatalog-[date].bed' file with the coordinates of all GWAS SNPs. Two subfolders under 'bed' folder, 'more' and 'less', containing sets having more/less that X SNPs, respectively. X is specified as an argument.

Getting the number of SNPs per file: `for file in bed/more5/*.bed; do wc -l $file; done | awk '{OFS="\t"} {print $2,$1}' | sed 's/\.bed//' | sed 's/bed\/more5\///' |  sort -n -k2 -r > bed_length.txt`

# `data` folder

`mapping_DisGeNet-GWASdb2.xlsx` - maping between DisGeNet genes and GWASdb2 SNPs

`mapping_DisGeNet-gwascatalog.xlsx` - maping between DisGeNet genes and gwasCatalog SNPs

### [db_DiseaseConnect](http://disease-connect.org/) Disease-Disease and Disease-Gene associations

`Disease-Disease_v1.csv.gz` - Format: Disease 1, Disease 2, P value. The disease-disease relations are determined by the significance of the shared GWAS/OMIM/DEG genes between two diseases using hypergeometric test.

`Disease-Gene_v1.csv.gz` - Format: CUI, Disease Name, Type, Gene. The types are:

- GWAS: Genes that are reported to be relevant to the disease based on the catalog of published genome-wide association studies (GWAS).
- OMIM: Genes that are relevant to Arthritis based on the OMIM Gene Map.
- DEG: Genes that are differentially expressed (DEG) between an condition related to the disease and other condition.

### [db_DisGeNet](http://www.disgenet.org/web/DisGeNET/menu/home) Disease-Gene associations

A collection of disease-associated genes. Scripts are used to extract disease-specific gene lists.

### [db_GWASdb2](http://jjwanglab.org/gwasdb) Disease-SNP associations

A collection of disease-associated SNPs. Some diseases, like "type 1 diabetes" with 14,486 SNPs, contain unreasonable number of SNPs, so the data should be used with caution

### [db_HuGeNavigator](https://phgkb.cdc.gov/HuGENavigator/downloadCenter.do) Disease-Gene and Disease-SNP associations

	- `Disease-GeneID.txt.gz` - Phenopedia. Disease-gene relationships. 2,860 diseases (CUIs) (first column) vs. gene names (EntrezIDs) (rows, different length). 
	- `GWAS.xlsx` - GWASintegrator, like gwasCatalog
	- `Cancer_GAMA.xlsx` - Cancer GAMAdb. Cancer type-gene-SNP relationships

`./make-GWAS.sh` will make SNP files from GWAS.txt

### [db_Johnson](http://www.biomedcentral.com/1471-2350/10/6) Disease-SNP associations

Johnson AD, O'Donnell CJ. An open access database of genome-wide association
results. BMC Med Genet. 2009 Jan 22;10:6. doi: 10.1186/1471-2350-10-6. PubMed
PMID: 19161620; PubMed Central PMCID: PMC2639349.

	- `JohnsonOdonnell_Table.txt.gz` - 56,411 GWAS genotype-phenotype associations and annotation.

### [db_Okada-Plenge](http://plaza.umin.ac.jp/~yokada/datasource/software.htm) - Curated phenotype/SNP data from the GWAS catalogue

Okada Y, Wu D, Trynka G, Raj T, Terao C, Ikari K, Kochi Y, Ohmura K, Suzuki A, Yoshida S, Graham RR, Manoharan A, Ortmann W, Bhangale T, Denny JC, Carroll RJ, Eyler AE, Greenberg JD, Kremer JM, Pappas DA, Jiang L, Yin J, Ye L, Su DF, Yang J, Xie G, Keystone E, Westra HJ, Esko T, Metspalu A, Zhou X, Gupta N, Mirel D, Stahl EA, Diogo D, Cui J, Liao K, Guo MH, Myouzen K, Kawaguchi T, Coenen MJ, van  Riel PL, van de Laar MA, Guchelaar HJ, Huizinga TW, Dieudé P, Mariette X, Bridges SL Jr, Zhernakova A, Toes RE, Tak PP, Miceli-Richard C, Bang SY, Lee HS, Martin J, Gonzalez-Gay MA, Rodriguez-Rodriguez L, Rantapää-Dahlqvist S, Arlestig L, Choi HK, Kamatani Y, Galan P, Lathrop M; RACI consortium; GARNET consortium, Eyre S, Bowes J, Barton A, de Vries N, Moreland LW, Criswell LA, Karlson EW, Taniguchi A, Yamada R, Kubo M, Liu JS, Bae SC, Worthington J, Padyukov L, Klareskog L, Gregersen PK, Raychaudhuri S, Stranger BE, De Jager PL, Franke L, Visscher PM, Brown MA, Yamanaka H, Mimori T, Takahashi A, Xu H, Behrens TW, Siminovitch KA, Momohara S, Matsuda F, Yamamoto K, Plenge RM. **Genetics of rheumatoid arthritis contributes to biology and drug discovery**. Nature. 2014 Feb 20;506(7488):376-81. doi: 10.1038/nature12873. Epub 2013 Dec 25. PubMed PMID: 24390342; PubMed Central PMCID: PMC3944098.

`make.sh` - extract disease-associated SNPs into separate files in `txt` folder

### [db_omim](http://omim.org/)

Attempt to play with OMIM files

### [db_Phenuma](http://cath.gisum.uma.es:8080/Phenuma/main.jsf) Disease-Disease associations

[phenuma_networks.zip](http://cath.gisum.uma.es:8080/Phenuma/resources/networks/phenuma_networks.zip) contains three files:

- gene2gene.txt - Gene-Gene associations, many different scores
- omim2omim.txt - Disease-Disease associations, score column 5, "inferred_gene" -some NULL but most are OK. OMIM IDs
- orpha2orpha.txt - Disease-Disease associations, score column 5, "inferred_gene" some NULL but most are OK. But this is for Ophranet IDs.

### [db_snps3d.org](http://www.snps3d.org/download/) Disease-Gene associations

- `Candidate_genes.xlsx` - a set of pre-compiled candidate genes for 76 selected diseases. 

### [phenotypes](https://github.com/joepickrell/phenotypes) Disease-SNP associations

JSON files with genetic score models

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

- PGC (psychiatric) summary statistics, http://www.med.unc.edu/pgc/downloads;
- GIANT (anthropometric) summary statistics, http:// www.broadinstitute.org/collaboration/giant/index.php/GIANT_ consortium_data_files; 
- EGG (Early Growth Genetics) summary statistics, http://www.egg-consortium.org/; 
- MAGIC (insulin, glucose) summary statistics, http://www.magicinvestigators.org/downloads/; 
- CARDIoGRAM (coronary artery disease) summary statistics, http://www.cardiogramplusc4d.org/; 
- DIAGRAM (type 2 diabetes) summary statistics, http://www.diagram-consortium.org/; 
- rheumatoid arthritis summary statistics, http://www.broadinstitute.org/ftp/pub/rheumatoid_arthritis/Stahl_etal_2010NG/; 
- IGAP (Alzheimer’s) summary statistics, http://www.pasteur-lille.fr/en/recherche/u744/igap/igap_download.php; 
- IIBDGC (inflammatory bowel disease) summary statistics (we used a newer version of these data with 1000 Genomes Project imputation), http://www.ibdgenetics.org/downloads.html; 
- plasma lipid summary statistics, http://www.broadinstitute.org/mpg/pubs/lipids2010/; 
- SSGAC (educational attainment) summary statistics, http://www.ssgac.org/.