# `data` folder - Gene-centric information about biologically important properties of genes

- `Itan_supplemental.xlsx` - Gene Damage Index (GDI) for all protein-coding genes (S1, S7), slightly different for different categories of diseases. The larger GDI is, the more frequently it is mutated in general population and less likely to contain disease-causing mutations. [Paper](https://www.ncbi.nlm.nih.gov/pubmed/26483451), [Data Source](http://www.pnas.org/lookup/suppl/doi:10.1073/pnas.1518646112/-/DCSupplemental/pnas.1518646112.sd01.xlsx)

- `Landmark_Genes_n978.xlsx` - landmark genes capturig most of the drug response in LINCS project, [source](Landmark_Genes_n978.xlsx). These 978 genes are minimally redundant, widely expressed and can be used for inference of drug response of other genes. [Excel file download](http://www.lincscloud.org/l1000/example_files/Landmark_Genes_n978.xlsx).

- `ACMG_114.txt` - American College of Medical Genetics and Genomics (ACMG) selected 114 genes associated with clinically actionable medical conditions. Data source: manually extracted from Table 1 of the [manuscript](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3791261/)

- `ADME_core/extended/related.txt` - 32/267/74 drug-metabolizing genes, from [PharmaADME.org](http://pharmaadme.org/).

- `CancerDB_Drug_Targets.txt` - 116 drug targets genes, from [CancerDB](http://crdd.osdd.net/raghava/cancerdr/targets_browse.php) 

- `MIG_5149.xlsx` - [Additional file 3](https://static-content.springer.com/esm/art%3A10.1186%2Fs13073-015-0197-4/MediaObjects/13073_2015_197_MOESM3_ESM.xlsx) from Patwardhan et al., [“Achieving High-Sensitivity for Clinical Applications Using Augmented Exome Sequencing.”](http://genomemedicine.biomedcentral.com/articles/10.1186/s13073-015-0197-4). 5,149 medically important genes and hg19 genomic coordinates of exome regions associated with them. Defines regions of the MIG using chromosomal position information and relevant gene identifiers; the reference transcript used for gene definitions; and the sources from which the genes were drawn.


### Supplementary data from Tennessen JA, et.al. "[NHLBI Exome Sequencing Project: Evolution and functional impact of rare coding variation from deep sequencing of human exomes](https://www.ncbi.nlm.nih.gov/pubmed/22604720)". Science 2012

- `ESP_genes_with_rare_variants.txt` - gene names extracted from Table S3. Genes with unusually high proportions of rare variation.

- `ESP_genes_positive_selection.txt` - gene names extracted from Table S4. Summary information of 114 genes with signatures of positive selection.

