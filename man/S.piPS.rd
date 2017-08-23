\name{S.piPS}
\alias{S.piPS}
\title{Probability Proportional to Size Sampling Without Replacement}
\description{Draws a probability proportional to size sample without replacement of size \eqn{n} from a population of size \eqn{N}.}
\usage{
S.piPS(n, x, e)
}
\arguments{
\item{x}{Vector of auxiliary information for each unit in the population}
\item{n}{Sample size}
\item{e}{By default, a vector of size \eqn{N} of independent random numbers drawn from the \eqn{Uniform(0,1)}}
}
\seealso{
\code{\link{E.piPS}}
}
\details{The selected sample is drawn according to the Sunter method (sequential-list procedure)}
\value{The function returns a matrix of \eqn{m} rows and two columns. Each element of the first column indicates the unit that
was selected. Each element of the second column indicates the selection probability of this unit} 
\author{Hugo Andres Gutierrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# The auxiliary information
x <- c(52, 60, 75, 100, 50)
# Draws a piPS sample without replacement of size n=3
res <- S.piPS(3,x)
res
sam <- res[,1] 
sam
# The selected sample is
U[sam]

############
## Example 2
############
# Uses the Lucy data to draw a random sample of units accordind to a
# piPS without replacement design

data(Lucy)
attach(Lucy)
# The selection probability of each unit is proportional to the variable Income
res <- S.piPS(400,Income)
# The selected sample
sam <- res[,1]
# The inclusion probabilities of the units in the sample
Pik.s <- res[,2]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
}
\keyword{survey}
