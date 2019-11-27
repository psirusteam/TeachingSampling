\name{BigCity}
\docType{data}
\alias{BigCity}
\title{Full Person-level Population Database}
\description{
This data set corresponds to some socioeconomic variables from 150266 people of a city in a particular year.
}
\seealso{
\code{\link{Lucy}, \link{BigLucy}}
}
\usage{data(BigCity)}
\format{
  \describe{
\item{HHID}{The identifier of the household. It corresponds to an alphanumeric sequence (four letters and five digits).}
\item{PersonID}{The identifier of the person within the household. NOTE it is not a unique identifier of a person for the whole population. It corresponds to an alphanumeric sequence (five letters and two digits).}
\item{Stratum}{Households are located in geographic strata. There are 119 strata across the city.}
\item{PSU}{Households are clustered in cartographic segments defined as primary sampling units (PSU). There are 1664 PSU and they are nested within strata.}
\item{Zone}{Segments clustered within strata can be located within urban or rural areas along the city.}
\item{Sex}{Sex of the person.}
\item{Income}{Per capita monthly income.}
\item{Expenditure}{Per capita monthly expenditure.}
\item{Employment}{A person's employment status.}
\item{Poverty}{This variable indicates whether the person is poor or not. It depends on income.}
}
}
\author{Hugo Andres Gutierrez Rojas \email{hagutierrezro@gmail.com}}
\references{
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}.
Editorial Universidad Santo Tomas.
}

\examples{
data(BigCity)
attach(BigCity)

estima <- data.frame(Income, Expenditure)
# The population totals
colSums(estima)
# Some parameters of interest
table(Poverty, Zone)
xtabs(Income ~ Poverty + Zone)
# Correlations among characteristics of interest
cor(estima)
# Some useful histograms
hist(Income)
hist(Expenditure)
# Some useful plots
boxplot(Income ~ Poverty)
barplot(table(Employment))
pie(table(MaritalST))
}
\keyword{datasets}
