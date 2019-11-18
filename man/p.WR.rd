\name{p.WR}
\alias{p.WR}
\title{Generalization of every with replacement sampling design}
\description{Computes the selection probability (sampling design) of each with replacement sample}
\usage{
p.WR(N, m, pk)
}
\arguments{
\item{N}{Population size}
\item{m}{Sample size}
\item{pk}{A vector containing selection probabilities for each unit in the population}
}
\details{Every with replacement sampling design is a particular case of a multinomial 
distribution. 
\deqn{p(\mathbf{S}=\mathbf{s})=\frac{m!}{n_1!n_2!\cdots n_N!}\prod_{i=1}^N p_k^{n_k}}
where \eqn{n_k} is the number of times that the \eqn{k}-th unit is selected in a sample.
}
\value{The function returns a vector of selection probabilities for every with-replacement sample.}
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
# With replacement simple random sampling
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector pk is the sel?ection probability of the units in the finite population
pk <- c(0.2, 0.2, 0.2, 0.2, 0.2)
sum(pk)
N <- length(pk)
m <- 3
# The smapling design
p <- p.WR(N, m, pk)
p
sum(p)

############
## Example 2
############
# With replacement PPS random sampling
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector x is the auxiliary information and y is the variables of interest
x<-c(32, 34, 46, 89, 35)
y<-c(52, 60, 75, 100, 50)
# Vector pk is the sel?ection probability of the units in the finite population
pk <- x/sum(x)
sum(pk)
N <- length(pk)
m <- 3
# The smapling design
p <- p.WR(N, m, pk)
p
sum(p)
}
\keyword{survey}