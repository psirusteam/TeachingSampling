\name{S.STpiPS}
\alias{S.STpiPS}
\title{Stratified Sampling Applying Without Replacement piPS Design in all Strata}
\description{Draws a probability proportional to size simple random sample without 
replacement of size \eqn{n_h} in stratum \eqn{h} of size \eqn{N_h}}
\usage{
S.STpiPS(S,x,nh)
}
\arguments{
\item{S}{Vector identifying the membership to the strata of each unit in the population}
\item{x}{Vector of auxiliary information for each unit in the population}    
\item{nh}{Vector of sample size in each stratum}
}
\seealso{
\code{\link{E.STpiPS}}
}
\details{The selected sample is drawn according to the Sunter method (sequential-list procedure) in each stratum}
\value{The function returns a matrix of \eqn{n=n_1+\cdots+n_h} rows and two columns. Each element of the first column indicates the unit that
was selected. Each element of the second column indicates the inclusion probability of this unit}   
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
# The auxiliary information
x <- c(52, 60, 75, 100, 50)
# Vector Strata contains an indicator variable of stratum membership 
Strata <- c("A", "A", "A", "B", "B")
# Then sample size in each stratum
mh <- c(2,2)
# Draws a stratified PPS sample with replacement of size n=4
res <- S.STPPS(Strata, x, mh)
# The selected sample
sam <- res[,1]
U[sam]
# The selection probability of each unit selected to be in the sample
pk <- res[,2]
pk

############
## Example 2
############
# Uses the Lucy data to draw a stratified random sample 
# according to a piPS design in each stratum

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
n1<-70
n2<-100
n3<-200
nh<-c(n1,n2,n3)
nh
# Draws a stratified sample
S <- Level
x <- Employees

res <- S.STpiPS(S, x, nh)
sam<-res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
# The selection probability of each unit selected in the sample
pik <- res[,2]
pik
}
\keyword{survey}
