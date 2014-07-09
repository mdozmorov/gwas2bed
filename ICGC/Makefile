#all:	bed
all:	tfbsEncode
#all:	ENCODE

bed:	simple_somatic_mutations.txt
	if [ ! -d $@ ]; then \
		mkdir $@ ; \
	fi ; \
	for file in `cat $<`; do \
		wget --no-check-certificate $$file; \
	done; \
	for file in *.gz; do \
		f=$${file:36:100}; mv $$file $${f/\%2F/-}; \
	done; \
	for file in *.tsv.gz; do \
		gzip -d $$file; \
	done; \
	for file in *.tsv; do \
		fname=`echo $$file | tr "." "\t"| cut -f3`; \
		cat $$file | sed '1d'| cut -f9-10 | sort | uniq | awk 'BEGIN {FS=OFS="\t";} {print "chr"$$1, $$2, $$2+1;}' | sort -k1,1 -k2,2n | uniq > $@/$$fname".bed"; \
		rm $$file; \
	done; \
	for file in $@/*; do \
		gzip $$file; \
	done

tfbsEncode:	gfs.hg19.tfbsEncode.txt
	if [ ! -d $@ ]; then \
		mkdir $@ ; \
	fi ; \
	python -m grsnp.hypergeom4 fois.txt $< ICGC.bed --run_files_dir $@

ENCODE:	gfs.hg19.ENCODE.txt
	if [ ! -d $@ ]; then \
		mkdir $@ ; \
	fi ; \
	python -m grsnp.hypergeom4 fois.txt $< ICGC.bed --run_files_dir $@
