#install the RISmed package
# http://davetang.org/muse/2013/10/31/querying-pubmed-using-r/
install.packages("RISmed")
library(RISmed)

#now let's look up this dude 
res <- EUtilsSummary('dozmorov m', type='esearch', db='pubmed')
summary(res)
QueryId(res)

#limit by date
res2 <- EUtilsSummary('dozmorov m', type='esearch', db='pubmed', mindate='2012', maxdate='2016')
summary(res2)
QueryId(res2)


#first how many total articles containing X
res3 <- EUtilsSummary('enrichment analysis', type='esearch', db='pubmed')

summary(res3)
QueryCount(res3)

#tally each year beginning at 1970
#In order not to overload the E-utility servers, NCBI recommends that users post no more than three
#URL requests per second and limit large jobs to either weekends or between 9:00 PM and 5:00 AM
#Eastern time during weekdays. Failure to comply with this policy may result in an IP address being
#blocked from accessing NCBI.

tally <- array()
x <- 1
for (i in 1970:2015){
  Sys.sleep(1)
  r <- EUtilsSummary('enrichment analysis', type='esearch', db='pubmed', mindate=i, maxdate=i)
  tally[x] <- QueryCount(r)
  x <- x + 1
}

names(tally) <- 1970:2015
max(tally)

barplot(tally, las=2, ylim=c(0,3200), main="Number of PubMed articles containing \"enrichment analysis\"")
