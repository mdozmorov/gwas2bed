## ==================================================================
## List of disease-associated rsIDs and corresponding lincRNAs from 
## [LincSNP](http://210.46.85.180:8080/LincSNP/home.jsp) database
## `Makefile` - downloads list of SNPs
## ToDo: Need to process this file into separate disease-specific BED files, rsIDs need to be mapped to genomic coordinates
## ==================================================================

all:	bed

gwas_snp_lincrna.txt:
	wget http://210.46.85.180:8080/LincSNP/download/gwas_snp_lincrna.txt

bed:	gwas_snp_lincrna.txt
	if [ ! -d $@ ]; then \
		mkdir $@ ; \
	fi ; \
	cat $< | sed '1d' | awk 'BEGIN {FS=OFS="\t";} {sub(/\//, "-", $$4); print $$1 > "bed/"$$4}'; \
	for FILE in bed/*; do \
		mv -v "$$FILE" $$(echo "$$FILE" | tr ' ' '_' | tr -d '[{}(),!]' | tr -d "'" | tr -d '`' | tr '[A-Z]' '[a-z]' | sed 's/_-_/_/g').all; \
	done; \
	for file in bed/*.all; do \
		sort $$file | uniq > $${file%????}".txt" && rm $$file; \
	done