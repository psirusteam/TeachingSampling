\name{Deltakl}
\alias{Deltakl}
\title{Variance-Covariance Matrix of the Sample Membership Indicators for Fixed Size Without Replacement Sampling Designs}
\description{Computes the Variance-Covariance matrix of the sample membership indicators in the population given a
fixed sample size design}
\usage{
Deltakl(N, n, p)
}
\arguments{
\item{N}{Population size}
\item{n}{Sample size}
\item{p}{A vector containing the selection probabilities of a fixed size without replacement sampling design. The sum of the values of this vector must be one}
}
\seealso{
\code{\link{VarHT}, \link{Pikl}, \link{Pik}}
}
\details{The \eqn{kl}th unit of the Variance-Covariance matrix of the sample membership indicators is defined as 
\eqn{\Delta_{kl}=\pi_{kl}-\pi_k\pi_l}
}
\value{The function returns a symmetric matrix of size \eqn{N \times N} containing the variances-covariances among the sample membership indicators for each pair of units in the finite population.}
\author{Hugo Andres Gutierrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
# The sample size is n=2
n <- 2
# p is the probability of selection of every sample. 
p <- c(0.13, 0.2, 0.15, 0.1, 0.15, 0.04, 0.02, 0.06, 0.07, 0.08)
# Note that the sum of the elements of this vector is one
sum(p)
# Computation of the Variance-Covariance matrix of the sample membership indicators
Deltakl(N, n, p)
}
\keyword{survey}
