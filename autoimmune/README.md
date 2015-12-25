# `data` folder

### [db_delRosario](http://www.nature.com/nmeth/journal/v12/n5/full/nmeth.3326.html) - regulatory SNPs associated with autoimmune diseases.

del Rosario RC-H, Poschmann J, Rouam SL, Png E, Khor CC, Hibberd ML, Prabhakar S: **Sensitive detection of chromatin-altering polymorphisms reveals autoimmune disease mechanisms**. Nat Methods 2015, 12.

`nmeth.3326-S2.xlsx` - Supplementary Table 3: List of SNPs that are haQTLs. The table contains the hg19 coordinates of the haQTLs, the raw P-values, the FDR Q-values and the parameters ascertained by the G-SCI test.

`nmeth.3326-S3.xlsx` - Supplementary Table 5: List of autoimmune GWAS SNPs. Sheet 1 (GWAS SNPs in LD with QTLs): autoimmune GWAS SNPs that are in strong LD with the regulatory QTL sets. Sheet 2 (All GWAS SNPs): the 831 autoimmune GWAS SNPS used in the analysis, 79 diseases.

### [db_Farh](http://www.nature.com/nature/journal/vaop/ncurrent/pdf/nature13835.pdf) - SNPs associated with 39 diseases

Farh KK-H, Marson A, Zhu J, Kleinewietfeld M, Housley WJ, Beik S, Shoresh N, Whitton H, Ryan RJH, Shishkin A a., Hatan M, Carrasco-Alfonso MJ, Mayer D, Luckey CJ, Patsopoulos N a., De Jager PL, Kuchroo VK, Epstein CB, Daly MJ, Hafler D a., Bernstein BE: **Genetic and epigenetic fine mapping of causal autoimmune disease variants**. Nature 2014

`nature13835-s1.xls` - hg19 genomic coordinates of 39 disease-associated SNPs.

`make` will extract disease-specific SNPs into separate BED files. It also contains a command for making pair-wise overlap counts, stored in `overlapMatrix.txt` file.

### [db_Immunobase](http://www.immunobase.org/page/Welcome/display) - Disease-associated SNPs and genes

20 autoimmune diseases, downloaded on 12/24/2015. `urls.txt` - links for download. `make.sh` - download files and extract genomic coordinates of SNPs and EntrezIDs of genes

### [db_Immunobase_ic](https://www.immunobase.org/downloads/protected_data/iChip_Data/) - Association Statistics from ImmunoChip Studies

9 autoimmune diseases. Full summary statistics, hg19 genomic coordinates.

### [db_lincRNA-autoimmune](http://genomemedicine.com/content/6/10/88) - Protein-coding and lincRNA regions associated with nine autoimmune diseases

Hrdlickova, B., Kumar, V., Kanduri, K., Zhernakova, D. V, Tripathi, S., Karjalainen, J., … Withoff, S. (2014). **Expression profiles of long non-coding RNAs located in autoimmune disease-associated regions reveal immune cell-type specificity**. Genome Medicine, 6(10), 88. doi:10.1186/s13073-014-0088-0

- `s13073-014-0088-0-s2.xlsx` - [Additional file 2: Table S1](http://genomemedicine.com/content/supplementary/s13073-014-0088-0-s2.xlsx) - List of loci associated with nine autoimmune diseases. For each disease phenotype, the table shows a list of loci including additional information like chromosome position (Chr), genome coordinates of the beginning in human genome build 19 (Start position (hg19)) and of the end (End position (hg19)) of each locus, the size of the locus in base pairs (Locus size [bp]) and the label of the disease loci (AID loci ID).

Potentially interesting is [Additional file 5: Table S3](http://genomemedicine.com/content/supplementary/s13073-014-0088-0-s5.xlsx) - AID loci annotated with genes and listed by disease phenotype. Can be parsed into disease-specific sets.

### [db_Sjogren](http://www.nature.com/articles/srep18855) - Sjogren's syndrome associated genes

Fang K, Zhang K, Wang J. **Network-assisted analysis of primary Sjögren's
syndrome GWAS data in Han Chinese**. Sci Rep. 2015 Dec 21;5:18855. doi:
10.1038/srep18855. PubMed PMID: 26686423.

`Sjogren_genes.xlsx` - 71 Sjogren's associated genes, obtained using PPI. hg19 genomic coordinates

### [db_SLE_methylation](http://www.sciencedirect.com/science/article/pii/S0896841115000050)

Coit P, Yalavarthi S, Ognenovski M, Zhao W, Hasni S, Wren JD, Kaplan MJ, Sawalha AH. **Epigenome profiling reveals significant DNA demethylation of interferon signature genes in lupus neutrophils**. J Autoimmun. 2015 Apr;58:59-66. doi: 10.1016/j.jaut.2015.01.004. Epub 2015 Jan 28. PubMed PMID: 25638528; PubMed Central PMCID: PMC4363276.

Illumina 450K. Peripheral blood

There were a total of 293 differentially methylated CG sites, with 199 (68%) hypomethylated (`sle_hypomethylated_cpg.txt`) and 94 (32%) hypermethylated (`sle_hypermethylated_cpg.txt`) in lupus neutrophils (`mmc1.docx` and `mmc1.pdf` - Supplementary Table S1).
