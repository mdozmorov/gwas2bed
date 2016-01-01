# [GRASP](http://grasp.nhlbi.nih.gov/Overview.aspx): Genome-Wide Repository of Associations Between SNPs and Phenotypes

[Download the catalog](https://s3.amazonaws.com/NHLBI_Public/GRASP/GraspFullDataset2.zip)

Columns annotated using [Glossary](http://grasp.nhlbi.nih.gov/Glossary.aspx)

Extract phenotype-specific SNPs (column 12). Subset by P-value (column 11). Note categories (column 14), need to be parsed. Potentially subset by ancestry (column 24)

Categories:

- "Gene expression (RNA)" and "Quantitative trait(s)" are the most frequent terms defining Expression QTLs (eQTLs): 707,439 results [Download the Results](http://grasp.nhlbi.nih.gov/downloads/GRASP2_eQTL_results.zip).
- "Quantitative trait(s)" and "Blood-related" are the most frequent terms defining Metabolomics QTLs (mQTLs): 232,008 results [Download the Results](http://grasp.nhlbi.nih.gov/downloads/GRASP2_metabQTL_results.zip).
- "Quantitative trait(s)" and "Methylation" are the most frequent terms defining Methylation QTLs (meQTLs): 52,419 results [Download the Results](http://grasp.nhlbi.nih.gov/downloads/GRASP2_meQTL_results.zip).
- "Quantitative trait(s)" and "Plasma" are the most frequent terms defining Glycosylation QTLs (gQTLs): 6,582 results [Download the Results](http://grasp.nhlbi.nih.gov/downloads/GRASP2_gQTL_results.zip).
- "Quantitative trait(s)" and "Protein expression" are the most frequent terms defining Protein QTLs (pQTLs): 2,142 results [Download the Results](http://grasp.nhlbi.nih.gov/downloads/GRASP2_pQTL_results.zip).
- "miRNA" and "Gene expression (RNA)" are the most frequent terms microRNA QTLs (mirQTLs): 1,260 results [Download the Results](http://grasp.nhlbi.nih.gov/downloads/GRASP2_mirQTL_results.zip).

- 1, NHLBIkey - Unique key for NHLBI GRASP db (concatenation of PMID with row # in database) (203831461, 204538422)
- 2, HUPfield - NULL field for release date in Entrez (Jan2014)
- 3, LastCurationDate - Last date that this entry was modified (8/17/12)
- 4, CreationDate - Date this entry was created in the database (8/17/12)
- 5, SNPid(dbSNP134) - The rsID in dbSNP build134 ("rs" not included) (3, 4, 8)
- 6, chr(hg19) - Human genome build 19 chromosome location of SNP (13, 7)
- 7, pos(hg19) - Human genome build 19 chromosomal position of SNP (32446842, 92408329)
- 8, PMID - PubMed identifier for paper from which the SNP association originates (20383146, 20453842)
- 9, SNPid(in paper) - The rsID or other variant identifier given in the original publication (often but not always equal to the current rsID) (rs3, rs4)
- 10, LocationWithinPaper - Place where SNP-phenotype result is located within paper (e.g., specific Table, Figure, text or Supplemental text, or extracted from Full GWAS scan results or other web-posted files) (Full Scan, Webdata) 

`cat GRASP2fullDataset | sed '1d' | cut -f10 | sort | uniq -c | sort -k1 -r`

	2620470 FullScan
	2449833 FullData
	 767384 Full Data
	 727508 Full Scan
	 617337 TableS1
	 246201 Table S1
	 230798 SuppDatabase
	 ...

- 11, Pvalue - P-value for SNP-phenotype association (3.4e-02, 0.0209937)

`head -n 10000 GRASP2fullDataset | sed '1d' | cut -f11 | histogram.py`

	# NumSamples = 9999; Min = 0.00; Max = 0.05
	# Mean = 0.016081; Variance = 0.000265; SD = 0.016279; Median 0.010773
	# each ∎ represents a count of 53
	    0.0000 -     0.0050 [  4013]: ∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎
	    0.0050 -     0.0100 [   884]: ∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎
	    0.0100 -     0.0150 [   696]: ∎∎∎∎∎∎∎∎∎∎∎∎∎
	    0.0150 -     0.0200 [   663]: ∎∎∎∎∎∎∎∎∎∎∎∎
	    0.0200 -     0.0250 [   631]: ∎∎∎∎∎∎∎∎∎∎∎
	    0.0250 -     0.0300 [   627]: ∎∎∎∎∎∎∎∎∎∎∎
	    0.0300 -     0.0350 [   614]: ∎∎∎∎∎∎∎∎∎∎∎
	    0.0350 -     0.0400 [   654]: ∎∎∎∎∎∎∎∎∎∎∎∎
	    0.0400 -     0.0450 [   612]: ∎∎∎∎∎∎∎∎∎∎∎
	    0.0450 -     0.0500 [   605]: ∎∎∎∎∎∎∎∎∎∎∎

- 12, Phenotype - Phenotype description of SNP-phenotype (Chronic kidney disease, Rheumatoid arthritis)
- 13, PaperPhenotypeDescription - Description of the overall phenotype(s) focus of the paper (Chronic kidney disease (CKD) and renal traits, Rheumatoid arthritis)
- 14, PaperPhenotypeCategories - Categories assigned by NHLBI to the overall phenotype(s) focus of the paper (Renal;Chronic kidney disease;Quantitative trait(s), Inflammation;Arthritis;Rheumatoid arthritis)
- 15, DatePub - Date of publication (based on either PubMed, NHGRI catalog, or abstracted from paper PDF) (4/11/2010, 5/9/2010)
- 16, InNHGRIcat(as of 3/31/12) - included in GWAScatalog (y, n)
- 17, Journal - Journal where paper was published (Nat Genet, Nature)
- 18, Title - Manuscript title
- 19, IncludesMale/Female Only Analyses - Does the paper include either SOME or ALL analyses that are gender-specific? (i.e., GWAS and/or replication sample is all male or female) (y, n)
- 20, Exclusively Male/Female - Does the paper include ONLY analyses that are gender-specific? (i.e., all GWAS and/or replication samples are a single gender) (y, n)
- 21, Initial Sample Description - Sample size and demographic description for initial stage/discovery GWAS (Up to 67093 EA individuals)
- 22, Replication Sample Description - Replication sample size and demographic description (NR = none reported) (Up to 22982 EA individuals)
- 23, Platform [SNPs passing QC] - Description of genotyping and/or imputation platform(s) and number of SNP markers (specified or approximated) included in post-QC analyses (Affymetrix & Illumina [~2.5 million] (imputed))
- 24, GWASancestryDescription - Ethnodemographic description of the paper population(s) (e.g., European, Mixed)
- 25, TotalSamples(discovery+replication) - Total number of analyzed samples in discovery + replication phases (90075, 41282)
- 26, TotalDiscoverySamples - Total number of analyzed samples in discovery phase (67093, 25708)
- European Discovery - Total number of analyzed samples in replication phase
- African Discovery
- East Asian Discovery
- Indian/South Asian Discovery
- Hispanic Discovery
- Native Discovery
- Micronesian Discovery
- Arab/ME Discovery
- Mixed Discovery
- Unspecified Discovery
- Filipino Discovery
- Indonesian Discovery
- Total replication samples
- European Replication
- African Replication
- East Asian Replication
- Indian/South Asian Replication
- Hispanic Replication
- Native Replication
- Micronesian Replication
- Arab/ME Replication
- Mixed Replication
- Unspecified Replication
- Filipino Replication
- Indonesian Replication
- 52, InGene - Is the SNP entry within a transcribed region of 1 or more RefSeq protein coding genes? ( (EEF1DP3) )
- 53, NearestGene
- 54, InLincRNA - Is the SNP entry within a transcribed region of 1 or more long intergenic noncoding RNA?
- 55, InMiRNA - Is the SNP entry within a transcribed region of 1 or more microRNA?
- 56, InMiRNABS - Is the SNP within 1 or more predicted microRNA binding site(PolyMiRTS v.2)? ((rs1099(miR-561);(NM_207582,BC068585);(disrupts non-conserved site)))
- 57, dbSNPfxn (Intron, Synonymous, Nonsense, Missense, Frameshift), can be comma-separated
- 58, dbSNPMAF - What is the global minor allele frequency (GMAF) for the given allele in dbSNP (T;0.082, C;0.2001)
- 59, dbSNPalleles/het/se - Observed dbSNP alleles, overall het +/- s.e. (C/T;0.134821;0.221887, -/GTCAGTATCAATTCTGGAAGAATTTCCAGACA;0;0)
- 60, dbSNPvalidation - Does SNP have some level of validation in dbSNP? (YES)
- 61, dbSNPClinStatus - Has dbSNP annotated SNP for clinical relevance? (untested, drug-response)
- 62, ORegAnno - Is the SNP within a literature-derived functional regulatory region (ORegAnno database)? ( Feature start:end=5248212:5248717(OREG0003733:REGULATORY REGION;HBB;;Stanford ENCODE Dataset;Transient transfection luciferase assay;;12566409;) )
- 63, ConservPredTFBS - Cross-mammal conserved predicted transcription factor binding sites from Hidden Markov Models (z-scores >= 3.0) ( (consTFBS:score(925);z(3.31);strand(+);tf(FOXJ2)) )
- 64, HumanEnhancer - Is the SNP within a positively validated human enhancer region (from the VistaEnhancers dataset)?
- 65, RNAedit - Is the SNP within an RNA editing site from the DARNED database?
- 66, PolyPhen2 - Does the SNP have a prediction result in PolyPhen2? If so, what is the result? (uc003uns.2:Q192R;A>G;benign;0.001;0.94;0.996)
- 67, SIFT - Does the SNP have a prediction result in SIFT? If so, what is the result? ( N583D:(N>D);(0.49>0.64);(TOLERATED>TOLERATED) )
- 68, LS-SNP
- 69, UniProt - Is the SNP within an annotated protein functional region from UniProtKB (e.g., post-translational modification protein site, enzyme active site)? ( (THS7A;TOPO_DOM;48-1607;Extracellular (Potential).);(THS7A;CONFLICT;583-583;N -> D (in Ref. 3; BAA76804).) )
- 70, EqtlMethMetabStudy - Indicates if a result is from an eQTL, methylation QTL or metabolomics GWAS (1=yes) and thus not included in web interface queries


