all:	extractSnps

extractSnps:	nature13835-s1.txt
	sed '1d' nature13835-s1.txt | awk 'BEGIN {OFS="\t"} {close(fn); fn=$1".bed"; print $4, $5-1, $5, $3 >> fn}'