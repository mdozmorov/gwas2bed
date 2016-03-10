all:	dmr_sz_bp

dmr_sz_bp:
	if [ ! -d $@ ]; then \
		mkdir $@ ; \
	fi ; \
	wget http://downloads.hindawi.com/journals/bmri/aa/201587.f1.zip ; \
	mv 201587.f1.zip $@ ; \
	cd $@ ; \
	unzip 201587.f1.zip ; \
	find . -type f -not -name "*[1|3].xls" | xargs -I{} rm {}
# for file in *.bed; do liftOver $file hg18ToHg19.over.chain.gz ${file/%.bed/}_hg19.bed ${file/%.bed/}_hg19_unmapped.bed; done
# find . -type f -not -name "*hg19.bed" | xargs rm