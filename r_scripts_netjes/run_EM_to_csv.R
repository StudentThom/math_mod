# Run EM and write result to csv

# variables
dataset_number <- 4 # still to implement if file path by writing

data = allp$p4
number_of_iterations <- 8
run <- 3
# initial value
pi_vector = c(0.34,0.33,0.33)
alpha1 <- seq(0.1,5,length=3)
alpha2 <- seq(1.1,6,length=3)
beta1 <- seq(0.1,5,length=3)
beta2 <- seq(1.1,6,length=3)
append = FALSE

for (a1 in 1:length(alpha1)){
  for (a2 in 1:length(alpha2)){
    for (b1 in 1:length(beta1)){
      for (b2 in 1:length(beta2)){
        lijst <- em_algo(data,pi_vector,c(1,alpha1[a1],alpha2[a2]),c(1,beta1[b1],beta2[b2]),number_of_iterations)
        pi_vector_archive <- lijst[[4]]
        alpha_archive <- lijst[[5]]
        beta_archive <- lijst[[6]]
        log_lik <- lijst[[7]]
        write.table(alpha_archive,file=paste("data/dataset1/alpha_run",run,".csv",sep=""),append=append,row.names = FALSE)
        write.table(beta_archive,file=paste("data/dataset1/beta_run",run,".csv",sep=""),append=append,row.names = FALSE)
        write.table(pi_vector_archive,file=paste("data/dataset1/pi_vector_run",run,".csv",sep=""),append=append,row.names = FALSE)
        write.table(log_lik,file=paste("data/dataset1/log_lik_run",run,".csv",sep=""),append=append,row.names = FALSE)
        append = TRUE
      } 
    } 
  }  
}
n2 <- 1
read.table(file="data/test.csv",skip=(number_of_iterations_2)*(n2-1),nrows=number_of_iterations + 2)


# run EM algo
lijst <- em_algo(data,pi_vector,alpha,beta,number_of_iterations)
pi_vector_new <- lijst[[1]]
alpha_new <- lijst[[2]]
beta_new <- lijst[[3]]
pi_vector_archive <- lijst[[4]]
alpha_archive <- lijst[[5]]
beta_archive <- lijst[[6]]
log_lik <- lijst[[7]]