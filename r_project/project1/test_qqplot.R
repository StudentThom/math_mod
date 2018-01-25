###

x <- seq(0,1,length=10000)
x_2 <- seq(0,1,length=1000)
y <- seq(0,0,length=10000)

pi_vector <- c(0.7,0.3)
alphas <- c(1,1)
betas <- c(1,4)

for (i in 1:length(x)){
  for (j in length(pi_vector))
    y[i] <- y[i] + (pi_vector[j] * rbeta(x[i],alphas[j],betas[j]))
}

y <- rbeta(x,1,4)
z <- rbeta(x_2,1.2,4.4)
qqplot(z,y)

plot(x,y)
qqplot(allp$p1,y)
