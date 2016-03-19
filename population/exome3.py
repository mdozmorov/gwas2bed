#!/usr/bin/env python2
# A function to parse .raw file and output individual-specific SNP file
# First column - rsid, second column - genotype (1 or 2)
# Arguments:
#       file.raw - file name
#       -o, --outdir - output folder name
#       -v, --verbose - verbose output
# Usage:
#       python exome3.py pop163.raw --outdir pop163.txt --verbose 2>>notfound
# Output:
#       A folder with individual-specific SNP genotypes in separate files
# Note:
#       Modified after Cory's code in PG exome_data folder

import csv, sys, argparse, os

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--outdir", "-o", default="bed")
    parser.add_argument("snp_file", nargs=1)
    parser.add_argument("--verbose", "-v", default=False,
        action="store_true")
    args = parser.parse_args()

    if not os.path.exists(args.outdir):
        os.makedirs(args.outdir)

    with open(args.snp_file[0]) as h:
        header = list(h.next().strip().split())
        
        for row in h:
            cells = row.split()
            id = cells[0]+'_'+cells[1]
            if args.verbose:
                print "* Processing patient %s ..." % id
            bed_path = os.path.join(args.outdir, id+".txt")
            with open(bed_path, "w") as out:
                for snp, value in zip(header[6:], cells[6:]):
                    if value not in ('1', '2'):
                        continue
                    rsid, val = snp.split('_')[0], value
                    fields = [rsid,val]
                    out.write("\t".join(map(str, fields))+"\n")

