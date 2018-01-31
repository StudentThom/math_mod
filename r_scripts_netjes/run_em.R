# Run EM algorith

install.packages("tictoc")
library("tictoc")

setwd("/home/thom/Documents/wiskunde/2017-2018/math_mod/r_scripts_netjes")
setwd("/media/mynewdrive1/Documenten/Wiskunde/2017-2018/math_mod/r_scripts_netjes")

# imports
source("helpers.R")
source("load_and_plot.R")

### EXAMPLE 1 ###
# variables
data = allp$p1
alpha = c(1,3)
beta = c(1,1)
number_of_iterations = 20
# initial value
pi_vector = c(0.5,0.5)

# run EM algo
start_time <- Sys.time()
lijst <- em_algo(data,pi_vector,alpha,beta,number_of_iterations)
end_time <- Sys.time()
pi_vector_new <- lijst[[1]]
alpha_new <- lijst[[2]]
beta_new <- lijst[[3]]
pi_vector_archive <- lijst[[4]]
alpha_archive <- lijst[[5]]
beta_archive <- lijst[[6]]
log_lik <- lijst[[7]]

print_results(alpha,beta,pi_vector,start_time,alpha_new,beta_new,pi_vector_new,end_time)

# plot result
par(mfrow=c(1,2))
plot_distribution(data, pi_vector, alpha, beta,main="Old fit")
plot_distribution(data, pi_vector_new, alpha_new, beta_new,main="New fit")


### DATASET 2 ###
# variables
data = allp$p2
alpha = c(1,3)
beta = c(1,1)
number_of_iterations = 25
# initial value
pi_vector = c(0.5,0.5)

# run EM algo
lijst <- em_algo(data,pi_vector,alpha,beta,number_of_iterations)
pi_vector_new <- lijst[[1]]
alpha_new <- lijst[[2]]
beta_new <- lijst[[3]]
pi_vector_archive <- lijst[[4]]
alpha_archive <- lijst[[5]]
beta_archive <- lijst[[6]]
log_lik <- lijst[[7]]
# plot result
par(mfrow=c(1,2))
plot_distribution(data, pi_vector, alpha, beta,main="Old fit")
plot_distribution(data, pi_vector_new, alpha_new, beta_new,main="New fit")


### DATASET 3 ###
# variables
data = allp$p3
alpha = c(1,3)
beta = c(1,1)
number_of_iterations = 11
# initial value
pi_vector = c(0.5,0.5)

# run EM algo
lijst <- em_algo(data,pi_vector,alpha,beta,number_of_iterations)
pi_vector_new <- lijst[[1]]
alpha_new <- lijst[[2]]
beta_new <- lijst[[3]]
pi_vector_archive <- lijst[[4]]
alpha_archive <- lijst[[5]]
beta_archive <- lijst[[6]]
# plot result
par(mfrow=c(1,2))
plot_distribution(data, pi_vector, alpha, beta,main="Old fit")
plot_distribution(data, pi_vector_new, round(alpha_new,2), round(beta_new,2),main="New fit")


### DATASET 4 ###
# variables
data = allp$p4
alpha = c(1,3)
beta = c(1,1)
number_of_iterations = 11
# initial value
pi_vector = c(0.5,0.5)

# run EM algo
lijst <- em_algo(data,pi_vector,alpha,beta,number_of_iterations)
pi_vector_new <- lijst[[1]]
alpha_new <- lijst[[2]]
beta_new <- lijst[[3]]
pi_vector_archive <- lijst[[4]]
alpha_archive <- lijst[[5]]
beta_archive <- lijst[[6]]
# plot result
par(mfrow=c(1,2))
plot_distribution(data, pi_vector, alpha, beta,main="Old fit")
plot_distribution(data, pi_vector_new, alpha_new, beta_new,main="New fit")


#########################################
# Plot distributions for each iteration #
#########################################

par(mfrow=c(4,3))
x_pos_1 <- 0.0
x_pos_2 <- 0.08
x_pos_3 <- 0.22
y_pos_1 <- 1.00
y_pos_2 <- 0.9
y_pos_3 <- 0.8
# plot for initial value
plot_distribution(data, pi_vector, alpha, beta,main="")
text(x_pos_1,y_pos_1,expression(alpha[2]))
text(x_pos_2,y_pos_1,"=")
text(x_pos_3,y_pos_1,round(alpha[2],digits=2))
text(x_pos_1,y_pos_2,expression(beta[2]))
text(x_pos_2,y_pos_2,"=")
text(x_pos_3,y_pos_2,round(beta[2],digits=2))
text(x_pos_1,y_pos_3,expression(pi[2]))
text(x_pos_2,y_pos_3,"=")
text(x_pos_3,y_pos_3,round(pi_vector[2],digits=2))
# all other plots
for (n in 1:11){
  plot_distribution(data, pi_vector_archive[n,], round(alpha_archive[n,],2), round(beta_archive[n,],2),main="")
  text(x_pos_1,y_pos_1,expression(alpha[2]))
  text(x_pos_2,y_pos_1,"=")
  text(x_pos_3,y_pos_1,round(alpha_archive[n,2],digits=2))
  text(x_pos_1,y_pos_2,expression(beta[2]))
  text(x_pos_2,y_pos_2,"=")
  text(x_pos_3,y_pos_2,round(beta_archive[n,2],digits=2))
  text(x_pos_1,y_pos_3,expression(pi[2]))
  text(x_pos_2,y_pos_3,"=")
  text(x_pos_3,y_pos_3,round(pi_vector_archive[n,2],digits=2))
}

#################################################
# Plot alpha/beta/pi_j_n 's over iterationsteps #
#################################################



