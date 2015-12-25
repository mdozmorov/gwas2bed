# Cancer somatic mutations from ICGC data portal. Patient-specific mutations and their characteristics.

Data source: [https://dcc.icgc.org/releases/current/Projects/](https://dcc.icgc.org/releases/current/Projects/)

Subfolder for each cancer-related project has several files. Information about clinical samples also available.

`simple_somatic_mutations.txt` - descriptions and links to lists of simple somatic mutations. `make` will download, extract hg19 genomic coordinates of all cancer-specific somatic mutations, and save them into cancer-specific BED files. As of 12/25/2015, there's 66 datasets