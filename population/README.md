# [Genotype data for a set of 163 worldwide populations](https://data.mendeley.com/datasets/ckz9mtgrjj/1)

DOI: 10.17632/ckz9mtgrjj.1  Version 1 |  Published: 26 Jan 2016

Contributor(s): George Busby

Description of this data

Here is a combined dataset of genetic data on 2,643 individuals from 163 worldwide human populations. These genotypes were all generated on Illumina chips (550, 610, 660) for multiple different studies. The two main papers that this dataset was compiled for are: [Hellenthal, et al 2014 A Genetic Atlas of Human Admixture History, Science](http://science.sciencemag.org/content/343/6172/747.long); and [Busby, et al 2015 The role of recent admixture in forming the contemporary West Eurasian genomic landscape, Current Biology](http://www.sciencedirect.com/science/article/pii/S0960982215009495).

The data are in PLINK format and the BusbyWorldwidePopulations.csv file outlines where the different datasets come from. Note that because these two datasets were combined together, not all populations are typed on the same set of SNPs. We have included genotype data on 523,443 SNPs, of which 441,038 are genotyped on at least 97.5% of individuals.

Therefore, additional QC steps are required to filter this set down to high quality calls, depending on the subset of samples that are required. Complete information about the populations used is available in the various publications that are outlined in the associated paper.

Note that these same populations are available elsewhere and this dataset represents that compiled for the above mentioned papers.

-------

- `make.sh` - download data file `genotype-data-for-a-set-of-163-worldwide-populations.zip` from [https://data.mendeley.com/datasets/ckz9mtgrjj/1](https://data.mendeley.com/datasets/ckz9mtgrjj/1), extract `BusbyWorldwidePopulations.bed/bim/fam/csv` genotype files in PLINK format, recode them with PLINK into one allele - one dosage into `pop163.raw` file, extract individual-specific non-missing genotypes using `exome3.py` into `pop163.txt` folder. Files in the `pop163.txt` folder are further processed to select all genotypes, or "2" genotypes in `pop163.all` and `pop163.2` folders.

- `BusbyWorldwidePopulations.csv` - population stats, number of individuals per population

# SNP stats

### Distribution of the counts of all SNPs per individual: ~207,000, and the vast majority of them is type "1"

`for file in pop163.all/*; do wc -l < $file; done | histogram.py`

	# NumSamples = 2643; Min = 81423.00; Max = 231763.00
	# Mean = 206784.293984; Variance = 81167588.578348; SD = 9009.305666; Median 205713.000000

### Distribution of the counts of the "2" SNPs per individual: ~49,000

`for file in pop163.2/*; do zcat < $file | wc -l; done | histogram.py`

	# NumSamples = 2643; Min = 16651.00; Max = 79865.00
	# Mean = 49010.014756; Variance = 60294440.865087; SD = 7764.949508; Median 46471.000000



