\name{Ik}
\alias{Ik}
\title{Sample Membership Indicator}
\description{Creates a matrix of values (0, if the unit belongs to a specified sample and 1, otherwise) 
for every possible sample under fixed sample size designs without replacement}
\usage{
Ik(N, n)
}
\arguments{
\item{N}{Population size}
\item{n}{Sample size}
}
\seealso{
\code{\link{Support}, \link{Pik}}
}
\value{The function returns a matrix of \eqn{binom(N)(n)} rows and \eqn{N} columns. The \eqn{k}th column corresponds to the sample 
membership indicator, of the \eqn{k}th unit, to a possible sample.}
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
n <- 2
# The sample membership matrix for fixed size without replacement sampling designs
Ik(N,n)
# The first unit, Yves, belongs to the first four possible samples 
}
\keyword{survey}
