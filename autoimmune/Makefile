#all:	extractSnps
#all:	overlapMatrix.txt
#all:	make-matrix
all:	overlapJaccard-long.txt

SHELL = bash

extractSnps:	nature13835-s1.txt
	sed '1d' nature13835-s1.txt | awk 'BEGIN {OFS="\t"} {close(fn); fn=$1".bed"; print $4, $5-1, $5, $3 >> fn}'

overlapMatrix.txt:	bed
	cd $< ; \
	for file1 in *.bed; do for file2 in *.bed; do echo -e -n $$file1'\t'$$file2; intersectBed -a $$file1 -b $$file2 | wc -l; done; done | tr -s ' ' | tr ' ' '\t' > $@ ; \
	cd .. ; \
	mv bed/$@ .

make-matrix:	bed
	cd $<; \
	parallel "bedtools jaccard -a {1} -b {2} \
	         | awk 'NR>1' \
	         | cut -f 3 \
	         > {1}.{2}.jaccard" \
	         ::: *.bed ::: *.bed

overlapJaccard-long.txt:	bed
	cd $<; \
	find . | grep jaccard | xargs grep "" | perl -pi -e "s/.bed./.bed\t/" | perl -pi -e "s/.jaccard:/\t/" | sed 's/.\///' > ../$@

overlapJaccard-wide.txt:
	awk 'NF==3' overlapJaccard-long.txt | python make-matrix.py > overlapJaccard-wide.txt

gfs:
	find /home/genomerunner/db_3.00_12-01-2014/grsnp_db/hg19/ENCODE/ -type f -name *Tfbs*.bed.gz > gfs_Tfbs.txt ; \
	find /home/genomerunner/db_3.00_12-01-2014/grsnp_db/hg19/ENCODE/ -type f -name *Histone*.bed.gz > gfs_Histone.txt ; \
	find /home/genomerunner/db_3.00_12-01-2014/grsnp_db/hg19/ENCODE/ -type f -name "*Dnase*.bed.gz" > gfs_Dnase.txt ; \
	find /home/genomerunner/db_3.00_12-01-2014/grsnp_db/hg19/ENCODE/ -type f -name "*Dgf*.bed.gz" > gfs_Dgf.txt ; \
	find /home/genomerunner/db_3.00_12-01-2014/grsnp_db/hg19/Roadmap/broadPeak/ -type f -name *.bed.gz > gfs_broadPeaks.txt ; \
	find /home/genomerunner/db_3.00_12-01-2014/grsnp_db/hg19/Roadmap/narrowPeak/ -type f -name *.bed.gz > gfs_narrowPeaks.txt ; \
	find /home/genomerunner/db_3.00_12-01-2014/grsnp_db/hg19/Roadmap/gappedPeak/ -type f -name *.bed.gz > gfs_gappedPeaks.txt ; \
	find /home/genomerunner/db_3.00_12-01-2014/grsnp_db/hg19/Roadmap/DNase_hotspotall/ -type f -name *.bed.gz > gfs_DNase_hotspotall.txt ; \
	find /home/genomerunner/db_3.00_12-01-2014/grsnp_db/hg19/Roadmap/DNase_hotspot01/ -type f -name *.bed.gz > gfs_DNase_hotspot01.txt ; \
	find /home/genomerunner/db_3.00_12-01-2014/grsnp_db/hg19/Roadmap/DNase_hotspotbroadall/ -type f -name *.bed.gz > gfs_DNase_hotspotbroadall.txt ; \
	find /home/genomerunner/db_3.00_12-01-2014/grsnp_db/hg19/Roadmap/DNase_hotspotbroad01/ -type f -name *.bed.gz > gfs_DNase_hotspotbroad01.txt ; \
	find /home/genomerunner/db_3.00_12-01-2014/grsnp_db/hg19/Roadmap/DNase_narrowPeak/ -type f -name *.bed.gz > gfs_DNase_narrowPeak.txt
	find ~/db_3.00_12-01-2014/grsnp_db/hg19/Roadmap/chromStates18.bed/ -type f -name "*.bed.gz" > gfs_chromStates18.txt




fois:
	find bed/ -type f -name "*.bed" > fois.txt

hypergeom4:
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_Tfbs.txt bed/background/All_autoimmune.bed.gz -r ENCODE_Tfbs ; \
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_Histone.txt bed/background/All_autoimmune.bed.gz -r ENCODE_Histone ; \
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_broadPeaks.txt bed/background/All_autoimmune.bed.gz -r Roadmap_broadPeak ; \
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_Dnase.txt bed/background/All_autoimmune.bed.gz -r ENCODE_Dnase
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_Dgf.txt bed/background/All_autoimmune.bed.gz -r ENCODE_Dgf
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_narrowPeaks.txt bed/background/All_autoimmune.bed.gz -r Roadmap_narrowPeak ; \
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_gappedPeaks.txt bed/background/All_autoimmune.bed.gz -r Roadmap_gappedPeak ; \
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_DNase_hotspotall.txt bed/background/All_autoimmune.bed.gz -r Roadmap_DNase_hotspotall ; \
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_DNase_hotspot01.txt bed/background/All_autoimmune.bed.gz -r Roadmap_DNase_hotspot01 ; \
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_DNase_hotspotbroadall.txt bed/background/All_autoimmune.bed.gz -r Roadmap_DNase_hotspotbroadall ; \
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_DNase_hotspotbroad01.txt bed/background/All_autoimmune.bed.gz -r Roadmap_DNase_hotspotbroad01 ; \
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_DNase_narrowPeak.txt bed/background/All_autoimmune.bed.gz -r Roadmap_DNase_narrowPeak ; \
	python -m grsnp.hypergeom4 -d /home/genomerunner/db_3.00_12-01-2014/ --pv_adjust None -g hg19 fois.txt gfs_chromStates18.txt bed/background/All_autoimmune.bed.gz -r Roadmap_chromStates18


