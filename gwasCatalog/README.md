## Extracting genomic coordinates of disease-associated SNPs from GWAS catalog

The GWAS catalog is now hosted at [EBI](https://www.ebi.ac.uk/gwas/home). Last downloaded: 03-10-2016.

- `current_gwas_catalog.txt` - the most recent GWAScatalog from (https://www.ebi.ac.uk/gwas/api/search/downloads/full), download manually. Use the "with added ontology annotations" version.

- `mapped_traits.txt` - how many SNPs per trait, `cut -f35 | sort | uniq -c | sort -k1 -r > mapped_traits.txt`

- `make.sh` - extract trait-specific SNP rsIDs into separate files.

Usage:
```
./make.sh
```

Output:

- `MAPPED_TRAIT` folder with trait-specific lists of SNP rsIDs. Only traits having 5 or more SNPs are kept.
- `all_current_gwas_catalog.txt` - all rsIDs from the cuttent GWAS catalog

-------------------------------------------------------------------------------

- `gwas_catalog_download.pl` - a Perl script for extracting hg19 disease-specific genomic coordinates from the latest [GWAScatalog](https://www.ebi.ac.uk/gwas/docs/downloads). (C) Krista Bean

Usage:
```
perl gwas_catalog_download.pl
```

Output: 

- `diseases.genes` - a subfolder containing symbols of disease-associated genes in separate files;
- `diseases.snps_bed` - a subfolder containing hg19 genomic coordinates of disease-associated SNPs;
- `diseases.snps_empty` - a subfolder containing lists of diseases that don't have SNPs;
- `diseases.snp_not_found` - a subfolder containing lists of SNPs that can't be mapped.

Need to post-process file names, to eliminate special characters and spaces. `for FILE in *.bed; do mv -v "$FILE" $(echo "$FILE" | sed 's/^\_//' | tr " " "_" | tr "-" "_" | tr -d '[{}(),!];:/' | tr -d "'" | tr -d '`' | tr '[A-Z]' '[a-z]' | sed 's/_-_/_/g'); done`

-------------------------------------------------------------------------------

- `gwas2bed.py` - A Pyhton script for downloading the coordinates of disease-associated SNPs and separate them into disease-specific .bed files

Get GWAScatalog data from the UCSC MySQL server, extract hg19 genomic coordinates into separate files defined by the 'title' column. At this time, only standard chromosome names are considered.

Sort disease-associated SNP sets by size, specified by the first argument to the program. If a disease has less than 15 SNPs, it is not recommended to run enrichment analysis on it.  (Trynka et al. Chromatin marks identify critical cell types  for fine mapping complex trait variants. Nat Genet. 2013 Feb;45(2): 124-30. doi: 10.1038/ng.2504).

Usage:
```
python gwas2bed.py 5
```

Output: A `gwasCatalog-[date].bed` file with the coordinates of all GWAS SNPs. Two subfolders under `bed` folder, `more` and `less`, containing sets having more/less that X SNPs, respectively. X is specified as an argument.

Getting the number of SNPs per file: `for file in bed/more5/*.bed; do wc -l $file; done | awk '{OFS="\t"} {print $2,$1}' | sed 's/\.bed//' | sed 's/bed\/more5\///' |  sort -n -k2 -r > bed_length.txt`

-------------------------------------------------------------------------------


- `filtered_regions_hg19.bed` - hg19 BED file of filtered regions, used to filter out uncertain CNVs. From Brandler et al., “Frequency and Complexity of De Novo Structural Mutation in Autism.”, [Source](http://www.sciencedirect.com/science/article/pii/S0002929716000690#app3)


# `data` folder

`mapping_DisGeNet-GWASdb2.xlsx` - maping between DisGeNet genes and GWASdb2 SNPs

`mapping_DisGeNet-gwascatalog.xlsx` - maping between DisGeNet genes and gwasCatalog SNPs


### [db_AMD](http://www.nature.com/ng/journal/v48/n2/full/ng.3448.html#supplementary-information)

Age-related macular degeneration GWAS results, from [Fritsche LG, et.al. "A large genome-wide association study of age-related macular degeneration highlights contributions of rare and common variants". Nat Genet. 2016 PMID: 26691988](https://www.ncbi.nlm.nih.gov/pubmed/26691988).

- `AMD.txt` - a list of all AMD-associated 52 SNPs. Manually extracted from the Supplementary Table 5 in the [Supplementary Text and Figures](http://www.nature.com/ng/journal/v48/n2/extref/ng.3448-S1.pdf). 02/24/2016.

- `ng.3448-S3.xlsx` - [Supplementary Data Set 2](http://www.nature.com/ng/journal/v48/n2/extref/ng.3448-S3.xlsx): Extended results of the 34 lead variants in non-European subjects. We analyzed the association of advanced AMD compared to control subjects in Asian (473 cases, 1,099 controls), African (52 cases, 361 controls) and ‘other ancestry’ (254 cases, 694 controls) groups for our 34 lead variants. Shown are frequencies, odds ratios and P values from the Firth-corrected logistic regression for all analyses. 34 SNPs.

- `ng.3448-S4.xlsx`, `AMD_ext.txt` - [Supplementary Data Set 3](http://www.nature.com/ng/journal/v48/n2/extref/ng.3448-S4.xlsx): Variants in 95% credible sets and their annotation. For each of the 52 index variants, the 95% credible set contains the minimal set of variants that add up to >95% posterior probability. 1343 unique SNPs, include 50 all AMD-associated SNPs (sans rs2043085, rs5817082).

- `ng.3448-S6.xlsx` - [Supplementary Data Set 5](http://www.nature.com/ng/journal/v48/n2/extref/ng.3448-S6.xlsx): Genes in the 34 identified AMD locus regions. Stated are all genes that overlap with the 34 AMD locus regions (defined by the 52 identified variants and their proxies (r2 ≥0.5, ±500 kb) as well as an indicator of whether this gene was also among the 368 genes in the narrow AMD locus regions (defined by 52 identified variants and their proxies (r2 ≥0.5, ±100 kb). 878 genes.

- `ng.3448-S8.xlsx` - [Supplementary Data Set 7](http://www.nature.com/ng/journal/v48/n2/extref/ng.3448-S8.xlsx): Relevant eye phenotypes in genetic mouse models in 33 genes in the 34 narrow AMD regions. We queried databases and conducted a literature search (Online Methods) for the 368 genes in the 34 narrow AMD regions and found relevant eye phenotypes for 33 of these genes. 368 genes.

- `assoc_linear_pvalue5E-5_ChrRsBpAllele.txt` and `glaucoma_selected.txt` - 82 glaucoma-associated SNPs. 

Extract rsIDs, `cut -f2 assoc_linear_pvalue5E-5_ChrRsBpAllele.txt | sed 's/\ //g' | sort > glaucoma_selected.txt`. 

Extract all known glaucoma-related SNPs from GWAScatalog, `cat *.bed | cut -f4 | sort | uniq > glaucoma_gwascatalog.txt`


### [db_Bagley-Altman](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004885#sec01)

- `journal.pcbi.1004885.s002.CSV` - S1 File. Subset of VARIMED used in our analysis, with disease name, gene name, chromosome, and PubMed ID. 40 diseases

- `journal.pcbi.1004885.s003.CSV` - S2 File. Diseases and disease clusters.

- `journal.pcbi.1004885.s004.CSV` - S3 File. Disease pairs from Columbia EMR with statistically significant under or overrepresentation. 2x2 enrichment statistics

- `journal.pcbi.1004885.s005.CSV` - S4 File. Disease pairs from Stanford EMR with statistically significant under or overrepresentation.

- `journal.pcbi.1004885.s006.CSV` - S5 File. Disease pairs in intersection of Columbia and Stanford EMRs.

- `journal.pcbi.1004885.s007.CSV` - S6 File. Disease pairs from VARIMED with statistically significant gene overlap.


### [db_DiseaseConnect](http://disease-connect.org/) Disease-Disease and Disease-Gene associations

`Disease-Disease_v1.csv.gz` - Format: Disease 1, Disease 2, P value. The disease-disease relations are determined by the significance of the shared GWAS/OMIM/DEG genes between two diseases using hypergeometric test.

`Disease-Gene_v1.csv.gz` - Format: CUI, Disease Name, Type, Gene. The types are:

- GWAS: Genes that are reported to be relevant to the disease based on the catalog of published genome-wide association studies (GWAS).
- OMIM: Genes that are relevant to Arthritis based on the OMIM Gene Map.
- DEG: Genes that are differentially expressed (DEG) between an condition related to the disease and other condition.

### [db_DisGeNet](http://www.disgenet.org/web/DisGeNET/menu/home) Disease-Gene associations

A collection of disease-associated genes. Scripts are used to extract disease-specific gene lists.

### [db_DnetDB](http://app.scbit.org/DNetDB/#) Disease-Disease associations

Disease-disease similarity mased on differential co-expression analysis

- `Basic information of 108 diseases.xlsx`
- `The disease similarity file.xlsx`

### [db_GRASP](http://grasp.nhlbi.nih.gov/Updates.aspx) Disease-SNP associations

Leslie R, O’Donnell CJ, Johnson AD: **GRASP: analysis of genotype-phenotype results from 1390 genome-wide association studies and corresponding open access database**. Bioinformatics 2014, 30:i185–94.

Annotated and categorized disease-associated SNPs. The unzipped [GRASP2fullDataset](https://s3.amazonaws.com/NHLBI_Public/GRASP/GraspFullDataset2.zip) is ~5Gb. See `README.md` in the subfolder for more details.

### [db_GWASdb2](http://jjwanglab.org/gwasdb) Disease-SNP associations

A collection of disease-associated SNPs. Some diseases, like "type 1 diabetes" with 14,486 SNPs, contain unreasonable number of SNPs, so the data should be used with caution.

### [db_HMDD](http://www.cuilab.cn/hmdd) Disease-miRNA associations

The Human microRNA Disease Database. 

- `alldata.txt.gz` - full database, [downloaded](http://www.cuilab.cn/files/images/hmdd2/alldata.txt) at 01/12/2016. Columns 2-4 have miRNA name, disease, Pubmed ID. 10,381 entries, 578 miRNAs, 383 diseases.

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

### [db_lncRNAdisease](http://www.cuilab.cn/lncrnadisease) Disease-lncRNA associations

	- `data.txt` - the experimentally supported lncRNA-disease association data, [downloaded](http://www.cuilab.cn/files/images/ldd/data.txt) at 01/12/2016. 329 lncRNAs (col 2), 228 diseases (col 3), 1,102 records total.
	- `data2.txt` - the exprerimentally supported lncRNA (col 2) - gene (col 3) interaction data, [downloaded](http://www.cuilab.cn/files/images/ldd/data2.txt) at 01/12/2016. 478 records.
	- `rna_seq.txt` - the RNA sequence of lncRNA, [downloaded](http://www.cuilab.cn/files/images/ldd/rna_seq.txt) at 01/12/2016.

### [db_LincSNP](http://210.46.85.180:8080/LincSNP/home.jsp) - Disease-SNP associations

List of disease-associated rsIDs from [LincSNP](http://210.46.85.180:8080/LincSNP/home.jsp) database. 

`make.sh` - will download `gwas_snp_lincrna.txt` file with a list of SNPs, extract disease-specific rsIDs into separate files in `snps` folder, striping the file names off special characters, and sorting files in place.

### [db_Maurano](http://www.sciencemag.org/content/337/6099/1190.full) - Diaseas-SNP associations

Maurano MT, Humbert R, Rynes E, Thurman RE, Haugen E, Wang H, Reynolds AP,
Sandstrom R, Qu H, Brody J, Shafer A, Neri F, Lee K, Kutyavin T, Stehling-Sun S, 
Johnson AK, Canfield TK, Giste E, Diegel M, Bates D, Hansen RS, Neph S, Sabo PJ, 
Heimfeld S, Raubitschek A, Ziegler S, Cotsapas C, Sotoodehnia N, Glass I, Sunyaev
SR, Kaul R, Stamatoyannopoulos JA. **Systematic localization of common
disease-associated variation in regulatory DNA**. Science. 2012 Sep
7;337(6099):1190-5. doi: 10.1126/science.1222794. Epub 2012 Sep 5. PubMed PMID:
22955828; PubMed Central PMCID: PMC3771521.

Classic example of the enrichment analysis in DNAse hypersensitive regions. 

- `1222794-Maurano-tableS2.txt` - [Table S2](http://www.sciencemag.org/content/suppl/2012/09/04/science.1222794.DC1/1222794-Maurano-tableS2.txt) - a list of the disease-associated SNPs used in the paper. 

### [db_Okada-Plenge](http://plaza.umin.ac.jp/~yokada/datasource/software.htm) - Curated Disease-SNP data from the GWAS catalogue

Okada Y, Wu D, Trynka G, Raj T, Terao C, Ikari K, Kochi Y, Ohmura K, Suzuki A, Yoshida S, Graham RR, Manoharan A, Ortmann W, Bhangale T, Denny JC, Carroll RJ, Eyler AE, Greenberg JD, Kremer JM, Pappas DA, Jiang L, Yin J, Ye L, Su DF, Yang J, Xie G, Keystone E, Westra HJ, Esko T, Metspalu A, Zhou X, Gupta N, Mirel D, Stahl EA, Diogo D, Cui J, Liao K, Guo MH, Myouzen K, Kawaguchi T, Coenen MJ, van  Riel PL, van de Laar MA, Guchelaar HJ, Huizinga TW, Dieudé P, Mariette X, Bridges SL Jr, Zhernakova A, Toes RE, Tak PP, Miceli-Richard C, Bang SY, Lee HS, Martin J, Gonzalez-Gay MA, Rodriguez-Rodriguez L, Rantapää-Dahlqvist S, Arlestig L, Choi HK, Kamatani Y, Galan P, Lathrop M; RACI consortium; GARNET consortium, Eyre S, Bowes J, Barton A, de Vries N, Moreland LW, Criswell LA, Karlson EW, Taniguchi A, Yamada R, Kubo M, Liu JS, Bae SC, Worthington J, Padyukov L, Klareskog L, Gregersen PK, Raychaudhuri S, Stranger BE, De Jager PL, Franke L, Visscher PM, Brown MA, Yamanaka H, Mimori T, Takahashi A, Xu H, Behrens TW, Siminovitch KA, Momohara S, Matsuda F, Yamamoto K, Plenge RM. **Genetics of rheumatoid arthritis contributes to biology and drug discovery**. Nature. 2014 Feb 20;506(7488):376-81. doi: 10.1038/nature12873. Epub 2013 Dec 25. PubMed PMID: 24390342; PubMed Central PMCID: PMC3944098.

`make.sh` - extract disease-associated SNPs into separate files in `txt` folder. 313 diseases.

### [db_omim](http://omim.org/)

Attempt to play with OMIM files

### [db_Phenuma](http://cath.gisum.uma.es:8080/Phenuma/main.jsf) Disease-Disease associations

[phenuma_networks.zip](http://cath.gisum.uma.es:8080/Phenuma/resources/networks/phenuma_networks.zip) contains three files:

- gene2gene.txt - Gene-Gene associations, many different scores
- omim2omim.txt - Disease-Disease associations, score column 5, "inferred_gene" -some NULL but most are OK. OMIM IDs
- orpha2orpha.txt - Disease-Disease associations, score column 5, "inferred_gene" some NULL but most are OK. But this is for Ophranet IDs.

### [db_Shaub-Snyder](http://genome.cshlp.org/content/22/9/1748.long) - Disease-SNP associations 

Schaub MA, Boyle AP, Kundaje A, Batzoglou S, Snyder M. **Linking disease
associations with regulatory information in the human genome**. Genome Res. 2012
Sep;22(9):1748-59. doi: 10.1101/gr.136127.111. PubMed PMID: 22955986; PubMed
Central PMCID: PMC3431491

`functional_SNPs_list.txt` - List of disease and trait-associated lead SNPs and SNPs overlapping with functional regions from RegulomeDB in LD with the lead SNPs

### [db_snps3d.org](http://www.snps3d.org/download/) Disease-Gene associations

- `Candidate_genes.xlsx` - a set of pre-compiled candidate genes for 76 selected diseases. 

### [phenotypes](https://github.com/joepickrell/phenotypes) Disease-SNP associations

JSON files with genetic score models

See [README.md](https://github.com/joepickrell/phenotypes/blob/master/README.md) in the Git repository.

### [mutationalProfiles](https://github.com/cclab-brca/mutationalProfiles)

Somatic mutation calls and ASCAT (Van Loo, P. et al. Allele-specific copy number analysis of tumors. Proc. Natl Acad. Sci. USA 107, 16910–16915 (2010)) segment files for 2,433 primary tumours. Breast cancer, with phenotype information. From open paper [Pereira et al., “The Somatic Mutation Profiles of 2,433 Breast Cancers Refines Their Genomic and Transcriptomic Landscapes.”](http://www.nature.com/ncomms/2016/160510/ncomms11479/full/ncomms11479.html)

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