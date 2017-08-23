\name{Domains}
\alias{Domains}
\title{Domains Indicator Matrix}
\description{Creates a matrix of domain indicator variables for every single unit in the selected sample or in the entire population}
\usage{
Domains(y)
}
\arguments{
\item{y}{Vector of the domain of interest containing the membership of each unit to a specified category of the domain}
}
\seealso{
\code{\link{E.SI}}
}
\details{Each value of y represents the domain which a specified unit belongs}
\value{The function returns a \eqn{n\times p} matrix, where \eqn{n} is the number of units in the selected 
sample and \eqn{p} is the number of categories of the domain of interest. The values of this matrix are zero,  if the unit does not 
belongs to a specified category and one, otherwise.}
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
# This domain contains only two categories: "yes" and "no"
x <- as.factor(c("yes","yes","yes","no","no","no","no","yes","yes"))
Domains(x)

############
## Example 2
############
# Uses the Lucy data to draw a random sample of units according 
# to a SI design
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
n <- 400
sam <- sample(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variable SPAM is a domain of interest
Doma <- Domains(SPAM)
Doma
# HT estimation of the absolute domain size for every category in the domain
# of interest
E.SI(N,n,Doma)

############
## Example 3
############
# Following with Example 2... 
# The variables of interest are: Income, Employees and Taxes
# This function allows to estimate the population total of this variables for every 
# category in the domain of interest SPAM 
estima <- data.frame(Income, Employees, Taxes)
SPAM.no <- estima*Doma[,1]
SPAM.yes <- estima*Doma[,2]
E.SI(N,n,SPAM.no)
E.SI(N,n,SPAM.yes)
}
\keyword{survey}
