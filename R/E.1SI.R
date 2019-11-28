#' @importFrom magrittr %>%
#' @importFrom dplyr group_by
#' @importFrom dplyr summarise
#' @export
#' 
#' @title
#' Estimation of the Population Total under Single Stage Simple Random Sampling Without Replacement
#' @description 
#' This function computes the Horvitz-Thompson estimator of the population total according to a single stage sampling design.
#' @return 
#' This function returns the estimation of the population total of 
#' every single variable of interest, its estimated standard error 
#' and its estimated coefficient of variation.
#' @details
#' The function returns a data matrix whose columns correspond to 
#' the estimated parameters of the variables of interest.
#' @author Hugo Andres Gutierrez Rojas <hugogutierrez at gmail.com>
#' @param NI Population size of Primary Sampling Units.
#' @param nI Sample size of Primary Sampling Units.
#' @param y Vector, matrix or data frame containig the recollected 
#' information of the variables of interest for every unit in the 
#' selected sample.
#' @param PSU Vector identifying the membership to the strata of 
#' each unit in the population.
#' 
#' @references 
#' Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
#' Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}. Editorial Universidad Santo Tomas
#' 
#' @seealso \code{\link{E.2SI}}
#' 
#' @examples
#' 
#' data('BigCity')
#' Households <- BigCity %>% group_by(HHID) %>%
#' summarise(Stratum = unique(Stratum),
#'             PSU = unique(PSU),
#'             Persons = n(),
#'             Income = sum(Income),
#'             Expenditure = sum(Expenditure))
#'             
#' attach(Households)
#' UI <- levels(as.factor(Households$PSU))
#' NI <- length(UI)
#' nI <- 100 
#' 
#' samI <- S.SI(NI, nI)
#' sampleI <- UI[samI]
#' 
#' CityI <- Households[which(Households$PSU %in% sampleI), ]
#' attach(CityI)
#' area <- as.factor(CityI$PSU)
#' estima <- data.frame(CityI$Persons, CityI$Income, CityI$Expenditure)
#' 
#' E.1SI(NI, nI, estima, area)

E.1SI <- function(NI, nI, y, PSU) {
  y <- cbind(1, y)
  y <- as.data.frame(y)
  names(y)[1] <- "N"
  PSU <- as.factor(PSU)
  
  Total <- matrix(NA, nrow = 4, ncol = dim(y)[2])
  rownames(Total) = c("Estimation", "Standard Error", "CVE", 
    "DEFF")
  colnames(Total) <- names(y)
  
  fI <- nI/NI
  
  for (k in 1:dim(y)[2]) {
    ti <- tapply(y[, k], PSU, sum)
    ty <- (1/fI) * sum(ti)
    Vty <- NI^2/nI * (1 - fI) * var(ti)
    CVe <- 100 * sqrt(Vty)/ty
    n <- length(y[, k])
    N <- (NI/nI) * dim(y)[1]
    VMAS <- (N^2) * (1 - (n/N)) * var(y[, k])/(n)
    DEFF <- Vty/VMAS
    Total[, k] <- c(ty, sqrt(Vty), CVe, DEFF)
  }
  return(Total)
}


