\name{VarHT}
\alias{VarHT}
\title{Variance of the Horvitz-Thompson Estimator}
\description{Computes the theoretical variance of the Horvitz-Thompson estimator given a without replacement fixed sample size design}
\usage{
VarHT(y, N, n, p)
}
\arguments{
\item{y}{Vector containing the recollected information of the characteristic of interest for every unit in the population}
\item{N}{Population size}
\item{n}{Sample size}
\item{p}{A vector containing the selection probabilities of a fixed size without replacement sampling design. The sum of the values of this vector must be one}
}
\seealso{
\code{\link{HT}, \link{Deltakl}, \link{Pikl}, \link{Pik}}
}
\details{The variance of the Horvitz-Thompson estimator, under a given sampling design \eqn{p}, is given by 
\deqn{Var_p(\hat{t}_{y,\pi})=\sum_{k\in U}\sum_{l \in U}\Delta_{kl}\frac{y_k}{\pi_k}\frac{y_l}{\pi_l}}
}
\value{The function returns the value of the theoretical variances of the Horviz-Thompson estimator.}
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
# Without replacement sampling
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector y1 and y2 are the values of the variables of interest
y1<-c(32, 34, 46, 89, 35)
y2<-c(1,1,1,0,0)
# The population size is N=5
N <- length(U)
# The sample size is n=2
n <- 2
# p is the probability of selection of every possible sample
p <- c(0.13, 0.2, 0.15, 0.1, 0.15, 0.04, 0.02, 0.06, 0.07, 0.08)

# Calculates the theoretical variance of the HT estimator
VarHT(y1, N, n, p)
VarHT(y2, N, n, p)
}
\keyword{survey}
