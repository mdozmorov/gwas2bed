Disease- or trait-specific SNP sets, genomic coordinates
========================================================

A collection of datasets from various publications containing genomic coordinates of disease- and/or trait-associated SNPs. And, scripts for their processing.

Each subfolder has its own README file with dataset-specific explanations.

Disease-disease associations
---

`AllNet.txt` - data from [Hidalgo CA, Blumm N, Barabasi A-L, Christakis NA. PLoS Computational Biology, 5(4):e1000353 doi:10.1371/journal.pcbi.1000353](http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1000353), available at [http://barabasilab.neu.edu/projects/hudine/resource/data/data.html](http://barabasilab.neu.edu/projects/hudine/resource/data/data.html). Co-morbidity based disease-disease similarity measures. Columns are:

- ICD-9 code disease 1
- ICD-9 code disease 2
- Prevalence disease 1
- Prevalence disease 2
- Co-ocurrence between diseases 1 and 2
- Relative Risk
- Relative Risk 99% Conf. Interval (left)
- Relative Risk 99% Conf. Interval (right)
- Phi-correlation
- t-test value

`Rzhetsky_A_Appendix3.pdf` - data from [Rzhetsky, A., Wajngurt, D., Park, N., & Zheng, T. (2007). Probing genetic overlap among complex human phenotypes. Proceedings of the National Academy of Sciences of the United States of America, 104, 11694–11699. doi:10.1073/pnas.0704820104](http://www.pnas.org/content/104/28/11694.full.pdf). A list of diseases, their ICD9 codes, and brief descriptions.

[Zhou X, Menche J, Barabási A-L, Sharma A: Human symptoms-disease network. Nat Commun 2014, 5(May):4212.](http://www.nature.com/ncomms/2014/140626/ncomms5212/full/ncomms5212.html)
---

`human-cooccur-disease-network.txt.gz` - data from [Supplementary Data 1](http://www.nature.com/ncomms/2014/140626/ncomms5212/extref/ncomms5212-s2.txt). List of all 4,442 diseases within PubMed and their occurrence.

`human-tfidf-disease-network.txt.gz` - data from [Supplementary Data 3](http://www.nature.com/ncomms/2014/140626/ncomms5212/extref/ncomms5212-s4.txt). Term co-occurrences between symptoms and diseases measured by the term frequency-inverse document frequency (TF-IDF) weighted values. This table includes 147,978 records of symptom and disease relationships.

`human-sig-disease-network.txt.gz` - data from [Supplementary Data 4](http://www.nature.com/ncomms/2014/140626/ncomms5212/extref/ncomms5212-s5.txt). List of disease links in the disease network with both significant shared symptoms and shared genes/PPIs. In total there are 133,106 such connections between 1,596 distinct diseases. 

`human-disease-to-UMLS.xlsx` - data from [Supplementary Table 6](http://www.nature.com/ncomms/2014/140626/ncomms5212/extref/ncomms5212-s7.xls). This data file includes 33,977 records of the map from HPO phenotypes to UMLS semantic types (from UMLS 2012AA).

`human-disease-to-SNOMED.xlsx` - data from [Supplementary Table 7](http://www.nature.com/ncomms/2014/140626/ncomms5212/extref/ncomms5212-s8.xls). SNOMED-CT symptom-disease relationships. The data file has six components: disease-symptom relationships, disease list, disease terms, symptom list, symptom terms and SNOMED semantic types. There are 2,340 records of disease-symptom relationships, which include 1,623 diseases and 817 symptoms. The SNOMED semantic type component lists the semantic types of concepts and their numbers in SNOMED.

`Suthram_TableS2_diseases-umls.xlsx` - data from [Supplementary Table S1](http://journals.plos.org/ploscompbiol/article/asset?unique&id=info:doi/10.1371/journal.pcbi.1000662.s004), [Sulthram-Butte paper](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000662).List of the 54 diseases, their UMLS IDs and GEO IDs.

`Suthram_TableS2_disease-relationships.xlsx` - data from [Supplementary Table S2](http://journals.plos.org/ploscompbiol/article/asset?unique&id=info:doi/10.1371/journal.pcbi.1000662.s005), [Sulthram-Butte paper](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000662). List of the 138 significant disease correlations.

[db_DiseaseConnect](http://disease-connect.org/)
---

`Disease-Disease_v1.txt` - Format: Disease 1, Disease 2, P value. The disease-disease relations are determined by the significance of the shared GWAS/OMIM/DEG genes between two diseases using hypergeometric test.

[Bulik-Sullivan B, Finucane HK, Anttila V, Gusev A, Day FR, Consortium R, Genomics Consortium P, of the Wellcome Trust Consortium GC for A, Perry JRB, Patterson N, Robinson E, Daly MJ, Price AL, Neale BM: An Atlas of Genetic Correlations across Human Diseases and Traits. bioRxiv 2015, 47:1–44.](http://www.nature.com/ng/journal/v47/n11/full/ng.3406.html#supplementary-information)
---

`atlas_24_diseases.csv` - A full table of the 1,176 genetic correlations among the 49 traits.

