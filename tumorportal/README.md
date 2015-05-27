Cancer genomic mutations from TumorPortal
=========================================

Data from [TumorPortal](http://cancergenome.broadinstitute.org/), [Lawrence et al. Nature (2014)](http://www.nature.com/nature/journal/v505/n7484/full/nature12912.html) paper.
```
make
```
will download *.maf files, convert them into variation type-specific .bed files and sort them into cancer-specific subfolders under 'bed' folder.

`tumorportal_ICD9.xlsx` - Mapping of cancer types to ICD9 3- and 5-digits codes. Extensively tweaked to avoid ambigious mappings, or mapping of the same code to two different diseases. 

`tumorportal_ICD9-3.txt` - Tab-delimited mapping of abbreviations to names and 3-digits ICD9 codes 

`tumorportal_ICD9-5.txt` - Tab-delimited mapping of abbreviations to names and 5-digits ICD9 codes. Some ICD9 codes are missing due to ambiguity or lack of mapping

`tumorportal_ICD9-5.sh` - Extract a subset of ICD9 5-digits codes from [the matrix of disease-disease relationships by Barabasi et.al](http://barabasilab.neu.edu/projects/hudine/resource/data/data.html).

Abbreviations
---------------

AML - Acute myeloid leukemia

BLCA - Bladder cancer

BRCA - Breast cancer

CARC - Carcinoid

CLL - Chronic lymphocytic leukemia

CRC - Colorectal cancer

DLBCL - Diffuse large B-cell lymphoma

UCEC - Endometrial cancer

ESO - Esophageal adenocarcinoma

GBM - Glioblastoma multiforme

HNSC - Head and neck cancer

KIRC - Kidney clear cell carcinoma

LUAD - Lung adenocarcinoma

LUSC - Lung squamous cell carcinoma

MED - Medulloblastoma

MEL - Melanoma

MM - Multiple myeloma

NB - Neuroblastoma

OV - Ovarian cancer

PRAD - Prostate cancer

RHAB - Rhabdoid cancer

PanCan - Combined cohort

`data` folder
====

[Kandoth, C., McLellan, M. D., Vandin, F., Ye, K., Niu, B., Lu, C., … Ding, L. (2013). Mutational landscape and significance across 12 major cancer types. Nature, 502(7471), 333–9. doi:10.1038/nature12634](http://www.nature.com/nature/journal/v502/n7471/full/nature12634.html)
---

**Kandoth.xlsx** Supplementary Table 4.  Significantly mutated genes in all cancer types and 12 separate cancer types

To analyze cancer-specific genes

[Sanchez-Garcia, F., Villagrasa, P., Matsui, J., Kotliar, D., Castro, V., Akavia, U.-D., … Pe’er, D. (2014). Integration of Genomic Data Enables Selective Discovery of Breast Cancer Drivers. Cell, 1461–1475. doi:10.1016/j.cell.2014.10.048](http://www.sciencedirect.com/science/article/pii/S0092867414013750)
---

**Sanchez-Garcia.xlsx** - Table S3. Candidate Driver Genes Selected by Helios, Related to Figure 7

To analyze breast cancer genes

Collection of cancer-associated genes
---

We collected a large number of cancer-associated genes from several publicly available resources. First, a total of 487 genes were downloaded from the Cancer Gene Census [PMID: 20952405] (accessed on 10 July 2013, denoted as ‘CGC genes’). CGC genes are well-curated and have been widely used as a reference gene set in many cancer-related projects [PMID: 20952405]. Second, we collected 125 cancer driver genes from Vogelstein et al. [PMID: 23539594]. Finally, we used the 4,050 cancer-associated genes from a previous study [PMID: 24881052]

**Vogelstein.xlsx** - cancer genes from Vogelstein study

**Cheng_S1.xlsx** - 4,050 cancer genes from Cheng study

**Vuong.xlsx** - 2,262 unique somatic mutations in the pocket regions of 369 unique human proteins. To analyze for epigenomic enrichments


[Xie, M., Lu, C., Wang, J., McLellan, M. D., Johnson, K. J., Wendl, M. C., … Ding, L. (2014). Age-related mutations associated with clonal hematopoietic expansion and malignancies. Nature Medicine, 20(12), 1472–1478. doi:10.1038/nm.3733](http://www.nature.com/nm/journal/v20/n12/full/nm.3733.html#supplementary-information)
---

**Xie4.xlsx** - Supplementary Table 4. Somatic mutations in 2,241 TCGA tumor samples included in the study. Somatic mutation data are unavailable for a subset of samples. 402,271 SNPs

**Xie5.xlsx** - Supplementary Table 5. Somatic mutations in 3,355 TCGA tumor samples from 12 cancer types used for identifying recurrent mutations. 476384 SNPs

**Xie6.xlsx** - Supplementary Table 6. Recurrent somatic mutations from 12 TCGA cancer types used for hotspot analysis. 13161 SNPs.

**Xie7.xlsx** - Supplementary Table 7. 556 cancer-associated genes used in this study.

[Davoli T, Xu AW, Mengwasser KE, Sack LM, Yoon JC, Park PJ, Elledge SJ. Cumulative haploinsufficiency and triplosensitivity drive aneuploidy patterns and shape the cancer genome. Cell. 2013;155:948–962. doi: 10.1016/j.cell.2013.10.011.](http://www.ncbi.nlm.nih.gov/pubmed/24183448)
---

The somatic mutation data set was downloaded from Dr. Elledge’s laboratory website at Harvard University [Web site](http://elledgelab.med.harvard.edu/?page_id=689), which contained 1,195,223 somatic mutations from 8,207 tumor samples across 30 tumor types. Somatic

**Mutation_Dataset.txt.gz** - [Mutation Dataset](http://elledgelab.med.harvard.edu/wp-content/uploads/2013/11/Mutation_Dataset.txt.zip) - Dataset of somatic mutations in cancer used for the TUSON Explorer predictions in the paper. The dataset contains the list of somatic mutations in tumors and the corresponding tumor type and tumor samples where they were found. The TCGA (The Cancer Genome Atlas) samples are identified with the tumor sample IDs.

Mutation types:
---

	  12 3'UTR
	   7 5'UTR
	 365 Complex Missense
	  23 Complex Nonsense
	  22 De_novo_Start_InFrame
	 160 De_novo_Start_OutOfFrame
	25294 Indel Frameshift
	6203 Indel In Frame
	   6 Indel Nonsense
	  27 Intron
	791744 Missense
	60488 Nonsense
	 822 Nonstop Extension
	291505 Silent
	17857 Splice Site
	 688 Translation_Start_Site

Number of SNPs per cancer type:
---

	1295 ALL
	2221 AML
	 134 Astrocytoma
	 203 Biliary Tract
	36991 Bladder Carcinoma
	55210 Breast Adenocarcinoma
	 633 CLL
	 549 Central Nersous System NS
	8989 Cervical Carcinoma
	125702 Colorectal Adenocarcinoma
	1867 Endometrial Carcinoma
	22572 Esophageal Adenocarcinoma
	23854 Glioblastoma
	66495 Head and Neck Squamous Cell Carcinoma
	8629 Hematological_NS
	1311 Kidney Chromophobe
	26850 Kidney Clear Cell Carcinoma
	  77 Kidney NS
	7904 Kidney Papillary Cell Carcinoma
	8035 Liver Hepatocellular carcinoma
	26039 Low Grade Glioma
	94748 Lung Adenocarcinoma
	1088 Lung NS
	16629 Lung Small Cell Carcinoma
	64093 Lung Squamous Cell Carcinoma
	1204 Lymphoma B-cell
	4497 Medulloblastoma
	4454 NS
	5248 Neuroblastoma
	29670 Ovarian Adenocarcinoma
	10780 Pancreatic Adenocarcinoma
	20431 Prostate Adenocarcinoma
	214338 Skin Melanoma
	 122 Soft Tissue Sarcoma
	130552 Stomach Adenocarcinoma
	6863 Thyroic Carcinoma
	164946 Uterin Carcinoma

[Stefansson, O. a., Moran, S., Gomez, A., Sayols, S., Arribas-Jorba, C., Sandoval, J., … Esteller, M. (2014). A DNA methylation-based definition of biologically distinct breast cancer subtypes. Molecular Oncology, 1–14. doi:10.1016/j.molonc.2014.10.012](http://www.moloncol.org/article/S1574-7891(14)00261-0/addons)

**Stefansson_S2.docx** - LumiB and Basal CpG signatures from Illumina Infinium 450K

[Zhao, X.-M., Liu, K.-Q., Zhu, G., He, F., Duval, B., Richer, J.-M., … Chen, L. (2014). Identifying cancer-related microRNAs based on gene expression data. Bioinformatics, 1–9. doi:10.1093/bioinformatics/btu811](http://bioinformatics.oxfordjournals.org/content/suppl/2014/12/11/btu811.DC1)

**Zhao_S1.docx** - miRNAs predicted by computational approaches

**Zhao_S3.xlsx** - The HRmiRs (high-rank) identified in four type of cancer datasets. 


[Beroukhim, R., Mermel, C. H., Porter, D., Wei, G., Raychaudhuri, S., Donovan, J., … Meyerson, M. (2010). The landscape of somatic copy-number alteration across human cancers. Nature, 463(7283), 899–905. doi:10.1038/nature08822]()

**Beroukhim_S2.xlsx** - 158 independent regions of significant focal SCNAs, including 76 amplifications and 82 deletions, in the pooled analysis of all our data

**Beroukhim_S5.xlsx** - Peak regions in individual cancer types but not in the pooled analysis

[Leiserson, M. D. M., Vandin, F., Wu, H.-T., Dobson, J. R., Eldridge, J. V, Niu, B., … Raphael, B. J. (2015). PanCancer Network Analysis Identifies Combinations of Rare Somatic Mutations across Pathways and Protein Complexes. Manuscript, 47(2). doi:10.1038/ng.3168](http://www.nature.com/ng/journal/v47/n2/full/ng.3168.html)

**Raphael_HotNet2.xlsx** - a collection of tables. Tables 6-18 - genes in factor-specific networks, small lists. Table 19 - genes specific for each cancer type. Table 20 - 147 cancer-specific genes.

[Pleasance, E. D., Cheetham, R. K., Stephens, P. J., McBride, D. J., Humphray, S. J., Greenman, C. D., … Stratton, M. R. (2010). A comprehensive catalogue of somatic mutations from a human cancer genome. Nature, 463(January), 191–196. doi:10.1038/nature08658](http://www.nature.com/nature/journal/v463/n7278/full/nature08658.html)
===

Lots of data, in the *data/Pleasance* folder.

