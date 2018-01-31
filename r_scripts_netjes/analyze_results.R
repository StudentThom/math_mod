# analyze results of run_em

#variables
titel <- "Parameterwaarden per iteratiestap voor dataset 2"
x_as <- "iteratiestap"
alpha_col <-"red"
beta_col <-"blue"
pi_col <-"black"
colours <- c(alpha_col,beta_col,pi_col)

# plot values for each iterations
tijd <- seq(0,number_of_iterations,1)
plot(tijd,alpha_archive[,1],type="b",col=alpha_col,ylim=c(0,5),xlab=x_as,ylab="parameterwaarde",main=titel)
lines(tijd,beta_archive[,1],type="b",col=beta_col)
lines(tijd,pi_vector_archive[,1],type="b",col=pi_col)
legend(x=5,legend=expression(
  alpha["2,n"],beta["2,n"],pi["2,n"]
),lwd=1,col=colours)

# plot log likelihood
tijd <- seq(0,number_of_iterations,1)
plot(tijd,log_lik,type="b",ylab="log likelihood",xlab=x_as)

# afgeleide log likelihood (to show convergence)
log_lik_derivative <- 0
for (n in 1:(length(log_lik)-1)){
  log_lik_derivative[n] <- log_lik[n+1] - log_lik[n]
}
x <- seq(1,length(log_lik_derivative),1)
plot(x,log_lik_derivative,type="b",xlab = x_as,ylab="verschil met vorige log likelihood")


###########
# KS.TEST # (werkt nog niet)
###########
alpha_new[2] = 3
beta_new[2] <- 1
pi_vector_new <- c(0.65,0.35)
x <- seq(0,1,length=51)
y <- pi_vector_new[1] * dunif(x,0,1) + pi_vector_new[2] * dbeta(x,alpha_new[2],beta_new[2])
ks.test(sort(allp$p1),y)
