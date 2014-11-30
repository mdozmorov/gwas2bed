library(dplyr)
trackDb.hg19 <- tbl_df(read.table("/Users/mikhail/Documents/Work/GenomeRunner/genomerunner_database/hg19/gf_descriptions.hg19.txt", sep="\t", header=F))



# Convert a matrix of raw p-values (with "-" indicating depletion) into -log10-transformed
mtx.transform<-function(x){
  tmp<- -log10(abs(x)) # -log10 transformation without sign
  for (i in 1:nrow(x)){
    for (j in 1:ncol(x)){
      if (x[i, j]<0) {tmp[i, j]<- -tmp[i,j]} # Add sign, if needed
    }
  }
  return(tmp)
}

# Convert a matrix of -log10-transformed p-values (with "-" indicating depletion) into raw linear scale
mtx.untransform<-function(x){
  tmp<- 1/10^abs(x) # -log10 transformation without sign
  for (i in 1:nrow(x)){
    for (j in 1:ncol(x)){
      if (x[i, j]<0) {tmp[i, j]<- -tmp[i,j]} # Add sign, if needed
    }
  }
  return(tmp)
}

# Correct for multiple testing the matrix of transformed p-values
mtx.adjust.log10<-function(x, method="fdr"){ 
  tmp<- -log10(apply(1/10^abs(x), 2, p.adjust, method=method)) # Adjust absolute p-values for multiple testing and convert them back to -log10
  for (i in 1:nrow(x)){
    for (j in 1:ncol(x)){
      if (x[i,j]<0) {tmp[i,j]<- -tmp[i,j]} # Add sign, if neede
    }
  }
  return(tmp)
}

# Adjust raw p-values for mutliple testing
mtx.adjust.raw <- function(x, method="fdr") {
  tmp <- x; # Keep signs in the original version
  tmp.adj <- apply(abs(x), 2, p.adjust, method=method) 
  for (i in 1:nrow(x)){
    for (j in 1:ncol(x)){
      if (tmp[i, j] < 0) tmp.adj[i, j] <- -1*tmp.adj[i, j]
    }
  }
  return(tmp.adj)
}

# Filters non-significant rows from a matrix
mtx.filter <- function(x, pval=0.05){
  idx <- apply(x, 1, function(i) {sum(abs(i) < pval) >= 1})
  tmp <- as.matrix(x[idx, , drop=F])
  colnames(tmp) <- colnames(x)
  #rownames(tmp) <- rownames(x)[idx]
  idxEnrich <- as.logical(apply(tmp, 1, function(x) {length(x[x > 0 & x < pval]) > 0}))
  tmp1 <- as.matrix(tmp[idxEnrich, , drop=F])
  colnames(tmp1) <- colnames(tmp)
  #rownames(tmp1) <- rownames(tmp)[idxEnrich]
  idxDeplet <- as.logical(apply(tmp, 1, function(x) {length(x[x < 0 & -x < pval]) > 0}))
  tmp2 <- as.matrix(tmp[idxDeplet, , drop=F])
  colnames(tmp2) <- colnames(tmp)
  #rownames(tmp2) <- rownames(tmp)[idxDeplet]
  if (nrow(tmp1) > 1) tmp1 <- tmp1[order(apply(tmp1, 1, function(x) {mean(x[x > 0 & x < pval])}), decreasing=F), , drop=F]
  if (nrow(tmp2) > 1) tmp2 <- tmp2[order(apply(tmp2, 1, function(x) {mean(x[x < 0 & -x < pval])}), decreasing=T), , drop=F]
  return(list(tmp1 <- data.frame(gfs=rownames(tmp1), tmp1), 
              tmp2 <- data.frame(gfs=rownames(tmp2), tmp2)))
}

# Shows top 10 enriched and depleted associations as tables
showTable <- function(mtx, adjust="fdr", pval=0.05) {
  mtx <- mtx.adjust.raw(mtx.untransform(mtx), adjust) # Adjust for multiple testing
  mtx <- mtx.filter(mtx, pval) # Get two sepatate lists, enchched and depleted
  numEnrich <- nrow(mtx[[1]]) # Total number of significantly enriched
  numDeplet <- nrow(mtx[[2]]) # and depleted associations
  if (numEnrich > 0) {
    print(paste("The total number of significantly ENRICHED associations is:", numEnrich))
    if (numEnrich > 10) numEnrich <- 10
    #mtx.enrich <- merge(data.frame(pval=format(as.matrix(mtx[[1]][1:numEnrich, , drop=F]), digits=3, scientific=T),
    #                               row.names=rownames(as.matrix(mtx[[1]]))[1:numEnrich]), trackDb.hg19, by="row.names", all.x=T, sort=T)
    #mtx.enrich <- data.frame(pval=format(as.matrix(mtx[[1]][1:numEnrich, , drop=F]), digits=3, scientific=T), row.names=rownames(as.matrix(mtx[[1]]))[1:numEnrich])
    mtx.enrich <- left_join(mtx[[1]], trackDb.hg19, by=c("gfs" = "V1"))
    pander(mtx.enrich[1:numEnrich, ], split.table=Inf)
    mtx[[1]] <- as.data.frame(mtx[[1]]); rownames(mtx[[1]]) <- mtx[[1]][, 1]; mtx[[1]] <- mtx[[1]] <- mtx[[1]][, -1, drop=F]
    mtx[[1]][mtx[[1]] == 0] <- .Machine$double.xmin
    barplot1(mtx.transform(mtx[[1]][1:numEnrich, , drop=F]), 15)
    #    grid.table(mtx.enrich, gp=gpar(fontsize=6))
    print("---------------------------------------------------------------")
  }
  if (numDeplet > 0) {
    print(paste("The total number of significantly DEPLETED associations is:", numDeplet))
    if (numDeplet > 10) numDeplet <- 10
    mtx.deplet <- merge(data.frame(pval=format(as.matrix(mtx[[2]][1:numDeplet, , drop=F]), digits=3, scientific=T), row.names=rownames(as.matrix(mtx[[2]]))[1:numDeplet]), trackDb.hg19, by="row.names", all.x=T)
    #mtx.deplet <- data.frame(pval=format(as.matrix(mtx[[2]][1:numDeplet, , drop=F]), digits=3, scientific=T), row.names=rownames(as.matrix(mtx[[2]]))[1:numDeplet])
    mtx.deplet <- left_join(mtx[[2]], trackDb.hg19, by=c("gfs" = "V1"))
    pander(mtx.deplet[1:numDeplet, ], split.table=Inf)
    mtx[[2]] <- as.data.frame(mtx[[2]]); rownames(mtx[[2]]) <- mtx[[2]][, 1]; mtx[[2]] <- mtx[[2]] <- mtx[[2]][, -1, drop=F]
    mtx[[2]][mtx[[2]] == 0] <- .Machine$double.xmin
    barplot1(mtx.transform(mtx[[2]][1:numDeplet, , drop=F]), 15)
    #grid.table(mtx)
    print("---------------------------------------------------------------")
  }
}

# Make a barplot of -log10-transformed p-values matrix.
# Legend location and number of colors is taken from matrix dimensions
# Bottom is the space for bottom x-axis legend
barplot1<-function(mtx, bottom, ...){
  par(mar=c(bottom,5,2,2)+0.1)
  groupcolors<-rainbow(ncol(mtx)) #c("yellow2","steelblue3","steelblue3","springgreen)
  b<-barplot(as.matrix(t(mtx)), beside=T,  ylab="-log10(p-value)\nnegative = underrepresentation", col=groupcolors,space=c(0.2,1), cex.names=0.7, las=2) #, names.arg=rownames(mtx)) # ,legend.text=colnames(mtx),args.legend=list(x=7,y=4))
  lines(c(0,100),c(-log10(0.01),-log10(0.01)),type="l",lty="dashed",lwd=2)
  lines(c(0,100),c(log10(0.01),log10(0.01)),type="l",lty="dashed",lwd=2)
  
  legend(round(nrow(mtx)/2), max(mtx),colnames(mtx),fill=groupcolors,cex=1)
  
}

