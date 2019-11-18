\name{S.BE}
\alias{S.BE}
\title{Bernoulli Sampling Without Replacement}
\description{Draws a Bernoulli sample without replacement of expected size $n$ from a population of size $N$}
\usage{
S.BE(N, prob)
}
\arguments{
\item{N}{Population size}
\item{prob}{Inclusion probability for each unit in the population}
}
\seealso{
\code{\link{E.BE}}
}
\details{The selected sample is drawn according to a sequential procedure algorithm based on an uniform distribution. The Bernoulli
sampling design is not a fixed sample size one.}
\value{The function returns a vector of size \eqn{N}. Each element of this vector indicates if the unit was selected. Then,
if the value of this vector for unit \eqn{k} is zero, the unit \eqn{k} was not selected in the sample; otherwise, the unit was
selected in the sample.}
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.\cr
Tille, Y. (2006), \emph{Sampling Algorithms}. Springer.
}
\examples{
############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Draws a Bernoulli sample without replacement of expected size n=3
# The inlusion probability is 0.6 for each unit in the population
sam <- S.BE(5,0.6)
sam
# The selected sample is
U[sam]

############
## Example 2
############
# Uses the Lucy data to draw a Bernoulli sample

data(Lucy)
attach(Lucy)
N <- dim(Lucy)[1]
# The population size is 2396. If the expected sample size is 400
# then, the inclusion probability must be 400/2396=0.1669
sam <- S.BE(N,0.01669)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
}
\keyword{survey}
