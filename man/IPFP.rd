\name{IPFP}
\alias{IPFP}
\title{Iterative Proportional Fitting Procedure}
\description{Adjustment of a table on the margins}
\usage{
IPFP(Table, Col.knw, Row.knw, tol=0.0001)
}
\arguments{
\item{Table}{A contingency table}
\item{Col.knw}{A vector containing the true totals of the columns}
\item{Row.knw}{A vector containing the true totals of the Rows}
\item{tol}{The control value, by default equal to 0.0001}
}
\details{Adjust a contingency table on the know margins of the population with the Raking Ratio method}
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}}
\references{
Deming, W. & Stephan, F. (1940), On a least squares adjustment of a sampled frequency 
table when the expected marginal totals are known. \emph{Annals of Mathematical Statistics}, 11, 427-444.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}
\examples{
############
## Example 1
############
# Some example of Ardilly and Tille 
Table <- matrix(c(80,90,10,170,80,80,150,210,130),3,3)
rownames(Table) <- c("a1", "a2","a3")
colnames(Table) <- c("b1", "b2","b3")
# The table with labels
Table
# The known and true margins
Col.knw <- c(150,300,550)
Row.knw <- c(430,360,210)
# The adjusted table
IPFP(Table,Col.knw,Row.knw,tol=0.0001)

############
## Example 2
############
# Draws a simple random sample
data(Lucy)
attach(Lucy)

N<-dim(Lucy)[1]
n<-400
sam<-sample(N,n)
data<-Lucy[sam,]
attach(data)
dim(data)
# Two domains of interest
Doma1<-Domains(Level)
Doma2<-Domains(SPAM)
# Cross tabulate of domains
SPAM.no<-Doma2[,1]*Doma1
SPAM.yes<-Doma2[,2]*Doma1
# Estimation
E.SI(N,n,Doma1)
E.SI(N,n,Doma2)
est1 <-E.SI(N,n,SPAM.no)[,2:4]
est2 <-E.SI(N,n,SPAM.yes)[,2:4]
est1;est2
# The contingency table estimated from above
Table <- cbind(est1[1,],est2[1,])
rownames(Table) <- c("Big", "Medium","Small")
colnames(Table) <- c("SPAM.no", "SPAM.yes")
# The known and true margins
Col.knw <- colSums(Domains(Lucy$SPAM))
Row.knw<- colSums(Domains(Lucy$Level))
# The adjusted table
IPFP(Table,Col.knw,Row.knw,tol=0.0001)
}
\keyword{survey}