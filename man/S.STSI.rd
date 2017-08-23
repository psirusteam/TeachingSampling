\name{S.STSI}
\alias{S.STSI}
\title{Stratified sampling applying SI design in all strata}
\description{Draws a simple random sample without replacement of size \eqn{n_h} in stratum \eqn{h} of size \eqn{N_h}}
\usage{
S.STSI(S, Nh, nh)
}
\arguments{
\item{S}{Vector identifying the membership to the strata of each unit in the population}
\item{Nh}{Vector of stratum sizes}      
\item{nh}{Vector of sample size in each stratum}
}
\seealso{
\code{\link{E.STSI}}
}
\details{The selected sample is drawn according to a selection-rejection (list-sequential) algorithm in each stratum}
\value{The function returns a vector of size \eqn{n=n_1+\cdots+n_H}. Each element of this vector indicates the unit that was selected.}   
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
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector Strata contains an indicator variable of stratum membership 
Strata <- c("A", "A", "A", "B", "B")
Strata
# The stratum sizes
Nh <- c(3,2)
# Then sample size in each stratum
nh <- c(2,1)
# Draws a stratified simple random sample without replacement of size n=3
sam <- S.STSI(Strata, Nh, nh)
sam
# The selected sample is
U[sam]

############
## Example 2
############
# Uses the Lucy data to draw a stratified random sample
#  accordind to a SI design in each stratum
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
n1<-70
n2<-100
n3<-200
nh<-c(n1,n2,n3)
# Draws a stratified sample
sam <- S.STSI(Level, Nh, nh)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
}
\keyword{survey}
