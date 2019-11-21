\name{BigLucy}
\docType{data}
\alias{BigLucy}
\title{Full Business Population Database}
\description{
This data set corresponds to some financial variables of 85396 industrial companies of a city in a particular fiscal year.
}
\seealso{
\code{\link{Lucy}, \link{BigCity}}
}
\usage{data(BigLucy)}
\format{
  \describe{
\item{ID}{The identifier of the company. It correspond to an alphanumeric sequence (two letters and three digits)}
\item{Ubication}{The address of the principal office of the company in the city}
\item{Level}{The industrial companies are discrimitnated according to the Taxes declared. 
There are small, medium and big companies}
\item{Zone}{The country is divided by counties. A company belongs to a particular zone according to its cartographic location.}
\item{Income}{The total ammount of a company's earnings (or profit) in the previuos fiscal year. It is calculated by taking 
revenues and adjusting for the cost of doing business}
\item{Employees}{The total number of persons working for the company in the previuos fiscal year}
\item{Taxes}{The total ammount of a company's income Tax}
\item{SPAM}{Indicates if the company uses the Internet and WEBmail options in order to make self-propaganda.}
\item{ISO}{Indicates if the company is certified by the International Organization for Standardization.}
\item{Years}{The age of the company.}
\item{Segments}{Cartographic segments by county. A segment comprises in average 10 companies located close to each other.}
}
}
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}}
\references{
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}

\examples{
data(BigLucy)
attach(BigLucy)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
# The population totals
colSums(estima)
# Some parameters of interest
table(SPAM,Level)
xtabs(Income ~ Level+SPAM)
# Correlations among characteristics of interest
cor(estima)
# Some useful histograms
hist(Income)
hist(Taxes)
hist(Employees)
# Some useful plots
boxplot(Income ~ Level)
barplot(table(Level))
pie(table(SPAM))
}
\keyword{datasets}
