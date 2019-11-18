\name{E.STSI}
\alias{E.STSI}
\title{Estimation of the Population Total under Stratified Simple Random Sampling Without Replacement}
\description{Computes the Horvitz-Thompson estimator of the population total according to a STSI sampling design}
\usage{
E.STSI(S, Nh, nh, y)
}
\arguments{
\item{S}{Vector identifying the membership to the strata of each unit in the population}
\item{Nh}{Vector of stratum sizes}      
\item{nh}{Vector of sample sizes in each stratum}
\item{y}{Vector, matrix or data frame containing the recollected information of the variables of interest for every
unit in the selected sample}
}
\seealso{
\code{\link{S.STSI}}
}
\details{Returns the estimation of the population total of every single variable of interest, its estimated standard error and its estimated coefficient of variation in all of the strata and finally in the entire population}
\value{The function returns an array composed by several  matrices representing each variable of interest. The columns of each matrix
correspond to the estimated parameters of the variables of interest in each stratum and in the entire population}
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
# Uses the Lucy data to draw a stratified random sample 
# according to a SI design in each stratum

data(Lucy)
attach(Lucy)
# Level is the stratifying variable
summary(Level)
# Defines the size of each stratum
N1<-summary(Level)[[1]]
N2<-summary(Level)[[2]]
N3<-summary(Level)[[3]]
N1;N2;N3
Nh <- c(N1,N2,N3)
# Defines the sample size at each stratum
n1<-N1
n2<-100
n3<-200
nh<-c(n1,n2,n3)
# Draws a stratified sample
sam <- S.STSI(Level, Nh, nh)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.STSI(Level,Nh,nh,estima)

############
## Example 2
############
# Following with Example 1. The variable SPAM is a domain of interest
Doma <- Domains(SPAM)
# This function allows to estimate the parameters of the variables of interest
# for every category in the domain SPAM
SPAM.no <- estima*Doma[,1]
SPAM.yes <- estima*Doma[,2]
E.STSI(Level, Nh, nh, Doma)
E.STSI(Level, Nh, nh, SPAM.no)
E.STSI(Level, Nh, nh, SPAM.yes)
}
\keyword{survey}