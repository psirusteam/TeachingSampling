\name{E.Beta}
\alias{E.Beta}
\title{Estimation of the population regression coefficients under SI designs}
\description{Computes the estimation of regression coefficients using the principles of the Horvitz-Thompson estimator}
\usage{
E.Beta(N, n, y, x, ck=1, b0=FALSE)
}
\arguments{
\item{N}{The population size}
\item{n}{The sample size}
\item{y}{Vector, matrix or data frame containing the recollected information of the variables of interest for every unit in the selected sample}
\item{x}{Vector, matrix or data frame containing the recollected auxiliary information for every unit in the selected sample}
\item{ck}{By default equals to one. It is a vector of weights induced by the structure of variance of the supposed model}
\item{b0}{By default FALSE. The intercept of the regression model}
}
\seealso{
\code{\link{GREG.SI}}
}
\details{Returns the estimation of the population regression coefficients in a supposed linear model, its estimated variance and its estimated coefficient of variation under an SI sampling design}
\value{The function returns a vector whose entries correspond to the estimated parameters of the regression coefficients}
\author{Hugo Andres Gutierrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
######################################################################
## Example 1: Linear models involving continuous auxiliary information
######################################################################

# Draws a simple random sample without replacement
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
n <- 400
sam <- S.SI(N, n)
# The information about the units in the sample 
# is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)

########### common mean model 

estima<-data.frame(Income, Employees, Taxes)
x <- rep(1,n)
E.Beta(N, n, estima,x,ck=1,b0=FALSE)


########### common ratio model 

estima<-data.frame(Income)
x <- data.frame(Employees)
E.Beta(N, n, estima,x,ck=x,b0=FALSE)

########### Simple regression model without intercept

estima<-data.frame(Income, Employees)
x <- data.frame(Taxes)
E.Beta(N, n, estima,x,ck=1,b0=FALSE)

########### Multiple regression model without intercept

estima<-data.frame(Income)
x <- data.frame(Employees, Taxes)
E.Beta(N, n, estima,x,ck=1,b0=FALSE)

########### Simple regression model with intercept

estima<-data.frame(Income, Employees)
x <- data.frame(Taxes)
E.Beta(N, n, estima,x,ck=1,b0=TRUE)

########### Multiple regression model with intercept

estima<-data.frame(Income)
x <- data.frame(Employees, Taxes)
E.Beta(N, n, estima,x,ck=1,b0=TRUE)

###############################################################
## Example 2: Linear models with discrete auxiliary information
###############################################################

# Draws a simple random sample without replacement
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the sample units is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The auxiliary information
Doma<-Domains(Level)

########### Poststratified common mean model

estima<-data.frame(Income, Employees, Taxes)
E.Beta(N, n, estima,Doma,ck=1,b0=FALSE)

########### Poststratified common ratio model

estima<-data.frame(Income, Employees)
x<-Doma*Taxes
E.Beta(N, n, estima,x,ck=1,b0=FALSE)
}
\keyword{survey}