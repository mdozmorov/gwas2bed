all:	bed

bed:	links.txt
	if [ ! -d $@ ]; then \
		mkdir $@ ; \
	fi ; \
	for file in `cat $<`; do \
		wget --directory-prefix $@/ $$file; \
	done;