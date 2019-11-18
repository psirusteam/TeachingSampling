\name{E.PO}
\alias{E.PO}
\title{Estimation of the Population Total under Poisson Sampling Without Replacement}
\description{Computes the Horvitz-Thompson estimator of the population total according to a PO sampling design}
\usage{
E.PO(y, Pik)
}
\arguments{
\item{y}{Vector, matrix or data frame containing the recollected information of the variables of interest for every unit in the selected sample}
\item{Pik}{Vector of inclusion probabilities for each unit in the selected sample}
}
\seealso{
\code{\link{S.PO}}
}
\details{Returns the estimation of the population total of every single variable of interest, its estimated standard error and its estimated coefficient of variation under a PO sampling design}
\value{The function returns a data matrix whose columns correspond to the estimated parameters of the variables of interest}
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
# Uses the Lucy data to draw a Poisson sample
data(Lucy)
attach(Lucy)
N <- dim(Lucy)[1]
# The population size is 2396. The expected sample size is 400
# The inclusion probability is proportional to the variable Income
n <- 400
Pik<-n*Income/sum(Income)
# The selected sample
sam <- S.PO(N,Pik)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The inclusion probabilities of each unit in the selected smaple
inclusion <- Pik[sam]
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.PO(estima,inclusion)
}
\keyword{survey}