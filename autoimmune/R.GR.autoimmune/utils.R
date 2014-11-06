# Convert a mantrix of raw p-values (with "-" indicating depletion) into -log10-transformed
mtx.transform<-function(x){
  tmp<- -log10(abs(x)) # -log10 transformation without sign
  for (i in 1:nrow(x)){
    for (j in 1:ncol(x)){
      if (x[i, j]<0) {tmp[i, j]<- -tmp[i,j]} # Add sign, if needed
    }
  }
  return(tmp)
}

# Correct for multiple testing the matrix of transformed p-values
mtx.adjust<-function(x){ 
  tmp<- -log10(apply(1/10^abs(x), 2, p.adjust)) # Adjust absolute p-values for multiple testing and convert them back to -log10
  for (i in 1:nrow(x)){
    for (j in 1:ncol(x)){
      if (x[i,j]<0) {tmp[i,j]<- -tmp[i,j]} # Add sign, if neede
    }
  }
  return(tmp)
}