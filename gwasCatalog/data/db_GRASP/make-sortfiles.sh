#!/bin/bash
#PBS -S /bin/bash
#PBS -V
#PBS -l nodes=1:ppn=1
#PBS -M mdozmorov@vcu.edu
#PBS -N sort
#PBS -j oe
# PBS -o /home/glasser/Dissertation/Dozmorov/RNA-seq/cuffdiffout3

cd $PBS_O_WORKDIR

export LC_CTYPE=C 
export LANG=C

FILE=GRASP2fullDataset # Name of the file to process
PVAL=1e-4 # P-value cutoff
DIR=$FILE".bed."$PVAL # Folder to output processed BED files
NUM=10 # Cutoff to move files with the number of lines larger than this number
DIRMORE=$FILE".bed."$PVAL".more"$NUM # Folder to keep files larger than $NUM lines
# DIRLESS=$FILE".bed."$PVAL".less"$NUM # Folder to keep files smaller than $NUM lines

mkdir -p $DIRMORE
# mkdir -p $DIRLESS

for file in `ls $DIR`; do SIZE=`wc -l $DIR"/"$file | awk '{print $1}'`; if [ "$SIZE" -gt $NUM ]; then echo "More"; cp $DIR"/"$file $DIRMORE"/"; fi; done
