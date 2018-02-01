# Run EM and write result to csv

# variables
data = allp$p3
number_of_iterations <- 15
run <- 2
dataset_number <- 3 
# initial value
pi_vector = c(1)
alpha1 <- c(1)
alpha2 <- NULL
beta1 <- c(1)
beta2 <- NULL
append = FALSE

for (a1 in 1:length(alpha1)){
  for (a2 in 1:length(alpha2)){
    for (b1 in 1:length(beta1)){
      for (b2 in 1:length(beta2)){
        lijst <- em_algo(data,pi_vector,c(alpha1[a1],alpha2[a2]),c(beta1[b1],beta2[b2]),number_of_iterations)
        pi_vector_archive <- lijst[[4]]
        alpha_archive <- lijst[[5]]
        beta_archive <- lijst[[6]]
        log_lik <- lijst[[7]]
        write.table(alpha_archive,file=paste("data/dataset",dataset_number,"/alpha_run",run,".csv",sep=""),append=append,row.names = FALSE)
        write.table(beta_archive,file=paste("data/dataset",dataset_number,"/beta_run",run,".csv",sep=""),append=append,row.names = FALSE)
        write.table(pi_vector_archive,file=paste("data/dataset",dataset_number,"/pi_vector_run",run,".csv",sep=""),append=append,row.names = FALSE)
        write.table(log_lik,file=paste("data/dataset",dataset_number,"/log_lik_run",run,".csv",sep=""),append=append,row.names = FALSE)
        append = TRUE
      } 
    } 
  }  
}
