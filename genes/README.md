# `data` folder - Gene-centric information about biologically important properties of genes

- `Itan_supplemental.xlsx` - Gene Damage Index (GDI) for all protein-coding genes (S1, S7), slightly different for different categories of diseases. The larger GDI is, the more frequently it is mutated in general population and less likely to contain disease-causing mutations. [Paper](https://www.ncbi.nlm.nih.gov/pubmed/26483451), [Data Source](http://www.pnas.org/lookup/suppl/doi:10.1073/pnas.1518646112/-/DCSupplemental/pnas.1518646112.sd01.xlsx)

- `Landmark_Genes_n978.xlsx` - landmark genes capturing most of the drug response in LINCS project, [source](Landmark_Genes_n978.xlsx). These 978 genes are minimally redundant, widely expressed and can be used for inference of drug response of other genes. [Excel file download](http://www.lincscloud.org/l1000/example_files/Landmark_Genes_n978.xlsx).

- `ACMG_114.txt` - American College of Medical Genetics and Genomics (ACMG) selected 114 genes associated with clinically actionable medical conditions. Data source: manually extracted from Table 1 of the [manuscript](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3791261/)

- `ADME_core/extended/related.txt` - 32/267/74 drug-metabolizing genes, from [PharmaADME.org](http://pharmaadme.org/).

- `ENCODE_ChIPseqTargets_Promoters.gmt` - Genes regulated by a given transcription factor (Transcription Factor Target Gene Set). 168 TFs. From [CRAFTT, Computational drug-Repositioning Approach For Targeting Transcription factors](http://physiology.med.cornell.edu/faculty/elemento/lab/data/CRAFTT/downloads.html), a drug repositioning tool by Olivier Elemento group

- `ESTIMATE_immune_stromal.xlsx` - Immune-stromal gene signatures. 141 genes in each signature, upregulated. From [Yoshihara, Kosuke et al. “Inferring Tumour Purity and Stromal and Immune Cell Admixture from Expression Data.” Nature Communications 2013](http://www.nature.com/articles/ncomms3612#supplementary-information)

- `Genes_Glycosylation and Coagulation Genes.xlsx` - Coagulation, Heparan Sulfate Biosynthesis, N-Linked Glycosylation, O-Linked Glycosylation, Glycosylation genes

- `MIG_5149.xlsx` - [Additional file 3](https://static-content.springer.com/esm/art%3A10.1186%2Fs13073-015-0197-4/MediaObjects/13073_2015_197_MOESM3_ESM.xlsx) from Patwardhan et al., [“Achieving High-Sensitivity for Clinical Applications Using Augmented Exome Sequencing.”](http://genomemedicine.biomedcentral.com/articles/10.1186/s13073-015-0197-4). 5,149 medically important genes and hg19 genomic coordinates of exome regions associated with them. Defines regions of the MIG using chromosomal position information and relevant gene identifiers; the reference transcript used for gene definitions; and the sources from which the genes were drawn.

- `NCG_5_0.tsv` - the list of 1,571 prote3in-coding cancer genes from the Network of Cancer Genes, NCG5.0, downloaded from [http://ncg.kcl.ac.uk/download.php](http://ncg.kcl.ac.uk/download.php)

### Supplementary data from Bartha, István, Julia di Iulio, J. Craig Venter, and Amalio Telenti. “Human Gene Essentiality.” Nature Reviews Genetics 19, no. 1 (October 30, 2017): 51–62. https://doi.org/10.1038/nrg.2017.75. https://www.nature.com/articles/nrg.2017.75#supplementary-information

- `Essential_genes_human_nrg.2017.75-s2.xlsx` - all genes (Ensembl IDs) scored for essentiality using different metrics. "Missense Z-score" metric performs best, Higher value = more intolerant.

- `Essential_genes_nrg.2017.75-s3.txt` - Essential genes and the associated diseases. Genes characterized by "number_of_pathogenic_variants"	"invivo_essential"	"invitro_essential"	"mice_essential".

- http://www.essentialgene.org/ - the database of essential genes, for multiple organisms


### Supplementary data from Tennessen JA, et.al. "[NHLBI Exome Sequencing Project: Evolution and functional impact of rare coding variation from deep sequencing of human exomes](https://www.ncbi.nlm.nih.gov/pubmed/22604720)". Science 2012

- `ESP_genes_with_rare_variants.txt` - gene names extracted from Table S3. Genes with unusually high proportions of rare variation.

- `ESP_genes_positive_selection.txt` - gene names extracted from Table S4. Summary information of 114 genes with signatures of positive selection.

### `db.Ghiassian`

Ghiassian, Susan Dina, Jörg Menche, and Albert-László Barabási. “A DIseAse MOdule Detection (DIAMOnD) Algorithm Derived from a Systematic Analysis of Connectivity Patterns of Disease Proteins in the Human Interactome.” Edited by Andrey Rzhetsky. PLOS Computational Biology 11, no. 4 (April 8, 2015): e1004120. doi:10.1371/journal.pcbi.1004120. - Significance of connectivity, instead of density. Applied to 70 diseases. Used in the combined network of interactions. http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004120

- `journal.pcbi.1004120.s003.TSV` - S1 data. Interactome - 141,297 interactions  
- `journal.pcbi.1004120.s004.TSV` - S2 Data. Disease gene association data for 70 diseases.  
- `journal.pcbi.1004120.s005.PY` - S1 Code. A python implementation of the DIAMOnD algorithm.

