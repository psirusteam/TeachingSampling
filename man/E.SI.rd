\name{E.SI}
\alias{E.SI}
\title{Estimation of the Population Total under Simple Random Sampling Without Replacement}
\description{Computes the Horvitz-Thompson estimator of the population total according to an SI sampling design}
\usage{
E.SI(N, n, y)
}
\arguments{
\item{N}{Population size}
\item{n}{Sample size}
\item{y}{Vector, matrix or data frame containing the recollected information of the variables of interest for every
unit in the selected sample}
}
\seealso{
\code{\link{S.SI}}
}
\details{Returns the estimation of the population total of every single variable of interest, its estimated standard error and its
estimated coefficient of variation under an SI sampling design}
\value{The function returns a data matrix whose columns correspond to the estimated parameters of the variables of interest}
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
# Uses the Lucy data to draw a random sample of units according to a SI design
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.SI(N,n,estima)

############
## Example 2
############
# Following with Example 1. The variable SPAM is a domain of interest
Doma <- Domains(SPAM)
# This function allows to estimate the size of each domain in SPAM
estima <- data.frame(Doma)
E.SI(N,n,Doma)

############
## Example 3
############
# Following with Example 1. The variable SPAM is a domain of interest
Doma <- Domains(SPAM)
# This function allows to estimate the parameters of the variables of interest 
# for every category in the domain SPAM
estima <- data.frame(Income, Employees, Taxes)
SPAM.no <-  cbind(Doma[,1], estima*Doma[,1])
SPAM.yes <- cbind(Doma[,1], estima*Doma[,2])
# Before running the following lines, notice that:
# The first column always indicates the population size
# The second column is an estimate of the size of the category in the domain SPAM
# The remaining columns estimates the parameters of interest 
# within the corresponding category in the domain SPAM
E.SI(N,n,SPAM.no)
E.SI(N,n,SPAM.yes)

############
## Example 4
############
# Following with Example 1. The variable SPAM is a domain of interest 
# and the variable ISO is a populational subgroup of interest
Doma <- Domains(SPAM)
estima <- Domains(Zone)
# Before running the following lines, notice that:
# The first column indicates wheter the unit 
# belongs to the first category of SPAM or not
# The remaining columns indicates wheter the unit 
# belogns to the categories of Zone
SPAM.no <-  data.frame(SpamNO=Doma[,1], Zones=estima*Doma[,1])
# Before running the following lines, notice that:
# The first column indicates wheter the unit 
# belongs to the second category of SPAM or not
# The remaining columns indicates wheter the unit 
# belogns to the categories of Zone
SPAM.yes <- data.frame(SpamYES=Doma[,2], Zones=estima*Doma[,2])
# Before running the following lines, notice that:
# The first column always indicates the population size
# The second column is an estimate of the size of the 
# first category in the domain SPAM
# The remaining columns estimates the size of the categories 
# of Zone within the corresponding category of SPAM
# Finnaly, note that the sum of the point estimates of the last 
# two columns gives exactly the point estimate in the second column
E.SI(N,n,SPAM.no)
# Before running the following lines, notice that:
# The first column always indicates the population size
# The second column is an estimate of the size of the 
# second category in the domain SPAM
# The remaining columns estimates the size of the categories 
# of Zone within the corresponding category of SPAM
# Finnaly, note that the sum of the point estimates of the last two 
# columns gives exactly the point estimate in the second column
E.SI(N,n,SPAM.yes)

}
\keyword{survey}