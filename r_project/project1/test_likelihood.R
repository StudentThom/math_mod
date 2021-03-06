pi_vector <- c(0.7,0.3)
alphas <- c(1,1)
betas <- c(1,4)

x <- seq(0,1,length=101)
y <- seq(0,0,length=101)

for (i in 1:length(x)){
  y[i] <- log_likelihood_f(x[i],pi_vector,alphas,betas)
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
lengte = 20000
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


#####################################################
# plot log likelihood as function of alpha and beta #
#####################################################
# install.packages("plot3D")
library("plot3D")

alpha_vector = seq(0.01,5.01,length=11)
beta_vector = seq(0.01,10.01,length=11)
pi_vector <- c(0.65,0.35)

M <- mesh(alpha_vector,beta_vector)

ans_matrix <- matrix(0,nrow=length(alpha_vector),ncol=length(beta_vector))

# log likelihood
for (j_1 in 1:length(alpha_vector)){
  for (j_2 in 1:length(beta_vector)){
    ans_matrix[j_1,j_2] <- log_likelihood_f(allp$p1,pi_vector,c(1,alpha_vector[j_1]),c(1,beta_vector[j_2]))
  }
}

# likelihood (gives error since values become to small)
for (j_1 in 1:length(alpha_vector)){
  for (j_2 in 1:length(beta_vector)){
    ans_matrix[j_1,j_2] <- likelihood_f(allp$p1,pi_vector,c(1,alpha_vector[j_1]),c(1,beta_vector[j_2]))
  }
}

# expectation_f
for (j_1 in 1:length(alpha_vector)){
  for (j_2 in 1:length(beta_vector)){
    ans_matrix[j_1,j_2] <- expectation_f(c(alpha_vector[j_1],beta_vector[j_2]),allp$p1,pi_vector,2,c(1,alpha_vector[j_1]),c(1,beta_vector[j_1]))
  }
}

surf3D(M$x,M$y,ans_matrix, colkey=TRUE,bty="b2",xlab="alpha",ylab="beta",zlab="log likelihood",shade=0.1,axes=TRUE,ticktype="detailed")


#########################################
# plot log likelihood as function of pi #
#########################################
alphas <- c(1,1)
betas <- c(1,4)
pi_2 <- seq(0,1,length=20)
y <- seq(0,0,length=20)
for (i in 1:length(pi_2)){
  y[i] <- log_likelihood_f(allp$p1, c(1-pi_2[i],pi_2[i]),alphas,betas)
}
plot(pi_2,y)

