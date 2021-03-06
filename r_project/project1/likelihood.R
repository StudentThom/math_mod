# first test on likelihood
install.packages("plot3D")
library(plot3D)

load('allp.Rdata')

mixture_density <- function(x, pi_0, pi_1, alpha, beta){
  pi_0 * dunif(x) + pi_1 * dbeta(x,alpha,beta)
}

likelihood <- function(data,pi_0, pi_1, alpha, beta) {
  sum = 0
  for (i in 1:length(data)){
    sum = sum + mixture_density(data[i],pi_0, pi_1, alpha, beta)
  }
  sum
}

expected_resp <- function(x, pi_vector, j, alpha, beta){
  sum = 0
  w_i_j = 0
  length_vect = length(pi_vector)
  for (k in 1:length_vect) {
    sum <- sum + ((pi_vector[k] * dbeta(x,alpha[k],beta[k])))
  }
  w_i_j = (pi_vector[j] * dbeta(x, alpha[j], beta[j])) / sum
  
  # return
  w_i_j
}

averaged_resp_weights <- function(data, pi_vector, alpha, beta) {
  pi_new_vector = 0
  for (j in 1:length(pi_vector)){
    sum = 0
    for (i in 1:length(data)){
      sum = sum + expected_resp(data[i], pi_vector, j, alpha, beta)
    }
    # average is new value for pi_j^+
    average = sum / length(data)
    pi_new_vector[j] = average
    
    if (j != 1){
      #par <- optim(c(alpha[j],beta[j]),loglik1_par,data=data,lower=c(0.1,0.1), method="L-BFGS-B",control = list(fnscale=-1))$par
      out <- optim(c(alpha[j],beta[j]),expectation_f,lower=c(0.1,0.1),method="L-BFGS-B",data=allp$p1,pi_vector=pi_vector,j=j, alphas=alpha,betas=beta,control=list(fnscale = -1))
      par <- out$par
      alpha[j] = par[[1]]
      beta[j] = par[[2]]
    }
  }
  
  list(pi_new_vector, alpha, beta)
}


#####
pi_vector = c(0.3,0.4,0.3)
alpha = c(1,1,5)
beta = c(1,3,1)

em_algo <- function(data,pi_vector,alpha,beta, number_of_iterations){
  for (n in 1:number_of_iterations){
    lijst = averaged_resp_weights(data, pi_vector, alpha, beta)
    pi_vector = lijst[[1]]
    alpha = lijst[[2]]
    beta = lijst[[3]]
  }
  list(pi_vector, alpha, beta)
}



# plot for beta variable
## initiate values
pi_0 = 0.5
pi_1 = 1 - pi_0
alpha = 1
betas = seq(0,10,0.5)
plot(betas, likelihood(allp$p1,pi_0, pi_1, apha, betas))

# 3d plot for alpha beta variable
pi_0 = 0.5
pi_1 = 1 - pi_0
alphas = seq(0,10,0.5)
betas = seq(0,10,0.5)
M <- mesh(alphas,betas)


surf3D(M$x,M$y,likelihood(allp$p1,pi_0,pi_1,M$x,M$y), colkey=FALSE,bty="b2",xlab="alpha",ylab="beta",zlab="likelihood")


