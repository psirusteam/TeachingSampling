\name{nk}
\alias{nk}
\title{Sample Selection Indicator for With Replacement Sampling Designs}
\description{The function returns a matrix of \eqn{binom(N+m-1)(m)} rows and \eqn{N} columns. Creates a matrix of values (0, if the unit does not belongs to a specified sample, 1, if the unit is selected once in the sample; 2, if the unit is selected twice in the sample, etc.) for every possible sample under fixed sample size designs with replacement}
\usage{
nk(N, m)
}
\arguments{
\item{N}{Population size}
\item{m}{Sample size}
}
\seealso{
\code{\link{SupportWR}, \link{Pik}}
}
\value{The function returns a matrix of \eqn{binom(N+m-1)(m)} rows and \eqn{N} columns. The \eqn{k}th column corresponds to the sample 
selection indicator, of the \eqn{k}th unit, to a possible sample.}
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
nk(N,m)
}
\keyword{survey}
