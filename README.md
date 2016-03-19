Disease- or trait-specific SNP sets, genomic coordinates
========================================================

A collection of datasets from various publications containing genomic coordinates of disease- and/or trait-associated SNPs. And, scripts for their processing.

## Autoimmune diseases

- `autoimmune` folder. Description of autoimmune-related genomics datasets. `R.GR.autoimmune` - working folder with an R project for the analysis of 39 disease/trait-associated SNP sets.

- `gwasCatalog` folder. Scripts to extract the coordinates of disease-specific SNP sets into separate files. Description of genomics datasets and databases related to complex diseases.

- `tumorportal` folder. Description of genomics datasets and databases related to cancers.

- `population` folder. Individual-specific genotypes of various populations. See README.md there.

Large data collections are in the `data` subfolders of the **`autoimmune`**, `gwasCatalog`, and `tumorportal` folders. Each subfolder has its own README file with the dataset-specific explanations.

# Disease-disease similarities

### [Hidalgo CA, Blumm N, Barabasi A-L, Christakis NA. PLoS Computational Biology, 5(4):e1000353 doi:10.1371/journal.pcbi.1000353](http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1000353)

Co-morbidity based disease-disease similarity measures.

`AllNet.txt` - data from [http://barabasilab.neu.edu/projects/hudine/resource/data/data.html](http://barabasilab.neu.edu/projects/hudine/resource/data/data.html).  Columns are: "ICD-9 code disease 1", "ICD-9 code disease 2", "Prevalence disease 1", "Prevalence disease 2", "Co-ocurrence between diseases 1 and 2", "Relative Risk", "Relative Risk 99% Conf. Interval (left)", "Relative Risk 99% Conf. Interval (right)", "Phi-correlation", "t-test value"


### [Zhou X, Menche J, Barabási A-L, Sharma A: Human symptoms-disease network. Nat Commun 2014, 5(May):4212.](http://www.nature.com/ncomms/2014/140626/ncomms5212/full/ncomms5212.html)

Disease-disease similarity based on symptom similarity.

`human-cooccur-disease-network.txt.gz` - data from [Supplementary Data 1](http://www.nature.com/ncomms/2014/140626/ncomms5212/extref/ncomms5212-s2.txt). List of all 4,442 diseases within PubMed and their occurrence. `zcat < human-cooccur-disease-network.txt.gz | sort -k2 -n -r > human-cooccur-disease-names.txt` - which diseases are the most frequently studied.

`human-sig-disease-network.txt.gz` - data from [Supplementary Data 4](http://www.nature.com/ncomms/2014/140626/ncomms5212/extref/ncomms5212-s5.txt). List of disease links in the disease network with both significant shared symptoms and shared genes/PPIs. In total there are 133,106 such connections between 1,596 distinct diseases. The table has 3 columns: "MeSH Disease Term", "MeSH Disease Term", "symptom similarity score". 

`human-disease-to-UMLS.xlsx` - data from [Supplementary Table 6](http://www.nature.com/ncomms/2014/140626/ncomms5212/extref/ncomms5212-s7.xls). This data file includes 33,977 records of the map from HPO phenotypes to UMLS semantic types (from UMLS 2012AA). 33,977 records. 

`human-disease-to-SNOMED.xlsx` - data from [Supplementary Table 7](http://www.nature.com/ncomms/2014/140626/ncomms5212/extref/ncomms5212-s8.xls). SNOMED-CT symptom-disease relationships. The data file has six components: disease-symptom relationships, disease list, disease terms, symptom list, symptom terms and SNOMED semantic types. There are 2,340 records of disease-symptom relationships, which include 1,623 diseases and 817 symptoms. The SNOMED semantic type component lists the semantic types of concepts and their numbers in SNOMED.


### [Suthram S, Dudley JT, Chiang AP, Chen R, Hastie TJ, Butte AJ: Network-based elucidation of human disease similarities reveals common functional modules enriched for pluripotent drug targets. PLoS Comput Biol 2010, 6:1–10.](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000662)

Disease-disease relationships based on gene/protein interaction networks.

`Suthram_TableS2_diseases-umls.xlsx` - data from [Supplementary Table S1](http://journals.plos.org/ploscompbiol/article/asset?unique&id=info:doi/10.1371/journal.pcbi.1000662.s004). List of 54 diseases, their UMLS IDs and GEO IDs.

`Suthram_TableS2_disease-relationships.xlsx` - data from [Supplementary Table S2](http://journals.plos.org/ploscompbiol/article/asset?unique&id=info:doi/10.1371/journal.pcbi.1000662.s005). List of the 138 significant disease-disease correlations. Other correlations are not significant.


### [Liu CC, Tseng YT, Li W, Wu CY, Mayzus I, Rzhetsky A, Sun F, Waterman M, Chen JJW, Chaudhary PM, Loscalzo J, Crandall E, Zhou XJ: DiseaseConnect: A comprehensive web server for mechanism-based disease-disease connections. Nucleic Acids Res 2014, 42:137–146.](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3865418/)

Data from [disease-connect.org](http://disease-connect.org/) is in the `db_DiseaseConnect` folder.

`Disease-Disease_v1.txt` - Format: Disease 1, Disease 2, P value. The disease-disease relations are determined by the significance of the shared GWAS/OMIM/DEG genes between two diseases using hypergeometric test. 83,666 statistically significant (p<0.05) disease-disease relationships.


### [Bulik-Sullivan B, Finucane HK, Anttila V, Gusev A, Day FR, Consortium R, Genomics Consortium P, of the Wellcome Trust Consortium GC for A, Perry JRB, Patterson N, Robinson E, Daly MJ, Price AL, Neale BM: An Atlas of Genetic Correlations across Human Diseases and Traits. bioRxiv 2015, 47:1–44.](http://www.nature.com/ng/journal/v47/n11/full/ng.3406.html#supplementary-information)

Disease-disease similarities based on genomics information, on cross-trait LD score regression.

`atlas_24_diseases.txt` - A full table of the 1,176 genetic correlations among the 49 traits. Columns are: "Trait1", "Trait2", "rg", "se", "z", "p". Incomplete pair-wise comparisons. Names of the diseases are outputted in `sed '1d' atlas_24_diseases.txt | cut -f1 | sort | uniq -c | sort -n -k1 -r > atlas_24_diseases-names.txt`.

# Miscellaneous

### [Rzhetsky, A., Wajngurt, D., Park, N., & Zheng, T. (2007). Probing genetic overlap among complex human phenotypes. Proceedings of the National Academy of Sciences of the United States of America, 104, 11694–11699. doi:10.1073/pnas.0704820104](http://www.pnas.org/content/104/28/11694.full.pdf)

`Rzhetsky_A_Appendix3.pdf` - A list of diseases, their ICD9 codes, and brief descriptions.

`FinalPhenotypes_new.txt` - Diseases and corresponding ICD9 codes/strings

