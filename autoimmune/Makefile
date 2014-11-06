#all:	extractSnps
all:	overlapMatrix.txt

SHELL = bash

extractSnps:	nature13835-s1.txt
	sed '1d' nature13835-s1.txt | awk 'BEGIN {OFS="\t"} {close(fn); fn=$1".bed"; print $4, $5-1, $5, $3 >> fn}'

overlapMatrix.txt:	bed
	cd $< ; \
	for file1 in *.bed; do for file2 in *.bed; do echo -e -n $$file1'\t'$$file2; intersectBed -a $$file1 -b $$file2 | wc -l; done; done | sed 's/ \+/\t/g'> $@ ; \
	cd .. ; \
	mv bed/$@ .
