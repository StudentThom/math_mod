pi_vector <- c(0.7,0.3)
alphas <- c(1,1)
betas <- c(1,4)

x <- seq(0,1,length=101)
y <- seq(0,0,length=101)

for (i in 1:length(x)){
  y[i] <- likelihood_f(x[i],pi_vector,alphas,betas)
}

plot(x,y)

likelihood_f(data[1],pi_vector,alphas,betas)

product <- 1
for (i in 1:length(data)){
  sum <- 0
  for (j in 1:length(pi_vector)){
    sum <- (sum + (pi_vector[j] * dbeta(data[i],alphas[j],betas[j])))
  }   
  product <- (product * sum)
}
###
lengte = 16000
y <- seq(0,0,length=lengte)
for (i in 1:length(y)){
  y[i] <- likelihood_f(allp$p1[i],pi_vector,alphas,betas)
}

x <- seq(0,1,length=lengte)
z <- seq(0,0,length=lengte)
for (k in 1:length(z)){
  z[k] <- prod(y[1:k])
}
plot(x,z)
