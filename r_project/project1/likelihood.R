# first test on likelihood
# install.packages("plot3D")
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
  for (k in length_vect) {
    # take unif distr if k == 1, else beta distr
    #if (k == 1){
    #  sum = sum + pi_vector[k] * dunif(x)
    #}
    #else {
    sum <- sum + ((pi_vector[k] * dbeta(x,alpha[k],beta[k])))
    #}
  }
  
  # take unif distr if j == 1, else beta distr
  # if (j == 1) {
  #   w_i_j = (pi_vector[j] * dunif(x)) / sum
  # }
  # else {
  w_i_j = (pi_vector[j] * dbeta(x, alpha[j], beta[j])) / sum
  #}
  
  #w_i_j
  sum
}

averaged_resp_weights <- function(data, pi_vector, alpha, beta) {
  sum = 0
  pi__new_vector = 0
  for (j in length(pi_vector)){
    for (i in 1:length(data)){
      sum = sum + expected_resp(data[i], pi_vector, j, alpha, beta)
    }
    # average is new value for pi_j^+
    average = sum / length(data)
    pi_new_vector[j] = average
    
  }
  pi_new_vector
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


