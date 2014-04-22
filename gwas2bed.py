#!/usr/bin/env python2
## ==================================================================
## Get GWAScatalog data from the UCSC MySQL server, 
## extract hg19 genomic coordinates into separate files 
## defined by 'title' column
##
## Sort disease-associated SNP sets by size. If a disease has 15 SNPs
## or less, it is not recommended to run enrichment analysis on it,
## and the file is coplied into 'less15' folder, otherwise, into 'more15'
## folder (Trynka et al. Chromatin marks identify critical cell types 
## for fine mapping complex trait variants. Nat Genet. 2013 Feb;45(2):
## 124-30. doi: 10.1038/ng.2504).
##
## Remove special characters from file names
##
## Usage: python gwas2bed.py [output dir]
##
## Example: python gwas2bed.py gwascatalog
##
## Output: A [output dir] folder containing .BED file with genomic
## coordinates of all SNPs from GWAScatalog, and two subfolders,
## "less15" and "more15", each containing .BED files with coordinates of
## less than or more than 15 trait-specific SNPs, respectively.
## ==================================================================

import MySQLdb
import sys
import os
import time
from contextlib import closing

OUTDIR = sys.argv[1]
if not os.path.exists(OUTDIR):
	os.mkdir(OUTDIR)
	os.mkdir(os.path.join(OUTDIR, "less15"))
	os.mkdir(os.path.join(OUTDIR, "more15"))

conn = MySQLdb.connect(host="genome-mysql.cse.ucsc.edu", user="genomep", passwd="password", db="hg19")
with closing(conn.cursor()) as c:
	c.execute("select distinct chrom, chromStart, chromEnd, name, trait from gwasCatalog group by trait")
	h = open(os.path.join(OUTDIR, "gwasCatalog_" + time.strftime("%d-%m-%Y") + ".bed"), "w")
	try:
		for row in c:
			h.write("\t".join(map(str, row)) + "\n")
	finally:
		h.close()

	c.execute("select distinct (trait) from gwasCatalog")
	traits = [r[0] for r in c]	
	for trait in traits:
		c.execute("select distinct chrom, chromStart, chromEnd, name  from gwasCatalog where trait = %s group by chrom, chromStart, chromEnd, name", [trait])
		if len(map(str,c)) < 15:
			OUTDIRBED = os.path.join(OUTDIR, "less15")
			print("Less: " + trait)
		else:
			OUTDIRBED = os.path.join(OUTDIR, "more15")
			print("More: " + trait)
		with open(os.path.join(OUTDIRBED, trait.replace("'","").replace(" ","_").replace("/","-").replace("&","").replace(";","_")) + ".bed", "w") as h:
			for row in c:
				h.write("\t".join(map(str, row)) + "\n")
conn.close()