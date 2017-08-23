\name{IkWR}
\alias{IkWR}
\title{Sample Membership Indicator for with Replacements sampling designs}
\description{Creates a matrix of values (1, if the unit belongs to a specified sample and 0, otherwise) 
for every possible sample under fixed sample size designs without replacement}
\usage{
IkWR(N, m)
}
\arguments{
\item{N}{Population size}
\item{m}{Sample size}
}
\seealso{
\code{\link{nk}, \link{Support}, \link{Pik}}
}
\value{The function returns a matrix of \eqn{binom(N+m-1)(m)} rows and \eqn{N} columns. The \eqn{k}th column corresponds to the sample 
membership indicator, of the \eqn{k}th unit, to a possible sample. It returns a value of 1, even if the element is selected more than once in a with replacement sample.}
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
m <- 2
# The sample membership matrix for fixed size without replacement sampling designs
IkWR(N,m)
}
\keyword{survey}
