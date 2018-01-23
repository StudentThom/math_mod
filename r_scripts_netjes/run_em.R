# Run EM algorith

setwd("/media/mynewdrive1/Documenten/Wiskunde/2017-2018/math_mod/r_scripts_netjes")

# imports
source("helpers.R")
source("load_and_plot.R")

### EXAMPLE 1 ###
# variables
data = allp$p2
alpha = c(1,0.93,3)
beta = c(1,2.96,2)
number_of_iterations = 8
# initial value
pi_vector = c(0.5,0.3,0.2)

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

print_results(alpha,beta,pi_vector,start_time,alpha_new,beta_new,pi_vector_new,end_time)

# plot result
par(mfrow=c(1,2))
plot_distribution(data, pi_vector, alpha, beta,main="Old fit")
plot_distribution(data, pi_vector_new, alpha_new, beta_new,main="New fit")


### EXAMPLE 2 ###
# variables
data = allp$p2
alpha = c(1,1)
beta = c(1,3)
number_of_iterations = 5
# initial value
pi_vector = c(0.25,0.75)

# run EM algo
pi_vector <- em_algo(data,pi_vector,alpha,beta,number_of_iterations)

# plot result
plot_distribution(data, pi_vector, alpha, beta)


