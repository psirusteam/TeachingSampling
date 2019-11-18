\name{OrderWR}
\alias{OrderWR}
\title{Pseudo-Support for Fixed Size With Replacement Sampling Designs}
\description{Creates a matrix containing every possible ordered sample under fixed sample size with replacement designs}
\usage{
OrderWR(N,m,ID=FALSE)
}
\arguments{
\item{N}{Population size}
\item{m}{Sample size}
\item{ID}{By default FALSE, a vector of values (numeric or string) identifying each unit in the population}
}
\seealso{
\code{\link{SupportWR}, \link{Support}}
}
\details{The number of samples in a with replacement support is not equal to the number
of ordered samples induced by a with replacement sampling design.}
\value{The function returns a matrix of \eqn{N^m} rows and \eqn{m} columns. Each row of this matrix
corresponds to a possible ordered sample.}
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}. The author acknowledges to Hanwen Zhang for valuable suggestions.}
\references{
Tille, Y. (2006), \emph{Sampling Algorithms}. Springer\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas
}
\examples{
# Vector U contains the label of a population
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
# Under this context, there are five (5) possible ordered samples
OrderWR(N,1)
# The same output, but labeled
OrderWR(N,1,ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
OrderWR(N,1,ID=y)

# If the smaple size is m=2, there are (25) possible ordered samples
OrderWR(N,2)
# The same output, but labeled
OrderWR(N,2,ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
OrderWR(N,2,ID=y)

# Note that the number of ordered samples is not equal to the number of 
# samples in a well defined with-replacement support 
OrderWR(N,2)
SupportWR(N,2)

OrderWR(N,4)
SupportWR(N,4)
}
\keyword{survey}
