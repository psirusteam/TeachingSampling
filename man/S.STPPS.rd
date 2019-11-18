\name{S.STPPS}
\alias{S.STPPS}
\title{Stratified Sampling Applying PPS Design in all Strata}
\description{Draws a probability proportional to size simple random sample with 
replacement of size \eqn{m_h} in stratum \eqn{h} of size \eqn{N_h}}
\usage{
S.STPPS(S,x,mh)
}
\arguments{
\item{S}{Vector identifying the membership to the strata of each unit in the population}
\item{x}{Vector of auxiliary information for each unit in the population}    
\item{mh}{Vector of sample size in each stratum}
}
\seealso{
\code{\link{E.STPPS}}
}
\details{The selected sample is drawn according to the cumulative total method (sequential-list procedure) in each stratum}
\value{The function returns a matrix of \eqn{m=m_1+\cdots+m_h} rows and two columns. Each element of the first column indicates the unit that
was selected. Each element of the second column indicates the selection probability of this unit}   
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
# according to a PPS design in each stratum

data(Lucy)
attach(Lucy)
# Level is the stratifying variable
summary(Level)
# Defines the sample size at each stratum
m1<-70
m2<-100
m3<-200
mh<-c(m1,m2,m3)
# Draws a stratified sample
res<-S.STPPS(Level, Income, mh)
# The selected sample
sam<-res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
# The selection probability of each unit selected in the sample
pk <- res[,2]
pk
}
\keyword{survey}
