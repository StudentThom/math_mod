# Load and discover data

load('allp.Rdata')
ls()
typeof(allp)
attributes(allp)
typeof(allp[1])
typeof(allp[[1]])

allp[[1]][[1]]

# histograms
pvector1 = allp[[1]]
hist(pvector1)

for (vector_number in seq(1,length(allp))){
  hist(allp[[vector_number]], main=paste("Hist of pvector", vector_number),xlab = "p value")
}
