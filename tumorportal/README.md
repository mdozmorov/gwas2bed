# Cancer genomic mutations from TumorPortal

Data from [TumorPortal](http://cancergenome.broadinstitute.org/), [Lawrence et al. Nature (2014)](http://www.nature.com/nature/journal/v505/n7484/full/nature12912.html) paper.

`make` will download *.maf files, convert them into variation type-specific .bed files and sort them into cancer-specific subfolders under 'bed' folder.

- `tumorportal_ICD9.xlsx` - Mapping of cancer types to ICD9 3- and 5-digits codes. Extensively tweaked to avoid ambigious mappings, or mapping of the same code to two different diseases. 
- `tumorportal_ICD9-3.txt` - Tab-delimited mapping of abbreviations to names and 3-digits ICD9 codes 
- `tumorportal_ICD9-5.txt` - Tab-delimited mapping of abbreviations to names and 5-digits ICD9 codes. Some ICD9 codes are missing due to ambiguity or lack of mapping
-`tumorportal_ICD9-5.sh` - Extract a subset of ICD9 5-digits codes from [the matrix of disease-disease relationships by Barabasi et.al](http://barabasilab.neu.edu/projects/hudine/resource/data/data.html).

Abbreviations

- AML - Acute myeloid leukemia
- BLCA - Bladder cancer
- BRCA - Breast cancer
- CARC - Carcinoid
- CLL - Chronic lymphocytic leukemia
- CRC - Colorectal cancer
- DLBCL - Diffuse large B-cell lymphoma
- UCEC - Endometrial cancer
- ESO - Esophageal adenocarcinoma
- GBM - Glioblastoma multiforme
- HNSC - Head and neck cancer
- KIRC - Kidney clear cell carcinoma
- LUAD - Lung adenocarcinoma
- LUSC - Lung squamous cell carcinoma
- MED - Medulloblastoma
- MEL - Melanoma
- MM - Multiple myeloma
- NB - Neuroblastoma
- OV - Ovarian cancer
- PRAD - Prostate cancer
- RHAB - Rhabdoid cancer
- PanCan - Combined cohort

# `data` folder

### [db_Alexandrov](http://www.nature.com/nature/journal/v500/n7463/full/nature12477.html) - Signatures of mutational processes in human cancer

Alexandrov LB, Nik-Zainal S, Wedge DC, Aparicio SA, Behjati S, Biankin AV,
Bignell GR, Bolli N, Borg A, Børresen-Dale AL, Boyault S, Burkhardt B, Butler AP,
Caldas C, Davies HR, Desmedt C, Eils R, Eyfjörd JE, Foekens JA, Greaves M, Hosoda
F, Hutter B, Ilicic T, Imbeaud S, Imielinski M, Jäger N, Jones DT, Jones D,
Knappskog S, Kool M, Lakhani SR, López-Otín C, Martin S, Munshi NC, Nakamura H,
Northcott PA, Pajic M, Papaemmanuil E, Paradiso A, Pearson JV, Puente XS, Raine
K, Ramakrishna M, Richardson AL, Richter J, Rosenstiel P, Schlesner M, Schumacher
TN, Span PN, Teague JW, Totoki Y, Tutt AN, Valdés-Mas R, van Buuren MM, van 't
Veer L, Vincent-Salomon A, Waddell N, Yates LR; Australian Pancreatic Cancer
Genome Initiative; ICGC Breast Cancer Consortium; ICGC MMML-Seq Consortium; ICGC 
PedBrain, Zucman-Rossi J, Futreal PA, McDermott U, Lichter P, Meyerson M,
Grimmond SM, Siebert R, Campo E, Shibata T, Pfister SM, Campbell PJ, Stratton MR.
**Signatures of mutational processes in human cancer**. Nature. 2013 Aug
22;500(7463):415-21. doi: 10.1038/nature12477. Epub 2013 Aug 14. Erratum in:
Nature. 2013 Oct 10;502(7470):258. PubMed PMID: 23945592; PubMed Central PMCID: PMC3776390.

`links.txt` - links to download cleaned mutation data.

### [db_CCG - Interactome of cancer genes](http://bioinfo.mc.vanderbilt.edu/CCG/)

- Catalogue of Cancer Genes

 - `Table_S1.xlsx` - 4,050 Cancer-associated genes

- Prorein Interactome Network (Binary interactions, Gene names, Entrez IDs, descriptions, map locations)

 - `PPIN.xlsx` - Physical Protein-Protein Interaction Network (PPIN, 113,473 PPIs)
 - `3DPPIN.xlsx` - Three-Dimensional Protein-Protein Interaction Network (3DPPIN, 4,278 3DPPIs)
 - `KSIN.xlsx` - Kinase-Substrate Interaction Network (KSIN, 7,346 KSIs)
 - `INPPIN.xslx` - INnate immunity Protein-Protein Interaction Network (INPPIN, 6,009 INPPIs)
 - `CPPIN.xlsx` - Comprehensive Protein-Protein Interaction Network (CPPIN, 474,017 CPPIs)

- Disease-Associated Genes

 - `MDG.xlsx` - Mendelian disease genes (2,716 genes)
 - `ODMG.xlsx` - Orphan disease genes (2,124 genes)
 - `Essentialgenes.xlsx` - Essential genes (2,721 genes)

### [db_Pleasance](http://www.nature.com/nature/journal/v463/n7278/full/nature08658.html)

Pleasance, E. D., Cheetham, R. K., Stephens, P. J., McBride, D. J., Humphray, S. J., Greenman, C. D., … Stratton, M. R. (2010). **A comprehensive catalogue of somatic mutations from a human cancer genome**. Nature, 463(January), 191–196. doi:10.1038/nature08658

### db_TCGA

TCGA data from multiple sources

Sebestyén E, Zawisza M, Eyras E, Zawisza M: **Recurrent alternative splicing isoform switches in tumor samples provide novel signatures of cancer**. bioRxiv 2014:1–12. [Supplementary PDF](http://nar.oxfordjournals.org/content/suppl/2015/01/10/gku1392.DC1/nar-02177-met-g-2014-File009.pdf)

- `Sebestyen_urls_RNA-seq.txt` - URLs to publicly available RNA-seq data.
- `Sebestyen_urls_SNPs.txt` - URLs to publicly available mutation data.
- [`SupplementaryFile1.zip`](http://nar.oxfordjournals.org/content/suppl/2015/01/10/gku1392.DC1/nar-02177-met-g-2014-File010.zip) - curated and QC'd lists of patient-samples used for the analysis.
- [https://figshare.com/articles/TCGA_Iso_kTSP_analysis_dataset/1061917](https://figshare.com/articles/TCGA_Iso_kTSP_analysis_dataset/1061917) - `*_gene_mutation_full.bed.gz` files have patient-specific somatic mutations

Davoli T, Xu AW, Mengwasser KE, Sack LM, Yoon JC, Park PJ, Elledge SJ: **Cumulative haploinsufficiency and triplosensitivity drive aneuploidy patterns and shape the cancer genome**. Cell 2013, 155:948–62.

- `Mutation_Dataset.txt.gz` - dataset of somatic mutations in 37 different cancers. hg19 genomic coordinates. Column names: "Gene", "Genome.position.hg19", "Reference", "Mutation", "Protein_Change", "Mutation_Type", "Tumor_Sample", "Tumor_Type". `Mutation_Dataset_counts.txt` - Number of somatic mutations per cancer type. [Source](http://elledgelab.med.harvard.edu/?page_id=689)

`make_Mutation_Dataset.sh` will extract hg19 genomic coordinates of cancer-specific somatic mutations into `Mutation_Dataset`folder. `all_mutation_dataset.bed` - 1,097,812 unique mutations total.

- `Davoli_Table_S3.xlsx` - Table S3B/S3C - ranking of oncogenes (OG) and tumor suppressor genes (TSG), respectively. Gene names, sorted by "TUSON_q_value" column. Use the top 300 TSGs (q value < 0.18) and 250OGs (q value < 0.22). [Source](http://www.sciencedirect.com/science/MiamiMultiMediaURL/1-s2.0-S0092867413012877/1-s2.0-S0092867413012877-mmc3.xlsx/272196/html/S0092867413012877/14453e605fb6374cde60de9592d46cad/mmc3.xlsx)
- `Davoli_Table_S4.xlsx` - Table S4 - Cancer-specific OGs and TSGs. [Source](http://www.sciencedirect.com/science/MiamiMultiMediaURL/1-s2.0-S0092867413012877/1-s2.0-S0092867413012877-mmc4.zip/272196/html/S0092867413012877/b49a2f6d346596010f44546c16fe61e1/mmc4.zip)
- `Davoli_Table_S5.xlsx` - Table S5A - Lists of tumor suppressor (STOP) genes, lists of essential genes (145 and 332 genes), and genes localized in regions of recurrent focal deletions or amplifications (Beroukhim et al., 2010). [Source](http://www.sciencedirect.com/science/MiamiMultiMediaURL/1-s2.0-S0092867413012877/1-s2.0-S0092867413012877-mmc5.xlsx/272196/html/S0092867413012877/67b5b6730171a63b617034b9bf8d6ec1/mmc5.xlsx)
- `Davoli_Table_S7.xlsx` - Table S7A/B - manually curated lists of TSG/OG genes, respectively. [Source](http://www.sciencedirect.com/science/MiamiMultiMediaURL/1-s2.0-S0092867413012877/1-s2.0-S0092867413012877-mmc7.xlsx/272196/html/S0092867413012877/102ba9da31942f6ccec236a565aac494/mmc7.xlsx)

# Individual data files

### [Beroukhim, R., Mermel, C. H., Porter, D., Wei, G., Raychaudhuri, S., Donovan, J., …### Meyerson, M. (2010). The landscape of somatic copy-number alteration across human cancers. Nature, 463(7283), 899–905. doi:10.1038/nature08822](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2826709/)

`Beroukhim_S2.xlsx` - 158 independent regions of significant focal SCNAs, including 76 amplifications and 82 deletions, in the pooled analysis of all our data

`Beroukhim_S5.xlsx` - Peak regions in individual cancer types but not in the pooled analysis

### [Cheng F, Jia P, Wang Q, Lin CC, Li WH, Zhao Z: Studying tumorigenesis through network evolution and somatic mutational perturbations in the cancer interactome. Mol Biol Evol 2014, 31:2156–2169.](http://mbe.oxfordjournals.org/content/31/8/2156.long)

`Cheng_S1.xlsx` - 4,050 cancer genes from Cheng study. Gene names, Entrez IDs, annotations and classifications by source. To analyze as a general pan-cancer gene set, and as subsets by source/type.

`Cheng_S11.xlsx` - dS/dN ratios for ~16K genes.

`Cheng_S18.xlsx` - 456 cancer cell metabolism genes and 154 DNA repair genes

### [Kandoth, C., McLellan, M. D., Vandin, F., Ye, K., Niu, B., Lu, C., … Ding, L. (2013). Mutational landscape and significance across 12 major cancer types. Nature, 502(7471), 333–9. doi:10.1038/nature12634](http://www.nature.com/nature/journal/v502/n7471/full/nature12634.html)

`Kandoth.xlsx` Supplementary Table 4.  Significantly mutated genes in all cancer types (pan-cancer) and 12 individual cancer types. To analyze cancer-specific genes

### [Michailidou K, Beesley J, Lindstrom S, Canisius S, Dennis J, Lush MJ, Maranian MJ, Bolla MK, Wang Q, Shah M, Perkins BJ, Czene K, Eriksson M, Darabi H, Brand JS, Bojesen SE, Nordestgaard BG, Flyger H, Nielsen SF, Rahman N, Turnbull C, Fletcher O, Peto J, Gibson L, Dos-Santos-Silva I, Chang-Claude J, Flesch-Janys D, Rudolph A, Eilber U, Behrens S, et al.: Genome-wide association analysis of more than 120,000 individuals identifies 15 new susceptibility loci for breast cancer. Nat Genet 2015](http://www.nature.com/ng/journal/v47/n4/full/ng.3242.html)

`Michailidou-S1.pdf` - Supplementary Table 3, Association results for 79 breast cancer susceptibility loci previously reported in studies of women of European ancestry. Supplementary table 3a. Association results for overall breast cancer. Supplementary Table 3b: Association results for ER-positive breast cancer. Supplementary Table 3c. Association results for ER-negative breast cancer. Supplementary Table 5 - 15 novel BC loci.    

`Michiailidou-S2.xls` - Set of all 522 SNPs correlated with 1 of the 15 lead SNPs and that could not be ruled out as potentially causal (based on a likelihood ratio of 100:1).

### [Min Zhao, Lei Ma, Yining Liu, Hong Qu (2015) Pedican: an online gene for pediatric cancers with literature evidence. scientific reports](http://pedican.bioinfo-minzhao.org/index.html)

`Pedican.txt` - All the 735 human Pediatric cancer genes with cancer types

### [Leiserson, M. D. M., Vandin, F., Wu, H.-T., Dobson, J. R., Eldridge, J. V, Niu, B., … Raphael, B. J. (2015). PanCancer Network Analysis Identifies Combinations of Rare Somatic Mutations across Pathways and Protein Complexes. Manuscript, 47(2). doi:10.1038/ng.3168](http://www.nature.com/ng/journal/v47/n2/full/ng.3168.html)

`Raphael_HotNet2.xlsx`` - a collection of tables. Tables 6-18 - genes in factor-specific networks, small lists. Table 19 - genes specific for each cancer type. Table 20 - 147 cancer-specific genes.

### [Sanchez-Garcia, F., Villagrasa, P., Matsui, J., Kotliar, D., Castro, V., Akavia, U.-D., … Pe’er, D. (2014). Integration of Genomic Data Enables Selective Discovery of Breast Cancer Drivers. Cell, 1461–1475. doi:10.1016/j.cell.2014.10.048](http://www.sciencedirect.com/science/article/pii/S0092867414013750)

`Sanchez-Garcia.xlsx` - Table S3. 119 candidate breast cancer driver genes selected by Helios, Related to Figure 7. To analyze breast cancer genes

### [Stefansson, O. a., Moran, S., Gomez, A., Sayols, S., Arribas-Jorba, C., Sandoval, J., … Esteller, M. (2014). A DNA methylation-based definition of biologically distinct breast cancer subtypes. Molecular Oncology, 1–14. doi:10.1016/j.molonc.2014.10.012](http://www.moloncol.org/article/S1574-7891(14)00261-0/addons)

`Stefansson_S2.docx` - LumiB and Basal CpG signatures from Illumina Infinium 450K

### [Stephens PJ, Tarpey PS, Davies H, Van Loo P, Greenman C, Wedge DC, Zainal SN, Martin S, Varela I, Bignell GR, Yates LR, Papaemmanuil E, Beare D, Butler A, Cheverton A, Gamble J, Hinton J, Jia M, Jayakumar A, Jones D, Latimer C, Lau KW, McLaren S, McBride DJ, Menzies A, Mudie L, Raine K, Rad R, Spencer Chapman M, Teague J, et al.: The landscape of cancer genes and mutational processes in breast cancer. Nature 2012.](http://www.nature.com.proxy.library.vcu.edu/nature/journal/v486/n7403/full/nature11017.html)

`Stephens-Stratton_nature11017-s3.xlsx` - Breast cancer somatic mutations, CNVs, genes and more.

### [Vogelstein B, Papadopoulos N, Velculescu VE, Zhou S, Diaz L a, Kinzler KW: Cancer genome landscapes. Science 2013, 339(March):1546–58.](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3749880/)

`Vogelstein.xlsx` - cancer genes from Vogelstein study. Table S2A - Driver genes affected by subtle mutations. Table S2B - Driver genes affected by amplification or homozygous deletion. Table S3A - Rearrangements in carcinomas. Table S3B - Rearrangements in Mesenchymal Tumors. Table S3C - Rearrangements in liquid tumors. Table S4 - Cancer predisposition genes.

### [Vuong H, Cheng F, Lin C-C, Zhao Z: Functional consequences of somatic mutations in cancer using protein pocket-based prioritization approach. Genome Med 2014, 6:81.](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4213513/)

`Vuong.xlsx` - 2,262 unique somatic mutations in the pocket regions of 369 unique human proteins. To analyze for epigenomic enrichments

### [Wood, L. D., Parsons, D. W., Jones, S., Lin, J., Sjöblom, T., Leary, R. J., … Vogelstein, B. (2007). The genomic landscapes of human breast and colorectal cancers. Science (New York, N.Y.), 318(November), 1108–1113. doi:10.1126/science.1145720](http://www.sciencemag.org/content/318/5853/1108.full)

`Wood-TableS3.xlsx` - All gene-centric mutations discovered in colorectal and breast cancers. Can be separated into cancer-specific

`Wood-TableS4A/4B.xlsx` - Colorectal/Breast cancer genes

### [Xie, M., Lu, C., Wang, J., McLellan, M. D., Johnson, K. J., Wendl, M. C., … Ding, L. (2014). Age-related mutations associated with clonal hematopoietic expansion and malignancies. Nature Medicine, 20(12), 1472–1478. doi:10.1038/nm.3733](http://www.nature.com/nm/journal/v20/n12/full/nm.3733.html#supplementary-information)

`Xie4.xlsx` - Supplementary Table 4. Somatic mutations in 2,241 TCGA tumor samples included in the study. Somatic mutation data are unavailable for a subset of samples. 402,271 SNPs

`Xie5.xlsx` - Supplementary Table 5. Somatic mutations in 3,355 TCGA tumor samples from 12 cancer types used for identifying recurrent mutations. 476384 SNPs

`Xie6.xlsx` - Supplementary Table 6. Recurrent somatic mutations from 12 TCGA cancer types used for hotspot analysis. 13161 SNPs.

`Xie7.xlsx` - Supplementary Table 7. 556 cancer-associated genes used in this study.

### [Zhao, X.-M., Liu, K.-Q., Zhu, G., He, F., Duval, B., Richer, J.-M., … Chen, L. (2014). Identifying cancer-related microRNAs based on gene expression data. Bioinformatics, 1–9. doi:10.1093/bioinformatics/btu811](http://bioinformatics.oxfordjournals.org/content/suppl/2014/12/11/btu811.DC1)

`Zhao_S1.docx` - miRNAs predicted by computational approaches

`Zhao_S3.xlsx` - The HRmiRs (high-rank) identified in four type of cancer datasets. 


