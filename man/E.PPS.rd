\name{E.PPS}
\alias{E.PPS}
\title{Estimation of the Population Total under Probability Proportional to Size Sampling With Replacement}
\description{Computes the Hansen-Hurwitz estimator of the population total according to a probability proportional to size sampling with replacement design}
\usage{
E.PPS(y, pk)
}
\arguments{
\item{y}{Vector, matrix or data frame containing the recollected information of the variables of interest for every unit in the selected sample}
\item{pk}{A vector containing selection probabilities for each unit in the sample}
}
\seealso{
\code{\link{S.PPS}, \link{HH}}
}
\details{Returns the estimation of the population total of every single variable of interest, its estimated standard error and its estimated coefficient of variation estimated under a probability proportional to size sampling with replacement design}
\value{The function returns a data matrix whose columns correspond to the estimated parameters of the variables of interest}
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
# Uses the Lucy data to draw a random sample according to a
# PPS with replacement design
data(Lucy)
attach(Lucy)
# The selection probability of each unit is proportional to the variable Income
m <- 400
res <- S.PPS(m,Income)
# The selected sample
sam <- res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# pk.s is the selection probability of each unit in the selected sample
pk.s <- res[,2]
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.PPS(estima,pk.s)
}
\keyword{survey}