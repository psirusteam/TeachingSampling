\name{Pik}
\alias{Pik}
\title{Inclusion Probabilities for Fixed Size Without Replacement Sampling Designs}
\description{Computes the first-order inclusion probability of each unit in the population given a
fixed sample size design}
\usage{
Pik(p, Ind)
}
\arguments{
\item{p}{A vector containing the selection probabilities of a fixed size without replacement sampling design. The sum of the values of this vector must be one}
\item{Ind}{A sample membership indicator matrix}
}
\seealso{
\code{\link{HT}}
}
\details{The inclusion probability of the \eqn{k}th unit is defined as the probability that this unit will be
included in a sample, it is denoted by \eqn{\pi_k} and obtained from a given sampling design as follows:
\deqn{\pi_k=\sum_{s\ni k}p(s)}
}
\value{The function returns a vector of inclusion probabilities for each unit in the finite population.}
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}}
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
# The sample membership matrix for fixed size without replacement sampling designs
Ind <- Ik(N,n)
# p is the probability of selection of every sample. 
p <- c(0.13, 0.2, 0.15, 0.1, 0.15, 0.04, 0.02, 0.06, 0.07, 0.08)
# Note that the sum of the elements of this vector is one
sum(p)
# Computation of the inclusion probabilities
inclusion <- Pik(p, Ind)
inclusion
# The sum of inclusion probabilities is equal to the sample size n=2
sum(inclusion)
}
\keyword{survey}
