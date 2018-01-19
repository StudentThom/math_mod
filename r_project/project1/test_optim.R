## test optim functie to find alfa_j, beta_j

# variables
data = allp$p1
pi_vector = c(0.4,0.6)
alpha_beta = c(1,4)
j = 1

expected_resp <- function(x, pi_vector, j, alpha, beta){
  sum = 0
  w_i_j = 0
  length_vect = length(pi_vector)
  for (k in 1:length_vect) {
    sum <- sum + ((pi_vector[k] * dbeta(x,alpha[k],beta[k])))
    #print(sum)
  }
  w_i_j = (pi_vector[j] * dbeta(x, alpha[j], beta[j])) / sum
  #print(w_i_j)
  
  # return
  w_i_j
}

expectation_f <- function(alpha_beta,data, pi_vector, j, alphas, betas){
  alpha = alpha_beta[1]
  beta = alpha_beta[2]
  sum = 0
  for (i in 1:length(data)) {
    sum = sum + (log(dbeta(data[i],alpha,beta)) * expected_resp(data[i], pi_vector, j, alphas, betas))
  }
  # return
  sum
}

optim(par=c(1,4),expectation_f,data=allp$p1,pi_vector=c(0.3,0.7),j=2,alphas=c(1,1),betas=c(1,4),lower=c(0.1,0.1),method="L-BFGS-B")