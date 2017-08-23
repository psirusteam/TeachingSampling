\name{SupportRS}
\alias{SupportRS}
\title{Sampling Support for Random Size Without Replacement Sampling Designs}
\description{Creates a matrix containing every possible sample under random sample size designs}
\usage{
SupportRS(N, ID=FALSE)
}
\arguments{
\item{N}{Population size}
\item{ID}{By default FALSE, a vector of values (numeric or string) identifying each unit in the population}
}
\seealso{
\code{\link{IkRS}}
}
\details{A support is defined as the set of samples such that for any sample in the support, all the permutations of the coordinates of the sample are also in the support}
\value{The function returns a matrix of \eqn{2^N} rows and \eqn{N} columns. Each row of this matrix corresponds to a possible sample}
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
# The support for fixed size without replacement sampling designs
# Under this context, there are ten (10) possibles samples
SupportRS(N)
# The same support, but labeled
SupportRS(N, ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
# The following output is very useful when checking 
# the design-unbiasedness of an estimator
SupportRS(N, ID=y)
}
\keyword{survey}
