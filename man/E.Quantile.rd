\name{E.Quantile}
\alias{E.Quantile}
\title{Estimation of a Population quantile}
\description{Computes the estimation of a population quantile using the principles of the Horvitz-Thompson estimator}
\usage{
E.Quantile(y, Qn, Pik)
}
\arguments{
\item{y}{Vector, matrix or data frame containing the recollected information of the variables of interest for every
unit in the selected sample}
\item{Qn}{Quantile of interest}
\item{Pik}{A vector containing inclusion probabilities for each unit in the sample. 
If missing, the function will assign the same weights to each unit in the sample}
}
\seealso{
\code{\link{HT}}
}
\details{Returns the estimation of the population quantile of every single variable of interest}
\value{The function returns a vector whose entries correspond to the estimated quantiles of the variables of interest}
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
# Vectors y and x give the values of the variables of interest
y<-c(32, 34, 46, 89, 35)
x<-c(52, 60, 75, 100, 50)
z<-cbind(y,x)
# Inclusion probabilities for a design of size n=2
Pik<-c(0.58, 0.34, 0.48, 0.33, 0.27)
# Estimation of the sample median
E.Quantile(y, 0.5)
# Estimation of the sample Q1
E.Quantile(x, 0.25)
# Estimation of the sample Q3
E.Quantile(z, 0.75)
# Estimation of the sample median
E.Quantile(z, 0.5, Pik)

############
## Example 2
############
# Uses the Lucy data to draw a PPS sample with replacement

data(Lucy)
attach(Lucy)

# The selection probability of each unit is proportional to the variable Income
# The sample size is m=400
m=400
res <- S.PPS(m,Income)
# The selected sample
sam <- res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
# The vector of selection probabilities of units in the sample
pk.s <- res[,2]
# The vector of inclusion probabilities of units in the sample
Pik.s<-1-(1-pk.s)^m
# The information about the sample units is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
# Estimation of sample median
E.Quantile(estima,0.5,Pik.s)
}
\keyword{survey}