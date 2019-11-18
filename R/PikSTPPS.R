#' @export
#' 
#' @title
#' Inclusion Probabilities in Stratified Proportional to Size Sampling Designs
#' @description 
#' For a given sample size, in each stratum, this function returns a vector of first order
#' inclusion probabilities for an stratified sampling design proportional to an auxiliary variable. 
#' @return 
#' A vector of inclusion probablilities in a stratified finite population.
#' @details
#' is not always less than unity. A sequential algorithm must be used in order to ensure that for 
#' every unit in the population the inclusion probability gives a proper value; i.e. less or equal
#' to unity.
#' @author Hugo Andres Gutierrez Rojas <hagutierrezro at gmail.com>
#' @param S Vector identifying the membership to the strata of each unit in the population.
#' @param x Vector of auxiliary information for each unit in the population.
#' @param nh The vector defningn the sample size in each stratum.
#' 
#' @references 
#' Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}. Editorial Universidad Santo Tomas
#' Sarndal, C-E. and Swensson, B. and Wretman, J. (2003), \emph{Model Assisted Survey Sampling}. Springer.
#' @seealso \code{\link{PikHol}, \link{PikPPS}, \link{S.STpiPS}}
#' @examples 
#' ############
#' ## Example 1
#' ############
#' # Vector U contains the label of a population of size N=5
#' U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
#' # The auxiliary information
#' x <- c(52, 60, 75, 100, 50)
#' # Vector Strata contains an indicator variable of stratum membership
#' Strata <- c("A", "A", "A", "B", "B")
#' # The sample size in each stratum
#' nh <- c(2,2)
#' # The vector of inclusion probablities for a stratified piPS sample 
#' # without replacement of size two within each stratum
#' Pik <- PikSTPPS(Strata, x, nh)
#' Pik
#' 
#' # Some checks
#' sum(Pik)
#' sum(nh)
#' 
#' ############
#' ## Example 2
#' ############
#' # Uses the Lucy data to compute the vector of inclusion probablities 
#' # for a stratified random sample according to a piPS design in each stratum
#' 
#' data(Lucy)
#' attach(Lucy)
#' # Level is the stratifying variable
#' summary(Level)
#' 
#' # Defines the size of each stratum
#' N1<-summary(Level)[[1]]
#' N2<-summary(Level)[[2]]
#' N3<-summary(Level)[[3]]
#' N1;N2;N3
#' 
#' # Defines the sample size at each stratum
#' n1<-70
#' n2<-100
#' n3<-200
#' nh<-c(n1,n2,n3)
#' nh
#' 
#' # Computes the inclusion probabilities for the stratified population
#' S <- Level
#' x <- Employees
#' Pik <- PikSTPPS(S, x, nh)
#' 
#' # Some checks
#' sum(Pik)
#' sum(nh)

PikSTPPS <- function(S, x, nh){
  S <- as.factor(S)
  S <- as.factor(as.integer(S))
  pik <- matrix(NA, nrow = length(x), ncol = 1)
  cum <- cumsum(nh)
  
  for(k in 1:length(nh)){
    h <- which(S == k)
    pik.h <- PikPPS(nh[k], x[h])
    pik[h, ] <- pik.h 
  }
  pik
}
