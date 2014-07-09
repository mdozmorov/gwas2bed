## ==================================================================
## List of disease-associated rsIDs and corresponding lincRNAs from 
## [LincSNP](http://210.46.85.180:8080/LincSNP/home.jsp) database
## `Makefile` - downloads list of SNPs
## ToDo: Need to process this file into separate disease-specific BED files, rsIDs need to be mapped to genomic coordinates
## ==================================================================

#all:	bed
all:	tfbsEncode
#all:	ENCODE

gwas_snp_lincrna.txt:
	wget http://210.46.85.180:8080/LincSNP/download/gwas_snp_lincrna.txt

txt:	gwas_snp_lincrna.txt
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

bed:	txt
	for file in $</*; do \
		echo $$file; join -1 1 -2 4 -t "	" -o 2.1 -o 2.2 -o 2.3 -o 2.4 $$file /home/dozmorovm/db_2.00_06.10.2014/custom_data/rsid_conversion/hg19/snp138.bed > ${file%????}".bed"; \
	done

tfbsEncode:	gfs.hg19.tfbsEncode.txt
	if [ ! -d $@ ]; then \
		mkdir $@ ; \
	fi ; \
	python -m grsnp.hypergeom4 fois.txt $< all.bed --run_files_dir $@ --data_dir /home/dozmorovm/db_2.00_06.10.2014/ -g hg19

ENCODE:	gfs.hg19.ENCODE.txt
	if [ ! -d $@ ]; then \
		mkdir $@ ; \
	fi ; \
	python -m grsnp.hypergeom4 fois.txt $< ICGC.bed --run_files_dir $@
