\name{S.SI}
\alias{S.SI}
\title{Simple Random Sampling Without Replacement}
\description{Draws a simple random sample without replacement of size \eqn{n} from a population of size \eqn{N}}
\usage{
S.SI(N, n, e=runif(N))
}
\arguments{
\item{N}{Population size}
\item{n}{Sample size}      
\item{e}{By default, a vector of size \eqn{N} of independent random numbers drawn from the \eqn{Uniform(0,1)}}
}
\seealso{
\code{\link{E.SI}}
}
\details{The selected sample is drawn according to a selection-rejection (list-sequential) algorithm}
\value{The function returns a vector of size \eqn{N}. Each element of this vector indicates if the unit was selected. Then, 
if the value of this vector for unit \eqn{k} is zero, the unit \eqn{k} was not selected in the sample; otherwise, the unit was
selected in the sample.}   
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}}
\references{      
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Fan, C.T., Muller, M.E., Rezucha, I. (1962), Development of sampling plans by using sequential
(item by item) selection techniques and digital computer, \emph{Journal of the American Statistical Association}, 57, 387-402.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Fixes the random numbers in order to select a sample
# Ideal for teaching purposes in the blackboard
e <- c(0.4938, 0.7044, 0.4585, 0.6747, 0.0640)
# Draws a simple random sample without replacement of size n=3
sam <- S.SI(5,3,e)
sam
# The selected sample is
U[sam]

############
## Example 2
############
# Uses the Marco and Lucy data to draw a random sample according to a SI design
data(Marco)
data(Lucy)

N <- dim(Lucy)[1]
n <- 400
sam<-S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
}
\keyword{survey}
