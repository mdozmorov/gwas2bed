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

[Kandoth, C., McLellan, M. D., Vandin, F., Ye, K., Niu, B., Lu, C., … Ding, L. (2013). Mutational landscape and significance across 12 major cancer types. Nature, 502(7471), 333–9. doi:10.1038/nature12634](http://www.nature.com/nature/journal/v502/n7471/full/nature12634.html)
---

**Supplementary_Table_4.xlsx** Supplementary Table 4.  Significantly mutated genes in all cancer types and 12 separate cancer types

To analyze cancer-specific genes
