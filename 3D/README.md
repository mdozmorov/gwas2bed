# 3D-related datasets

### `DiStefano-Micheletti.2016`

Data from Di Stefano, M. et.al. “[Hi-C-Constrained Physical Models of Human Chromosomes Recover Functionally-Related Properties of Genome Organization.](http://www.nature.com/articles/srep35985#supplementary-information)” Scientific Reports 2016

Strongly interacting regions in IMR90 and hESC cells, 100kb resolution. Used Hi-C matrices from Dixon-Ren.

- `srep35985-s3.xls` - Tables S1 and S2 contain positions of interacting regions, row/column numbers in the Hi-C matrices.

### `Dixon-Ren.2012`

Supplementary Table 4 from Dixon, Jesse R., Siddarth Selvaraj, Feng Yue, Audrey Kim, Yan Li, Yin Shen, Ming Hu, Jun S. Liu, and Bing Ren. “[Topological Domains in Mammalian Genomes Identified by Analysis of Chromatin Interactions](http://www.nature.com/nature/journal/v485/n7398/full/nature11082.html).” Nature 485, no. 7398 (April 11, 2012): 376–80. doi:10.1038/nature11082.

- `TableS3.xls` - TAD Domains in mESC, mouse Cortex, hESC, IMR90.

- `TableS4.xls` - TAD Boundaries in mESC, mouse cortex, hESC, IMR90. mm9/hg18. [Source](http://www.nature.com/nature/journal/v485/n7398/extref/nature11082-s3.xls)


### `Heidari-Snyder.2014` 

Supplementary data from Heidari, Nastaran, Douglas H. Phanstiel, Chao He, Fabian Grubert, Fereshteh Jahanbani, Maya Kasowski, Michael Q. Zhang, and Michael P. Snyder. “[Genome-Wide Map of Regulatory Interactions in the Human Genome](http://genome.cshlp.org/content/24/12/1905/suppl/DC1).” Genome Research 24, no. 12 (December 2014): 1905–17. doi:10.1101/gr.176586.114.

- `TableS1.xlsx` - K562 cell line, 29,366 interacting pairs for six factors, H3K4me1, me2, me3, 27ac, POLR2A, RAD21. Gm12878 cell line, 20,888 interacting pairs for RAD21. hg19 genomic coordinates.


### `Hnisz-Young.2016`

Supplementary data from Hnisz, Denes, Abraham S. Weintraub, Daniel S. Day, Anne-Laure Valton, Rasmus O. Bak, Charles H. Li, Johanna Goldmann, et al. “[Activation of Proto-Oncogenes by Disruption of Chromosome Neighborhoods](http://science.sciencemag.org/content/early/2016/03/02/science.aad9024.full).” Science (New York, N.Y.) 351, no. 6280 (March 25, 2016): 1454–58. doi:10.1126/science.aad9024.

- `TableS2.xlsx` - SMC1 (cohesin) ChIA-PET interactions identified by Mango pipeline (150,306 interactions), Dowen pipeline (18,240 interactions), High confidence interactions identified in Jurkat cells but not in GM12878, HeLa, HMEC, HUVEC, IMR90, K562, KBM7 and NHEK cells (1,341 interactions, 3-column BED). [Source](http://science.sciencemag.org/highwire/filestream/675217/field_highwire_adjunct_files/6/aad9024_TableS2_160122.xlsx)

- `TableS8.xlsx` - 10,624 Constitutive neighborhoods (CTCF-CTCF loops) across three cell types (Jurkat, GM12878 and K562 cell). 13,908 anchor pairs. [Source](http://science.sciencemag.org/highwire/filestream/675217/field_highwire_adjunct_files/12/aad9024_TableS8_160122.xlsx)


### `Mifsud-Osborne.2015`

Supplementary data from Mifsud, Borbala, Filipe Tavares-Cadete, Alice N. Young, Robert Sugar, Stefan Schoenfelder, Lauren Ferreira, Steven W. Wingett, et al. “[Mapping Long-Range Promoter Contacts in Human Cells with High-Resolution Capture Hi-C.](https://www.nature.com/ng/journal/v47/n6/full/ng.3286.html#supplementary-information)” Nature Genetics 47, no. 6 (June 2015): 598–606. doi:10.1038/ng.3286.

Hi-C and Capture Hi-C of Gm12878 and CD34+ cells.

- `ng.3286-S2.xlsx` - Supplementary Tables 1-11. Particularly interesting:
    - Supplementary Table 2	- Genomic coordinates of topological domain boundaries mapped in GM12878 and CD34+ Hi-C libraries. BED format. hg19
    - Supplementary Table 7	- Interactions between promoters and GWAS SNP-containing fragments. SNP rsIDs, diseases, categories. SNP-gene associations based on interactions

### `Rao-Lieberman.2014`

Data from Rao et al., “[A 3D Map of the Human Genome at Kilobase Resolution Reveals Principles of Chromatin Looping.](http://www.sciencedirect.com/science/article/pii/S0092867414014974)”

- `mmc1.pdf` - Document S1. Extended Experimental Procedures, Data S1 and S2, and Tables S2 and S4–S8.  
- `mmc2.xlsx` - Table S1. Hi-C Experiments. Stats, and cell line descriptions
- `mmc3.xlsx` - Table S3. External Data Sets Used. URLs and names of the data tracks from ENCODE, and refs to HiC studies

Actual data are at [http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE63525](http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE63525). More data from Lieberman-Aiden lab [http://aidenlab.org/data.html](http://aidenlab.org/data.html)

### Schmitt-Ren.2016

Data from Schmitt et.al. “**A Compendium of Chromatin Contact Maps Reveals Spatially Active Regions in the Human Genome.**” Cell Reports 2016 [http://www.cell.com/cell-reports/abstract/S2211-1247(16)31481-4](http://www.cell.com/cell-reports/abstract/S2211-1247(16)31481-4)

- `mmc3.xlsx` - Compartment A/B Patterns and PC1 values. Genomic coordinates are the most interesting. For each tissue, "A" and "B" labels indicate the compartments.

- `mmc4.xlsx` - TAD boundary annotations. Each worksheet contains BED coordinates for corresponding tissue/cell type. hg19 and mm9 genome assemblies.

- `mmc6.xlsx` - Genome-wide FIRE scores. Lots of data, including ifferent studies.

- `mmc7.xlsx` - FIRE calls and sample-specific FIRE calls in the primary cohort. Tissue-specific genomic coordinates