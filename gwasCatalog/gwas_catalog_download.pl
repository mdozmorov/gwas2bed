#!/usr/local/bin/perl

use LWP::Simple;
use LWP::UserAgent;
use List::MoreUtils;
use DBI;
use DBD::mysql;

$num_snps_cutoff = 15;

#Causes Cygwin to display print statements as they are executed. Probably not needed for linux.
$| = 1;

#Check dates to see if a new GWAS catalog should be downloaded
$current_gwas_catalog = "current_gwas_catalog.txt";
$download_new_file = 0;

my $modified_timestamp = (stat($current_gwas_catalog))[9];
($file_sec, $file_min, $file_hour, $file_mday, $file_mon, $file_year) = localtime($modified_timestamp);
$file_year = $file_year + 1900;
$file_mon = $file_mon + 1;
if(length($file_mon) < 2)
{
	$file_mon = "0".$file_mon;
}
if(length($file_mday) < 2)
{
	$file_mday = "0".$file_mday;
}

($cur_sec, $cur_min, $cur_hour, $cur_mday, $cur_mon, $cur_year) = localtime();
$cur_year = $cur_year + 1900;
$cur_mon = $cur_mon + 1;
if(length($cur_mon) < 2)
{
	$cur_mon = "0".$cur_mon;
}
if(length($cur_mday) < 2)
{
	$cur_mday = "0".$cur_mday;
}

$modified_date = $file_year.$file_mon.$file_mday;
$current_date = $cur_year.$cur_mon.$cur_mday;

if($modified_date lt $current_date)
{
	$download_new_file = 1;
	print "Current GWAS catalog is old. An updated version will be downloaded now.\n";
}
else
{
	print "Current GWAS catalog is up to date.\n";
}

#If the Current GWAS catalog is old, a new GWAS catalog is downloaded
if($download_new_file == 1)
{
	#download file from site
	$ua = LWP::UserAgent->new;
	$url = "https://www.ebi.ac.uk/gwas/api/search/downloads/full";

	my $content = $ua->get($url);
	die "couldn't get $url" unless defined $content;

	#Create output file
	open OUTPUT, ">current_gwas_catalog.txt" or die "could not open output file";
	$count = 0;

	while(my($key,$value)=each(%$content))
	{
		if ($count == 1)
		{
			@all_lines = split('\n', $value);
			foreach $line (@all_lines)
			{
				print OUTPUT "$line\n";
			}
		}
		$count++;
	}
	close OUTPUT;
	
	print "Updated GWAS Catalog has been downloaded.\n";
}

#split up gwas catalog into individual diseases with unique snps for each disease
open INPUT, "current_gwas_catalog.txt" or die "No GWAS catalog exists.\n";
@lines = ();
@lines = <INPUT>;
chomp(@lines);
shift(@lines);
close INPUT;

$num_lines = @lines;

print "Total Lines in GWAS Catalog: $num_lines\n";

@all_diseases = ();
@disease_snps = ();
@all_snps = ();
@disease_genes = ();

foreach $line (@lines)
{
	@parts = split('\t', $line);
	$disease = $parts[7];
	$snps = $parts[21];
	$genes = $parts[13];
	if(!($disease ~~ @all_diseases))
	{
		push(@all_diseases, $disease);
		push(@disease_snps, "");
		push(@disease_genes, "");
	}
	
	@individual_snps = split(',', $snps);
	
	my $index = 0;
	++$index until $all_diseases[$index] eq $disease or $index > $#all_diseases;
	if($index > $#all_diseases)
	{
		print "Could not find a match for: $disease\n";
	}
	
	$temp_snp_list = $disease_snps[$index];
	
	foreach $long_snp (@individual_snps)
	{		
		$rs_beginning = substr($long_snp, 0, 2);
		
		@more_snps = ();
		
		if($rs_beginning eq "rs")
		{
			@more_snps = split(':', $long_snp);
		}
		else
		{
			@more_snps = split('\t', $long_snp);
		}
		
		foreach $snp (@more_snps)
		{
			$snp =~ s/^\s+|\s+$//g;
			
			if($temp_snp_list eq "")
			{
				$temp_snp_list = $snp;
			}
			else
			{
				$temp_snp_list = $temp_snp_list.",".$snp;
			}
			
			if(!($snp ~~ @all_snps))
			{
				if(!($snp eq "NR"))
				{
					push(@all_snps, $snp);
				}
			}
		}
	}
	
	splice(@disease_snps, $index, 1, $temp_snp_list);
	
	
	$temp_gene_list = $disease_genes[$index];
	
	@individual_genes = split(',', $genes);
	
	foreach $gene (@individual_genes)
	{
		#remove starting and trailing whitespace
		$gene =~ s/^\s+|\s+$//g;
		
		if($temp_gene_list eq "")
		{
			$temp_gene_list = $gene;
		}
		else
		{
			$temp_gene_list = $temp_gene_list.",".$gene;
		}
	}
	
	splice(@disease_genes, $index, 1, $temp_gene_list);
}

$disease_size = @all_diseases;

print "Number of diseases: $disease_size\n";

#Clean out diseases.snps_bed
@old_disease_snps = ();
my $dir = "diseases.snps_bed";
if(!(-d $dir))
{
	mkdir($dir);
}
opendir DIR, $dir or die "Cannot open the disease.snps_bed directory.\n";
while (my $file = readdir(DIR))
{
	next unless (-f "$dir/$file");
	next unless ($file =~ m/\.bed$/);
	$file = $dir."/".$file;
	push(@old_disease_snps, $file);
}
foreach $item (@old_disease_snps)
{
	unlink $item or warn "Could not delete $item\n";
}

#Clean out disease.snps_not_found
@old_not_found = ();
my $dir = "diseases.snps_not_found";
if(!(-d $dir))
{
	mkdir($dir);
}
opendir DIR, $dir or die "Cannot open the diseases.snps_not_found directory.\n";
while (my $file = readdir(DIR))
{
	next unless (-f "$dir/$file");
	next unless ($file =~ m/\.txt$/);
	$file = $dir."/".$file;
	push(@old_not_found, $file);
}
foreach $item (@old_not_found)
{
	unlink $item or warn "Could not delete $item\n";
}

#Clean out diseases.snps_empty
@old_empty = ();
my $dir = "diseases.snps_empty";
if(!(-d $dir))
{
	mkdir($dir);
}
opendir DIR, $dir or die "Cannot open the diseases.snps_empty directory.\n";
while (my $file = readdir(DIR))
{
	next unless (-f "$dir/$file");
	next unless ($file =~ m/\.txt$/);
	$file = $dir."/".$file;
	push(@old_empty, $file);
}
foreach $item (@old_empty)
{
	unlink $item or warn "Could not delete $item\n";
}

#Clean out diseases.gene
@old_genes = ();
my $dir = "diseases.genes";
if(!(-d $dir))
{
	mkdir($dir);
}
opendir DIR, $dir or die "Cannot open the diseases.genes directory.\n";
while (my $file = readdir(DIR))
{
	next unless (-f "$dir/$file");
	next unless ($file =~ m/\.txt$/);
	$file = $dir."/".$file;
	push(@old_genes, $file);
}
foreach $item (@old_genes)
{
	unlink $item or warn "Could not delete $item\n";
}

#Create output snp and gene files for each disease
for($i = 0; $i < $disease_size; $i++)
{
	$print_disease = $all_diseases[$i];
	
	$print_disease =~ s/\/|\\|\?|%|&|\*|:|\||>|<|\.|"/_/g;
	
	if($print_disease eq "")
	{
		next;
	}
	
	$gene_file_name = ">diseases.genes/".$print_disease.".txt";
	
	$list_snps = $disease_snps[$i];
	
	@array_snps = split(',', $list_snps);
	my @unique_snps = List::MoreUtils::uniq(@array_snps);
	
	$size_with_nr = @unique_snps;
	
	@unique_snps = grep{$_  ne 'NR'} @unique_snps;
	
	$num_unique_for_disease = @unique_snps;
	
	if($num_unique_for_disease == 0)
	{
		$print_disease = ">diseases.snps_empty/".$print_disease.".txt";
	}
	else
	{
		$print_disease = ">diseases.snps_bed/".$print_disease.".bed";
	}
	
	open OUTPUT, $print_disease, or die "Could not create output file\n";
	
	foreach $unique (@unique_snps)
	{
		if(!($unique eq "NR"))
		{
			print OUTPUT "$unique\n";
		}
	}
	
	close OUTPUT;
	
	$list_genes = $disease_genes[$i];
	
	@array_genes = split(',', $list_genes);
	my @unique_genes = List::MoreUtils::uniq(@array_genes);
	
	open OUTPUT, $gene_file_name, or die "Could not create output file\n";
	
	foreach $unique (@unique_genes)
	{
		if(!($unique eq "NR"))
		{
			if(!($unique =~ m/Interge\w*ic/))
			{
				print OUTPUT "$unique\n";
			}
		}
	}
	
	close OUTPUT;
}

$rslist = "";

print "Running UCSC Genome Browser SQL Query for SNP Coordinates.\n";

#perform SQL query to download genomic coordinates for snps in all_snps file
foreach $all_snp (@all_snps)
{
	$all_snp_format = "'".$all_snp."'";
	if($rslist eq "")
	{
		$rslist = $all_snp_format;
	}
	else
	{
		$rslist = $rslist.",".$all_snp_format;
	}
}

open OUTPUTFILE, ">diseases.snps_bed/all_snps.bed" or die "Could not create output file.\n";

$host = "genome-mysql.cse.ucsc.edu";
$tablename = "snp138";
$user = "genome"; 
$database = "hg19";

$dsn = "dbi:mysql:$database:$host";

$connect = DBI->connect($dsn, $user, "") or die "Couldn't connect";

$chrmlist = "'chr1','chr2','chr3','chr4','chr5','chr6','chr7','chrX','chr8','chr9','chr10','chr11','chr12','chr13','chr14','chr15','chr16','chr17','chr18','chr20','chrY','chr19','chr22','chr21','chrM'";

$query = "SELECT distinct chrom, chromStart, chromEnd, name, score, strand from $tablename WHERE name IN ($rslist) AND chrom IN ($chrmlist);";

$query_handle = $connect->prepare($query);

$query_handle->execute();

@snps_in_query = ();

$count = 0;

while($row = $query_handle->fetchrow_hashref)
{
	$chr = $row->{chrom};
	$start = $row->{chromStart};
	$end = $row->{chromEnd};
	$name = $row->{name};
	$score = $row->{score};
	$strand = $row->{strand};
	
	push(@snps_in_query, $name);

	print OUTPUTFILE "$chr\t$start\t$end\t$name\t$score\t$strand\n";
}

$connect->disconnect();

@snps_not_found = ();
@rs_snps_to_rerun = ();

print "Creating SNPs not found file.\n";
open OUTPUT, ">diseases.snps_not_found/all_snps_not_found.txt" or die "Could not create output file\n";

foreach $all_snp(@all_snps)
{
	if(!($all_snp ~~ @snps_in_query))
	{
		$chr_beginning = substr($all_snp, 0, 2);
		
		$rs_beginning = substr($all_snp, 0, 2);
		
		if($chr_beginning eq "ch")
		{
			$chr = "";
			$start = "";
			$end = "";
			@characters = split("", $all_snp);
			if($characters[4] eq ':')
			{
				$chr = substr($all_snp, 0, 4);
				$start = substr($all_snp, 5);
			}
			elsif($characters[3] eq ':')
			{
				$chr = substr($all_snp, 2, 1);
				$chr = "chr".$chr;
				$start = substr($all_snp, 4);
			}
			else
			{
				$chr = substr($all_snp, 0, 5);
				$start = substr($all_snp, 6);
			}
			$end = $start + 1;
			
			print OUTPUTFILE "$chr\t$start\t$end\t$all_snp\t0\t+\n";
		}
		elsif($rs_beginning eq "rs")
		{
			push(@rs_snps_to_rerun, $all_snp);
		}
		else
		{
			print OUTPUT "$all_snp\n";
			push(@snps_not_found, $all_snp);
		}
	}
}
print "Rerunning queries for those rsSNPs not found in SNP138.\n";

#rerun queries for those rsSNPs that have not been found
$rs_size = @rs_snps_to_rerun;

@hapmapSNP_tables = ("hapmapSnpsASW", "hapmapSnpsCEU", "hapmapSnpsCHB", "hapmapSnpsCHD", "hapmapSnpsGIH", "hapmapSnpsJPT", "hapmapSnpsLWK", "hapmapSnpsMEX", "hapmapSnpsMKK", "hapmapSnpsTSI", "hapmapSnpsYRI");

$num_tables = @hapmapSNP_tables;

$table_count = 0;

while(($rs_size > 0) and ($table_count < $num_tables))
{
	$rslist = "";
	foreach $rssnp (@rs_snps_to_rerun)
	{
		$formatted_rssnp = "'".$rssnp."'";
		if($rslist eq "")
		{
			$rslist = $formatted_rssnp;
		}
		else
		{
			$rslist = $rslist.",".$formatted_rssnp;
		}
	}

	$host = "genome-mysql.cse.ucsc.edu";
	$tablename = $hapmapSNP_tables[$table_count];
	$user = "genome"; 
	$database = "hg19";

	$dsn = "dbi:mysql:$database:$host";

	$connect = DBI->connect($dsn, $user, "") or die "Couldn't connect";

	$query = "SELECT distinct chrom, chromStart, chromEnd, name, score, strand from ".$tablename." WHERE name IN ($rslist) AND chrom IN ($chrmlist);";

	#print "Query is: $query\n";

	$query_handle = $connect->prepare($query);

	$query_handle->execute();
	
	@rs_snps_found = ();

	while($row = $query_handle->fetchrow_hashref)
	{
		$chr = $row->{chrom};
		$start = $row->{chromStart};
		$end = $row->{chromEnd};
		$name = $row->{name};
		$score = $row->{score};
		$strand = $row->{strand};
		
		push(@rs_snps_found, $name);

		print OUTPUTFILE "$chr\t$start\t$end\t$name\t$score\t$strand\n";
	}

	$connect->disconnect();
	
	@temp_snps = ();
	
	foreach $rssnp (@rs_snps_to_rerun)
	{
		if(!($rssnp ~~ @rs_snps_found))
		{
			push(@temp_snps, $rssnp);
		}
	}
	
	@rs_snps_to_rerun = ();
	@rs_snps_to_rerun = @temp_snps;
	$size = @rs_snps_to_rerun;
	$num_found = @rs_snps_found;
	
	#print "Table: $tablename\n";
	#print "Snps Found: $num_found\n";
	#print "SNPs remaining: $size\n";
		
	$table_count++;
}

#print leftover snps to the snps not found file
$not_found = @rs_snps_to_rerun;
print "Snps left = $not_found\n";
foreach $rssnp (@rs_snps_to_rerun)
{
	print OUTPUT "$rssnp\n";
	push(@snps_not_found, $rssnp);
}

close OUTPUT;
close OUTPUTFILE;

print "Creating SNPs not found file for each disease.\n";
#Create snps not found for each disease file
my $dir = "diseases.snps_bed";
opendir DIR, $dir or die "Cannot open the diseases.snps_bed directory.\n";
@files_to_delete = ();
while (my $file = readdir(DIR))
{
	next unless (-f "$dir/$file");
	
	next unless ($file =~ m/\.bed$/);
	$full_file = "diseases.snps_bed/".$file;
	#print "$file\n";
	$disease_name = substr($file, 0, -4);
	$disease_not_found_file = ">diseases.snps_not_found/".$disease_name."_not_found.txt";

	if(!($file eq "all_snps.bed"))
	{

		open INPUT, $full_file or die "Cannot open disease file.\n";
		@lines = ();
		@lines = <INPUT>;
		chomp(@lines);
		close INPUT;
		
		@disease_not_found = ();
		
		
		foreach $line (@lines)
		{
			if($line ~~ @snps_not_found)
			{
				push(@disease_not_found, $line);
			}
		}
		
		$num_snps_not_found = @disease_not_found;
		if($num_snps_not_found > 0)
		{
			$num_lines = @lines;
			if($num_snps_not_found == $num_lines)
			{
				$disease_empty_file = ">diseases.snps_empty/".$disease_name.".txt";
				open OUTPUT, $disease_empty_file or die "Cannot create disease empty file\n";
				foreach $line (@lines)
				{
					print OUTPUT "$line\n";
				}
				close OUTPUT;
				
				push(@files_to_delete, $full_file);
			}
			else
			{
				open OUTPUT, $disease_not_found_file or die "Cannot create disease not found file\n";
				foreach $not_found_snp (@disease_not_found)
				{
					print OUTPUT "$not_found_snp\n";
				}
				close OUTPUT;
			}
		}

	}
	
}
closedir DIR;

foreach $file (@files_to_delete)
{
	unlink $file or warn "Could not delete $file\n";
}


print "Using Sort and Join to add coordinates to individual disease bed files.\n";

#use file generated for all_snps to create output file file for each disease
`sort -k4,4 -o diseases.snps_bed/all_snps.bed diseases.snps_bed/all_snps.bed`;
#`dos2unix -q diseases.snps_bed/all_snps.bed`;

my $dir = "diseases.snps_bed";
opendir DIR, $dir or die "Cannot open the diseases.snps_bed directory.\n";
@bed_files = ();
while (my $file = readdir(DIR))
{

	next unless (-f "$dir/$file");
	
	next unless ($file =~ m/\.bed$/);
	$full_file = "diseases.snps_bed/".$file;
	#print "$file\n";
	if(!($file eq "all_snps.bed"))
	{
		push(@bed_files, $full_file);
	}
}
closedir DIR;

@old_small = ();
my $dir = "diseases.snps_bed/small";
if(!(-d $dir))
{
	mkdir($dir);
}
opendir DIR, $dir or die "Cannot open the disease.snps_bed/small directory.\n";
while (my $file = readdir(DIR))
{
	next unless (-f "$dir/$file");
	next unless ($file =~ m/\.bed$/);
	$file = $dir."/".$file;
	push(@old_small, $file);
}
foreach $item (@old_small)
{
	unlink $item or warn "Could not delete $item\n";
}

@old_large = ();
my $dir = "diseases.snps_bed/large";
if(!(-d $dir))
{
	mkdir($dir);
}
opendir DIR, $dir or die "Cannot open the disease.snps_bed/large directory.\n";
while (my $file = readdir(DIR))
{
	next unless (-f "$dir/$file");
	next unless ($file =~ m/\.bed$/);
	$file = $dir."/".$file;
	push(@old_large, $file);
}
foreach $item (@old_large)
{
	unlink $item or warn "Could not delete $item\n";
}

foreach $bed_file (@bed_files)
{
	
	`sort -o "$bed_file" "$bed_file"`;

	#`dos2unix -q "$full_file"`;

	$output=`join -t "	" -1 1 -2 4 -o '2.1 2.2 2.3 1.1 2.5 2.6' "$bed_file" diseases.snps_bed/all_snps.bed`;
	
	open OUTPUTFILE, ">$bed_file" or die "Cannot open file\n";

	print OUTPUTFILE $output;

	close OUTPUTFILE;
	
	$file_name = substr($bed_file, 0, -4);
	
	@total_lines = split('\n', $output);
	
	$num_lines = @total_lines;
	
	$file_name = $file_name."_".$num_lines.".bed";
	
	rename $bed_file, $file_name;

	`sort -k1,1 -k2,2n -k3,3n -o "$file_name" "$file_name"`;

	$disease_name = `basename "$file_name"`;
	chomp($disease_name);

	if($num_lines < $num_snps_cutoff)
	{

		$new_filename = "diseases.snps_bed/small/".$disease_name;
		`mv "$file_name" "$new_filename"`;
	}
	else
	{
		$new_filename = "diseases.snps_bed/large/".$disease_name;
		`mv "$file_name" "$new_filename"`;
	}

}
