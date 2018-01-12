# plot fitted distribution combi on histogram

plot_distribution <- function(data, pi_vector, alpha, beta){
  hist(data,freq=FALSE)
  x <- seq(0,1,0.01)
  y <- vector(mode="numeric", length=length(x))
  sum = 0
  for (i in 1:length(x)){
    for (k in 1:length(pi_vector)){
      y[i] <- y[i] +  pi_vector[k] * dbeta(x[i],alpha[k],beta[k])
    }
  }
  lines(x,y)
}

