\name{S.WR}
\alias{S.WR}
\title{Simple Random Sampling With Replacement}
\description{Draws a simple random sample witht replacement of size \eqn{m} from a population of size \eqn{N}}
\usage{
S.WR(N, m)
}
\arguments{
\item{N}{Population size}
\item{m}{Sample size}      
}
\seealso{
\code{\link{E.WR}}
}
\details{The selected sample is drawn according to a sequential procedure algorithm based on a binomial distribution}
\value{The function returns a vector of size \eqn{m}. Each element of this vector indicates the unit that was selected.}  
\author{Hugo Andres Gutierrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{      
Tille, Y. (2006), \emph{Sampling Algorithms}. Springer.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Draws a simple random sample witho replacement of size m=3
sam <- S.WR(5,3)
sam
# The selected sample
U[sam]

############
## Example 2
############
# Uses the Lucy data to draw a random sample of units accordind to a
# simple random sampling with replacement design
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
m <- 400
sam<-S.WR(N,m)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
}
\keyword{survey}
