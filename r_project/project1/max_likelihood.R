# max likelihood test

y <- rbeta(1000,2,2)

loglik <- function(data, alpha, beta){
  answer = 0
  for (i in 1:length(data)){
    answer = answer + - dbeta(data[i],alpha,beta,log=TRUE)
  }
  # answer = sum(-dbeta(data,alpha,beta,log=TRUE))
  answer
}

loglik1_par <- function(data, alpha_beta){
  answer = 0
  alpha = alpha_beta[1]
  beta = alpha_beta[2]
  for (i in 1:length(data)){
    answer = answer + - dbeta(data[i],alpha,beta,log=TRUE)
  }
  answer
}

plot_loglik <- function(data,alpha,betas){
  y <- 0
  for (i in 1:length(betas)){
    y[i] <- loglik(data,alpha,betas[i])
  }
  plot(betas,y,type = "l")
  y
}

likelihood <- function(data,pi_0, pi_1, alpha, beta) {
  sum = 0
  for (i in 1:length(data)){
    sum = sum + mixture_density(data[i],pi_0, pi_1, alpha, beta)
  }
  sum
}

out <- optim(c(1,1),loglik,x=y,lower=c(0,0), method="L-BFGS-B")

out <- optim(par = c(1,1),fn = loglik1_par,data=allp$p1[1:10],lower=c(0,0), method="L-BFGS-B")

####

alphas = seq(0.01,10,0.5)
betas = seq(0.01,10,0.5)
M <- mesh(alphas,betas)


surf3D(M$x,M$y,loglik(allp$p1,M$x,M$y), colkey=FALSE,bty="b2",xlab="alpha",ylab="beta",zlab="likelihood")


