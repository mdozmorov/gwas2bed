#!/bin/bash
## ==================================================================
## Remove special characters from file names
##
## Usage: ./renameSpecial.sh [dir with *.bed files]
##
## Example: ./renameSpecial.sh gwascatalog
## ==================================================================

for file in `ls $1`; do 
	mv -v "$file" `echo $file | tr ' ' '_' | tr -d '[{}(),\!]' | tr -d 's/_-_/_/g'`;
done
