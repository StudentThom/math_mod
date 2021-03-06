# run em algo en plot bby c alling functions


### EXAMPLE 1 ###
# variables
data = allp$p4[1:10]
alpha = c(1,3)
beta = c(1,1)
number_of_iterations = 1
# initial value
pi_vector = c(0.3,0.7)

# run EM algo
lijst <- em_algo(data,pi_vector,alpha,beta,number_of_iterations)
pi_vector <- lijst[[1]]
alpha <- lijst[[2]]
beta <- lijst[[3]]

# plot result
plot_distribution(data, pi_vector, alpha, beta)

### EXAMPLE 2 ###
# variables
data = allp$p4
alpha = c(1,1,5,1.1)
beta = c(1,3,1,1)
number_of_iterations = 15
# initial value
pi_vector = c(0.25,0.25,0.25,0.25)

# run EM algo
pi_vector <- em_algo(data,pi_vector,alpha,beta,number_of_iterations)

# plot result
plot_distribution(data, pi_vector, alpha, beta)