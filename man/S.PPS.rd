\name{S.PPS}
\alias{S.PPS}
\title{Probability Proportional to Size Sampling With Replacement}
\description{Draws a probability proportional to size sample with replacement of size \eqn{m} from a population of size \eqn{N}}
\usage{
S.PPS(m,x)
}
\arguments{
\item{m}{Sample size}
\item{x}{Vector of auxiliary information for each unit in the population}
}
\seealso{
\code{\link{E.PPS}}
}
\details{The selected sample is drawn according to the cumulative total method (sequential-list procedure)}
\value{The function returns a matrix of \eqn{m} rows and two columns. Each element of the first column indicates the unit that
was selected. Each element of the second column indicates the selection probability of this unit} 
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}}
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
# Draws a PPS sample with replacement of size m=3
res <- S.PPS(3,x)
sam <- res[,1]
# The selected sample is
U[sam]

############
## Example 2
############
# Uses the Lucy data to draw a random sample according to a 
# PPS with replacement design
data(Lucy)
attach(Lucy)
# The selection probability of each unit is proportional to the variable Income
m <- 400
res<-S.PPS(400,Income)
# The selected sample
sam <- res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
}
\keyword{survey}
