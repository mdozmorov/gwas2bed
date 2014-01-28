#!/usr/bin/env python
## ==================================================================
## Get GWAScatalog data from the UCSC MySQL server, 
## extract hg19 genomic coordinates in separate files 
## defined by 'title' column
##
## Usage: python gwas2bed.py [output dir]
##
## Example: python gwas2bed.py gwascatalog
## ==================================================================

import MySQLdb
import sys
import os

OUTDIR = sys.argv[1]
if not os.path.exists(OUTDIR):
    os.mkdir(OUTDIR)

conn = MySQLdb.connect(host="genome-mysql.cse.ucsc.edu", user="genomep", passwd="password", db="hg19")
c = conn.cursor()
c.execute("select distinct (trait) from gwasCatalog")
traits = [r[0] for r in c]

for trait in traits:
	# trait.replace("'","\\'")
	print trait
	c.execute("select chrom, chromStart, chromEnd, name  from gwasCatalog where trait = %s group by chrom, chromStart, chromEnd, name", [trait])
	with open(os.path.join(OUTDIR, trait.replace("'","").replace(" ","_").replace("/","-")), "w") as h:
		for row in c:
			h.write("\t".join(map(str, row)) + "\n")