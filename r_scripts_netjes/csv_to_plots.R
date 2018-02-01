# csv (writen with run_EM_to_csv.R) to plots etc.

run <- 1
dataset_number <- 1
number_of_iterations <- number_of_iterations
n2 <- 1

# read alpha
file <- paste("data/dataset",dataset_number,"/alpha_run",run,".csv",sep="")
read.table(file=file,skip=(number_of_iterations+2)*(n2-1) + 1,nrows=number_of_iterations + 1)
# read beta
file <- paste("data/dataset1/beta_run",run,".csv",sep="")
read.table(file=file,skip=(number_of_iterations+2)*(n2-1) + 1,nrows=number_of_iterations + 1)
# read pi
file <- paste("data/dataset1/pi_vector_run",run,".csv",sep="")
read.table(file=file,skip=(number_of_iterations+2)*(n2-1) + 1,nrows=number_of_iterations + 1)
# read likelihood
file <- paste("data/dataset1/log_lik_run",run,"1.csv",sep="")
read.table(file=file,skip=(number_of_iterations_2)*(n2-1) + 1,nrows=number_of_iterations + 1)
