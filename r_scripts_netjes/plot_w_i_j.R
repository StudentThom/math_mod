# plot w_i_j als functie van p-waarden in (0,1)

# voor datset1
alpha <- c(1,1)
beta <- c(1,4)
pi_vector <- c(0.65,0.35)

# voor dataset3
alpha <- c(0.91,6.69)
beta <- c(1.98,1.16)
pi_vector <- c(0.87,0.13)

# run
x <- seq(0,1,length=101)
y1 <- seq(0,0,length=101)
y2 <- seq(0,0,length=101)


j <- 1
for (i in 1:length(x)){
  y1[i] <- expected_resp(x[i],pi_vector,j,alpha,beta)
}
j <- 2
for (i in 1:length(x)){
  y2[i] <- expected_resp(x[i],pi_vector,j,alpha,beta)
}

plot(x,y1,main=expression('Kans p-waarde komt uit f'[j]),xlab="p-waarde",ylab="kans",type="l",col="red",xlim=c(0,1),ylim=c(0,1))
lines(x,y2,type="l",col="blue")
legend(x=0.2,y=0.91,legend=expression(
  f["1"],f["2"]),lwd=1,col=c("red","blue"))

