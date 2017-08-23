\name{Support}
\alias{Support}
\title{Sampling Support for Fixed Size Without Replacement Sampling Designs}
\description{Creates a matrix containing every possible sample under fixed sample size designs}
\usage{
Support(N, n, ID=FALSE)
}
\arguments{
\item{N}{Population size}
\item{n}{Sample size}
\item{ID}{By default FALSE, a vector of values (numeric or string) identifying each unit in the population}
}
\seealso{
\code{\link{Ik}}
}
\details{A support is defined as the set of samples such that for any sample in the support, all the permutations
of the coordinates of the sample are also in the support}
\value{The function returns a matrix of \eqn{binom(N)(n)} rows and \eqn{n} columns. Each row of this matrix 
corresponds to a possible sample}
\author{Hugo Andres Gutierrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Tille, Y. (2006), \emph{Sampling Algorithms}. Springer\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas
}
\examples{
# Vector U contains the label of a population
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
n <- 2
# The support for fixed size without replacement sampling designs
# Under this context, there are ten (10) possibles samples
Support(N,n)
# The same support, but labeled
Support(N,n,ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
# The following output is very useful when checking 
# the design-unbiasedness of an estimator
Support(N,n,ID=y)
}
\keyword{survey}
