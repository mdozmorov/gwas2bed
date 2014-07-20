all:	bed

bed:	links.txt
	for file in `cat $<`; do \
		wget $$file; \
	done; \
	mkdir bed; \
	for file in *.maf; do \
		mkdir "bed/"$${file%????}; \
		cat $$file | sed '1d' | awk -v fname=$${file%????} 'BEGIN {FS=OFS="\t";} {print "chr"$$6, $$7, $$7+1, $$3, $$4, $$5 >> "bed/"fname"/"fname"_"$$4".bed";}'; \
	done; \
	rm *.maf