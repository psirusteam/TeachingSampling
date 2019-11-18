\name{Pikl}
\alias{Pikl}
\title{Second Order Inclusion Probabilities for Fixed Size Without Replacement Sampling Designs}
\description{Computes the second-order inclusion probabilities of each par of units in the population given a
fixed sample size design}
\usage{
Pikl(N, n, p)
}
\arguments{
\item{N}{Population size}
\item{n}{Sample size}
\item{p}{A vector containing the selection probabilities of a fixed size without replacement sampling design. The sum of the values of this vector must be one}
}
\seealso{
\code{\link{VarHT}, \link{Deltakl}, \link{Pik}}
}
\details{The second-order inclusion probability of the \eqn{kl}th units is defined as the probability that unit \eqn{k} and unit 
\eqn{l} will be both included in a sample; it is denoted by \eqn{\pi_{kl}} and obtained from a given sampling design as follows:
\deqn{\pi_{kl}=\sum_{s\ni k,l}p(s)}
}
\value{The function returns a symmetric matrix of size \eqn{N \times N} containing the second-order inclusion probabilities 
for each pair of units in the finite population.}
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
# p is the probability of selection of every sample. 
p <- c(0.13, 0.2, 0.15, 0.1, 0.15, 0.04, 0.02, 0.06, 0.07, 0.08)
# Note that the sum of the elements of this vector is one
sum(p)
# Computation of the second-order inclusion probabilities
Pikl(N, n, p)
}
\keyword{survey}
