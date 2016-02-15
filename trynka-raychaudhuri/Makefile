all:	H3K4me3
	for file in $</*.csv; do echo $$file; awk 'BEGIN {FS=";"; OFS="\t";} {print $$1, $$2, $$3}' $$file | sort -k1,1 -k2,2n - > `basename $$file .csv`.bed; done

H3K4me3.tar.gz:
	wget --no-check-certificate https://www.broadinstitute.org/mpg/epigwas/H3K4me3.tar.gz

H3K4me3:	H3K4me3.tar.gz
	tar xvf $<

clean:
	rm -r H3K4me3/;
	rm H3K4me3.tar.gz