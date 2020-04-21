#' @export
#' 
#' @title
#' Two different varaince estimators for the Horvitz-Thompson estimator
#' @description 
#' This function estimates the variance of the Horvitz-Thompson estimator.
#' Two different variance estimators are computed: the original one, due to Horvitz-Thompson
#' and the one due to Sen (1953) and Yates, Grundy (1953). 
#' The two approaches yield unbiased estimator under fixed-size sampling  schemes. 
#' @return 
#' This function returns a data frame of every possible sample in 
#' within a sampling support, with its corresponding variance estimates.
#' @details
#' The function returns two variance estimator for every possible sample
#' within a fixed-size sampling support. 
#' The first estimator is due to Horvitz-Thompson and is given by the following expression:
#' \deqn{\widehat{Var}_1(\hat{t}_{y,\pi}) = \sum_{k \in U}\sum_{l\in U}\frac{\Delta_{kl}}{\pi_{kl}}\frac{y_k}{\pi_k}\frac{y_l}{\pi_l}}
#' The second estimator is due to Sen (1953) and Yates-Grundy (1953). It is given by the following expression:
#' \deqn{\widehat{Var}_2(\hat{t}_{y,\pi}) = -\frac{1}{2}\sum_{k \in U}\sum_{l\in U}\frac{\Delta_{kl}}{\pi_{kl}}(\frac{y_k}{\pi_k} - \frac{y_l}{\pi_l})^2}
#' @author Hugo Andres Gutierrez Rojas <hagutierrezro at gmail.com> 
#' @param y Vector containing the information of the characteristic of interest 
#' for every unit in the population.
#' @param N Population size.
#' @param n Sample size.
#' @param p A vector containing the selection probabilities of a fixed size without replacement sampling design. 
#' The sum of the values of this vector must be one.
#' 
#' @references 
#' Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
#' Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas 
#' y estimacion de parametros}. Editorial Universidad Santo Tomas.
#' 
#' @examples
#' 
#' # Example 1
#' # Without replacement sampling
#' # Vector U contains the label of a population of size N=5
#' U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
#' # Vector y1 and y2 are the values of the variables of interest
#' y1<-c(32, 34, 46, 89, 35)
#' y2<-c(1,1,1,0,0)
#' # The population size is N=5
#' N <- length(U)
#' # The sample size is n=2
#' n <- 2
#' # p is the probability of selection of every possible sample
#' p <- c(0.13, 0.2, 0.15, 0.1, 0.15, 0.04, 0.02, 0.06, 0.07, 0.08)
#' 
#' # Calculates the estimated variance for the HT estimator
#' VarSYGHT(y1, N, n, p)
#' VarSYGHT(y2, N, n, p)
#'
#' # Unbiasedness holds in the estimator of the total
#' sum(y1)
#' sum(VarSYGHT(y1, N, n, p)$p * VarSYGHT(y1, N, n, p)$Est.HT)
#' sum(y2)
#' sum(VarSYGHT(y2, N, n, p)$p * VarSYGHT(y2, N, n, p)$Est.HT)
#' 
#' # Unbiasedness also holds in the two variances
#' VarHT(y1, N, n, p)
#' sum(VarSYGHT(y1, N, n, p)$p * VarSYGHT(y1, N, n, p)$Est.Var1)
#' sum(VarSYGHT(y1, N, n, p)$p * VarSYGHT(y1, N, n, p)$Est.Var2)
#' 
#' VarHT(y2, N, n, p)
#' sum(VarSYGHT(y2, N, n, p)$p * VarSYGHT(y2, N, n, p)$Est.Var1)
#' sum(VarSYGHT(y2, N, n, p)$p * VarSYGHT(y2, N, n, p)$Est.Var2)
#' 
#' # Example 2: negative variance estimates
#' 
#' x = c(2.5, 2.0, 1.1, 0.5)
#' N = 4
#' n = 2
#' p = c(0.31, 0.20, 0.14, 0.03, 0.01, 0.31)
#'
#' VarSYGHT(x, N, n, p)
#' 
#' # Unbiasedness holds in the estimator of the total
#' sum(x)
#' sum(VarSYGHT(x, N, n, p)$p * VarSYGHT(x, N, n, p)$Est.HT)
#' 
#' # Unbiasedness also holds in the two variances
#' VarHT(x, N, n, p)
#' sum(VarSYGHT(x, N, n, p)$p * VarSYGHT(x, N, n, p)$Est.Var1)
#' sum(VarSYGHT(x, N, n, p)$p * VarSYGHT(x, N, n, p)$Est.Var2)

VarSYGHT <- function (y, N, n, p) 
{
  Ind <- Ik(N, n)
  pi1 <- as.matrix(Pik(p, Ind))
  pi2 <- Pikl(N, n, p)
  Delta <- Deltakl(N, n, p)
  y <- t(as.matrix(y))
  ykylexp <- t(y/pi1) %*% (y/pi1)
  A <- (Delta/pi2) * (ykylexp)
  Q <- nrow(Ind)
  MatDif <- matrix(NA, nrow = N, ncol = N)
  for(k in 1:N){
    for(l in 1:N){
      MatDif[k, l] <- (y[k]/pi1[k] - y[l]/pi1[l])^2 
    }
  }
  B <- (Delta/pi2) * MatDif
  
  Est.Var1 = Est.Var2 = Est.HT =NULL
  for(i in 1:Q){
    index = which(Ind[i,] != 0)
    Est.HT[i] = HT(y[index], pi1[index])
    Est.Var1[i] = sum(A[index, index])
    Est.Var2[i] = - (1/2) * sum(B[index, index])
  }
  Resultado <- data.frame(I = Ind, p = p, Est.HT = Est.HT, Est.Var1 = Est.Var1, Est.Var2 = Est.Var2)
  return(Resultado)
}
