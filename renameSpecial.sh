#!/bin/bash
## ==================================================================
## Remove special characters from file names
##
## Usage: ./renameSpecial.sh [dir with *.bed files]
##
## Example: ./renameSpecial.sh gwascatalog
## ==================================================================

for file in `ls $1`; do 
	mv -v $1"/""$file" $1"/"`echo $file | tr ' ' '_' | tr -d '[{}(),\!]' | sed 's/_-_/_/g'`".bed";
done
