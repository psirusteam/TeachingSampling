\name{E.BE}
\alias{E.BE}
\title{Estimation of the Population Total under Bernoulli Sampling Without Replacement}
\description{Computes the Horvitz-Thompson estimator of the population total according to a BE sampling design}
\usage{
E.BE(y, prob)
}
\arguments{
\item{y}{Vector, matrix or data frame containing the recollected information of the variables of interest for every unit in the selected sample}
\item{prob}{Inclusion probability for each unit in the population}
}
\seealso{
\code{\link{S.BE}}
}
\details{Returns the estimation of the population total of every single variable of interest, its estimated standard error and its estimated coefficient of variation under an BE sampling design}
\value{The function returns a data matrix whose columns correspond to the estimated parameters of the variables of interest}
\author{Hugo Andres Gutierrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
# Uses the Lucy data to draw a Bernoulli sample
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
n=400
prob=n/N
sam <- S.BE(N,prob)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.BE(estima,prob)
}
\keyword{survey}