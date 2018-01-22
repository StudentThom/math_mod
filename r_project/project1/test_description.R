# test docstring

kwadraat <- function(x) {
  
  #' Square a number
  #' 
  #' calculates the square of an input
  #' 
  #' @param x the input to be squaredd
  
  ans = x^2
  return(ans)
}


mixture_density <- function(x, pi_0, pi_1, alpha, beta){
  #' Denisty of a mixture distribution
  #'
  #' Give density of a mixture uniform with one beta(alpha,beta) distribution
  #'
  #' mixture(density(seq(0,1,0.1),0.5,0.5,1,4)) 
  #' 
  #' @param x vector over which density is calculated, usually on interval (0,1)
  #' @param pi vector of length two with weight of uniform and beta distribution
  #'
  pi_0 * dunif(x) + pi_1 * dbeta(x,alpha,beta)
}
docstring(mixture_density)



devtools::document()
