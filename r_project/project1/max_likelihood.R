# max likelihood test

y <- rbeta(1000,2,2)

loglik <- function(data, alpha, beta){
  answer = 0
  answer = sum(-dbeta(data,alpha,beta,log=TRUE))
  answer
}

likelihood <- function(data,pi_0, pi_1, alpha, beta) {
  sum = 0
  for (i in 1:length(data)){
    sum = sum + mixture_density(data[i],pi_0, pi_1, alpha, beta)
  }
  sum
}

out <- optim(c(1,1),loglik,x=y,lower=c(0,0), method="L-BFGS-B")

####

alphas = seq(0,10,0.5)
betas = seq(0,10,0.5)
M <- mesh(alphas,betas)


surf3D(M$x,M$y,loglik(c(M$x,M$y),0.5), colkey=FALSE,bty="b2",xlab="alpha",ylab="beta",zlab="likelihood")

