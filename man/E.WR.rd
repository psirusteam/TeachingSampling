\name{E.WR}
\alias{E.WR}
\title{Estimation of the Population Total under Simple Random Sampling With Replacement}
\description{Computes the Hansen-Hurwitz estimator of the population total according to a simple random
sampling with replacement design}
\usage{
E.WR(N, m, y)
}
\arguments{
\item{N}{Population size}
\item{m}{Sample size}
\item{y}{Vector, matrix or data frame containing the recollected information of the variables of interest for every
unit in the selected sample}
}
\seealso{
\code{\link{S.WR}}
}
\details{Returns the estimation of the population total of every single variable of interest, its estimated variance and its
estimated coefficient of variation estimated under an simple random with replacement design}
\value{The function returns a data matrix whose columns correspond to the estimated parameters of the variables of interest}
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
# Uses the Lucy data to draw a random sample according to a WR design
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
m <- 400
sam <- S.WR(N,m)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.WR(N,m,estima)
}
\keyword{survey}