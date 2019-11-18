\name{S.SY}
\alias{S.SY}
\title{Systematic Sampling}
\description{Draws a Systematic sample of size $n$ from a population of size $N$}
\usage{
S.SY(N, a)
}
\arguments{
\item{N}{Population size}
\item{a}{Number of groups dividing the population}
}
\seealso{
\code{\link{E.SY}}
}
\details{The selected sample is drawn according to a random start.}
\value{The function returns a vector of size \eqn{n}. Each element of this vector indicates the unit that was selected.}
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}. The author acknowledges to
Kristina Stodolova \email{Kristyna.Stodolova@seznam.cz} for valuable suggestions.}
\references{
Madow, L.H. and Madow, W.G. (1944), On the theory of systematic sampling. \emph{Annals of Mathematical Statistics}. 15, 1-24.\cr
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling. Springer}.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# The population of size N=5 is divided in a=2 groups
# Draws a Systematic sample. 
sam <- S.SY(5,2)
sam
# The selected sample is
U[sam]
# There are only two possible samples

############
## Example 2
############
# Uses the Lucy data to draw a Systematic sample
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
# The population is divided in 6 groups
# The selected sample
sam <- S.SY(N,6)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
}
\keyword{survey}
