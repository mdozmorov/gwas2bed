#!/usr/bin/env python2
## ==================================================================
## Get GWAScatalog data from the UCSC MySQL server, 
## extract hg19 genomic coordinates into separate files 
## defined by 'title' column. 
##
## At any time, only standard chromosome names are considered.
##
## Sort disease-associated SNP sets by size, specified by the first 
## argument to the program. If a disease has less than 15 SNPs,
## it is not recommended to run enrichment analysis on it. 
## (Trynka et al. Chromatin marks identify critical cell types 
## for fine mapping complex trait variants. Nat Genet. 2013 Feb;45(2):
## 124-30. doi: 10.1038/ng.2504).
##
## Usage: python gwas2bed.py [count]
##
## Example: python gwas2bed.py 15
##
## Output: A 'gwasCatalog-[date].bed' file with the coordinates of all
## GWAS SNPs. Two folders, 'more' and 'less', containing sets having more
## or less SNPs than the specified count.
## ==================================================================

import MySQLdb
import sys
import os
import time
from contextlib import closing
import itertools
import pdb
import shutil

def rowValid(row):
	if row[2]>row[1]:
		return row
	else:
		rowList=[]
		for item in row:
			rowList.append(item)
		rowList[2]=rowList[1]+1
		return rowList

def main():
	if os.path.exists("bed"): shutil.rmtree("bed")
	os.mkdir("bed")
	# sys.argv[1] contains number of SNPs to be considered for enrichment analysis. E.g., 5 means SNP sets larger than 5 SNPs will be considered
	if len(sys.argv) > 1:
		OUTDIRless="bed/less"+sys.argv[1]
		OUTDIRmore="bed/more"+sys.argv[1]
	else:
		print("Please, specify the count - if a set of SNPs has more SNPs than the count, it will be placed into 'more' folder")
		sys.exit()

	# Delete folders, if exist, and create empty ones
	if os.path.exists(OUTDIRless): shutil.rmtree(OUTDIRless)
	if os.path.exists(OUTDIRmore): shutil.rmtree(OUTDIRmore)
	os.mkdir(OUTDIRless)
	os.mkdir(OUTDIRmore)

	# Define legitimate chromosome names
	chromosomes=set(['chr1', 'chr10', 'chr11', 'chr12', 'chr13', 'chr14', 'chr15', 'chr16', 'chr17', 'chr18', 'chr19', 'chr2', 'chr20', 'chr21', 'chr22', 'chr3', 'chr4', 'chr5', 'chr6', 'chr7', 'chr8', 'chr9', 'chrX', 'chrY', 'chrM'])

	conn = MySQLdb.connect(host="genome-mysql.cse.ucsc.edu", user="genomep", passwd="password", db="hg19")
	with closing(conn.cursor()) as c:
		# Download chromosome-filtered GWAS catalog
		sql='select distinct chrom, chromStart, chromEnd, name, trait from gwasCatalog'
		c.execute(sql)
		h = open("gwasCatalog_" + time.strftime("%d-%m-%Y") + ".bed", "w")
		try:
			for row in c:
				if row[0] in chromosomes:
					h.write("\t".join(map(str, rowValid(row))) + "\n")
		finally:
			h.close()
		
		# Sorting trait-specific chromosome-filtered coordinates into separate files
		sql='select distinct chrom, chromStart, chromEnd, name, trait from gwasCatalog order by trait'
		c.execute(sql)
		for trait, rows in itertools.groupby(c, lambda r: r[4].lower()):
			print("Processing " + trait)
			fname=trait.replace("'","").replace(" ","_").replace("/","-").replace("&","").replace(";","_").replace("(","").replace(")","").replace("%","") + ".bed"
			with open(fname, "w") as h:
				nelements=0 # Number of SNPs in a set
				for row in rows:
					if row[0] in chromosomes:
				 		h.write("\t".join(map(str, rowValid(row))) + "\n")
				 		nelements+=1
			# Compare the number of SNPs in a set with the provided count, and move the file accordingly
			if nelements <= int(sys.argv[1]):
				shutil.move(fname, OUTDIRless)
			else:
				shutil.move(fname, OUTDIRmore)
	conn.close()

if __name__ == "__main__":
    main()

"""
	# Outputs whole GWAS catalog filtered by chromosomes into a file
	# Prepare query, modeled after https://stackoverflow.com/questions/4574609/executing-select-where-in-using-mysqldb
	args=['chr1', 'chr10', 'chr11', 'chr12', 'chr13', 'chr14', 'chr15', 'chr16', 'chr17', 'chr18', 'chr19', 'chr2', 'chr20', 'chr21', 'chr22', 'chr3', 'chr4', 'chr5', 'chr6', 'chr7', 'chr8', 'chr9', 'chrX', 'chrY', 'chrM']
	sql='select distinct chrom, chromStart, chromEnd, name, trait from gwasCatalog where chrom in (%s)'
	in_p=', '.join(list(map(lambda x: '%s', args)))
	sql = sql % in_p
	c.execute(sql, args)
	h = open(os.path.join(OUTDIR, "gwasCatalog_" + time.strftime("%d-%m-%Y") + ".bed"), "w")
	try:
		for row in c:
			h.write("\t".join(map(str, row)) + "\n")
	finally:
		h.close()

	# Sorting trait-specific chromosome-filtered coordinates into separate files
	# Works, but breaks on traits with special characters in name, like 'Lung function (forced expiratory flow between 25% and 75% of forced vital capacity)'
	c.execute("select distinct (trait) from gwasCatalog")
	traits = [r[0] for r in c]	
	for trait in traits:
		print("Processing " + trait)
		# Prepare query, modeled after https://stackoverflow.com/questions/4574609/executing-select-where-in-using-mysqldb
		args=['chr1', 'chr10', 'chr11', 'chr12', 'chr13', 'chr14', 'chr15', 'chr16', 'chr17', 'chr18', 'chr19', 'chr2', 'chr20', 'chr21', 'chr22', 'chr3', 'chr4', 'chr5', 'chr6', 'chr7', 'chr8', 'chr9', 'chrX', 'chrY', 'chrM']
		sql='select distinct chrom, chromStart, chromEnd, name, trait from gwasCatalog where chrom in (%s) and trait = ?'
		in_p=', '.join(list(map(lambda x: '%s', args)))
		sql = sql % (in_p, "'"+trait+"'")

		c.execute(sql, args)
		if len(map(str,c)) < 15:
			OUTDIRBED = os.path.join(OUTDIR, "less15")
			print("Less: " + trait)
		else:
			OUTDIRBED = os.path.join(OUTDIR, "more15")
			print("More: " + trait)
		with open(os.path.join(OUTDIRBED, trait.replace("'","").replace(" ","_").replace("/","-").replace("&","").replace(";","_")) + ".bed", "w") as h:
			for row in c:
				h.write("\t".join(map(str, row)) + "\n")
"""