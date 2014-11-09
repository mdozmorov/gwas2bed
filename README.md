Disease- or trait-specific SNP sets, genomic coordinates
========================================================

A collection of datasets from various publications containing genomic coordinates of disease- and/or trait-associated SNPs. And, scripts for their processing.

Each subfolder has its own README file with dataset-specific explanations.

### AllNet.txt: Create ICD-9 code mapping to file names

Use data from [Hidalgo CA, Blumm N, Barabasi A-L, Christakis NA. PLoS Computational Biology, 5(4):e1000353 doi:10.1371/journal.pcbi.1000353](http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1000353), available at [http://barabasilab.neu.edu/projects/hudine/resource/data/data.html](http://barabasilab.neu.edu/projects/hudine/resource/data/data.html). 


1) Using EXACT names from 'gwasCatalog.txt' file, create tab-separated **cross-mapping file**, that maps disease names to [ICD-9 codes](http://www.icd9data.com/2014/Volume1/default.htm). This file should contain the following columns:

1. EXACT disease file name. Example: `age-related_macular_degeneration.bed`.
2. ICD-9 name. Example: `Macular degeneration (senile), unspecified`. N.B.: Some traits/phenotypes are not actual diseases, hence they lack ICD-9 representation. Use `NM` (no match) to label them.
3. 3-digit ICD-9 code. Example: `362`
4. Exact match (synonyms OK), Y/N. Example: `N`