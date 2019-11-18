\name{E.STpiPS}
\alias{E.STpiPS}
\title{Estimation of the Population Total under Stratified Probability Proportional to Size Sampling Without Replacement}
\description{Computes the Horvitz-Thompson estimator of the population total according to a probability proportional to size
sampling without replacement design in each stratum}
\usage{
E.STpiPS(y, pik, S)
}
\arguments{
\item{y}{Vector, matrix or data frame containing the recollected information of the variables of interest for every
unit in the selected sample}
\item{pik}{A vector containing inclusion probabilities for each unit in the sample}
\item{S}{Vector identifying the membership to the strata of each unit in selected sample}
}
\seealso{
\code{\link{S.STpiPS}}
}
\details{Returns the estimation of the population total of every single variable of interest, its estimated standard error, its estimated coefficient of variation and its corresponding DEFF in all of the strata and finally in the entire population}
\value{The function returns an array composed by several  matrices representing each variable of interest. The columns of each matrix
correspond to the estimated parameters of the variables of interest in each stratum and in the entire population}
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
# Uses the Lucy data to draw a stratified random sample 
# according to a PPS design in each stratum

data(Lucy)
attach(Lucy)
# Level is the stratifying variable
summary(Level)

# Defines the size of each stratum
N1<-summary(Level)[[1]]
N2<-summary(Level)[[2]]
N3<-summary(Level)[[3]]
N1;N2;N3

# Defines the sample size at each stratum
n1<-N1
n2<-100
n3<-200
nh<-c(n1,n2,n3)
nh
# Draws a stratified sample
S <- Level
x <- Employees

res <- S.STpiPS(S, x, nh)
sam <- res[,1]
pik <- res[,2]

data <- Lucy[sam,]
attach(data)

estima <- data.frame(Income, Employees, Taxes)
E.STpiPS(estima,pik,Level)
}
\keyword{survey}