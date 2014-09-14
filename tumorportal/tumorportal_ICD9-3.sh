# Extract a subset of disease-disease relationships from the complete matrix
#
# First, download the complete matrix. Warning: large file, ~40Mb
#wget http://barabasilab.neu.edu/projects/hudine/resource/datasets/AllNet3.net
#
# Second, parse it to extract the subset
awk '{if (($1 == "150" || $1 == "153" || $1 == "162" || $1 == "172" || $1 == "174" || $1 == "" || $1 == "182" || $1 == "183" || $1 == "185" || $1 == "188" || $1 == "189" || $1 == "191" || $1 == "194" || $1 == "196" || $1 == "200" || $1 == "203" || $1 == "204" || $1 == "" || $1 == "205" || $1 == "259") && ($2 == "150" || $2 == "153" || $2 == "162" || $2 == "172" || $2 == "174" || $2 == "" || $2 == "182" || $2 == "183" || $2 == "185" || $2 == "188" || $2 == "189" || $2 == "191" || $2 == "194" || $2 == "196" || $2 == "200" || $2 == "203" || $2 == "204" || $2 == "" || $2 == "205" || $2 == "259")) print $0}' AllNet3.net > AllNet3.txt
