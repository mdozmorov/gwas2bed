# Extract a subset of disease-disease relationships from the complete matrix
#
# First, download the complete matrix. Warning: large file, ~600Mb
#wget http://barabasilab.neu.edu/projects/hudine/resource/datasets/AllNet5.net
#
# Second, parse it to extract the subset
awk '{if (($1 == "150" || $1 == "174" || $1 == "183" || $1 == "185" || $1 == "188" || $1 == "191" || $1 == "205.00" || $1 == "259.2" || $1 == "204.10" || $1 == "153.9" || $1 == "182.0" || $1 == "189.0" || $1 == "172.9" || $1 == "203.0" || $1 == "194.0") && ($2 == "150" || $2 == "174" || $2 == "183" || $2 == "185" || $2 == "188" || $2 == "191" || $2 == "205.00" || $2 == "259.2" || $2 == "204.10" || $2 == "153.9" || $2 == "182.0" || $2 == "189.0" || $2 == "172.9" || $2 == "203.0" || $2 == "194.0")) print $0}' AllNet5.net > AllNet5.txt
