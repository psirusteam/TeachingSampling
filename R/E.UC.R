#' @importFrom magrittr %>%
#' @importFrom dplyr group_by
#' @importFrom dplyr summarise
#' @importFrom dplyr left_join
#' @export
#' 
#' @title
#' Estimation of the Population Total and its variance using the Ultimate Cluster technique
#' @description 
#' This function computes a weighted estimator of the population total and
#' estimates its variance by using the Ultimate Cluster technique. This approximation
#' performs well in many sampling designs. The user specifically needs to
#' declare the variables of interest, the primary sampling units, the strata, and 
#' the sampling weights for every singlt unit in the sample. 
#' @return 
#' This function returns the estimation of the population total of 
#' every single variable of interest, its estimated standard error 
#' and its estimated coefficient of variation.
#' @details
#' The function returns a data matrix whose columns correspond to 
#' the estimated parameters of the variables of interest.
#' @author Hsugo Andres Gutierrez Rojas <hugogutierrez at gmail.com>
#' @param S Vector identifying the membership to the strata of each unit in selected sample.
#' @param PSU Vector identifying the membership to the strata of 
#' each unit in the population.
#' @param dk Sampling weights of the units in the sample.
#' @param y Vector, matrix or data frame containig the recollected 
#' information of the variables of interest for every unit in the 
#' selected sample.
#' 
#' @references 
#' Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
#' Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}. Editorial Universidad Santo Tomas
#' 
#' @seealso \code{\link{E.2SI}}
#' 
#' @examples
#' 
#' #############################
#' ## Example 1:              ##
#' ## Stratified Two-stage SI ##
#' #############################
#' 
#' data('BigCity')
#' FrameI <- BigCity %>% group_by(PSU) %>%
#' summarise(Stratum = unique(Stratum),
#'           Persons = n(),
#'           Income = sum(Income),
#'           Expenditure = sum(Expenditure))
#'             
#' attach(FrameI)
#' 
#' sizes = FrameI %>% group_by(Stratum) %>%
#'         summarise(NIh = n(),
#'         nIh = 2,
#'         dI = NIh/nIh)
#'         
#' NIh <- sizes$NIh
#' nIh <- sizes$nIh
#' 
#' samI <- S.STSI(Stratum, NIh, nIh)
#' UI <- levels(as.factor(FrameI$PSU))
#' sampleI <- UI[samI]
#'           
#' FrameII <- left_join(sizes, BigCity[which(BigCity$PSU %in% sampleI), ])
#' attach(FrameII)
#' 
#' HHdb <- FrameII %>% 
#'         group_by(PSU) %>%
#'         summarise(Ni = length(unique(HHID)))
#'         
#' Ni <- as.numeric(HHdb$Ni)
#' ni <- ceiling(Ni * 0.1)
#' ni
#' sum(ni)
#' 
#' sam = S.SI(Ni[1], ni[1])
#' clusterII = FrameII[which(FrameII$PSU == sampleI[1]), ]
#' sam.HH <- data.frame(HHID = unique(clusterII$HHID)[sam])
#' clusterHH <- left_join(sam.HH, clusterII, by = "HHID") 
#' clusterHH$dki <- Ni[1]/ni[1]
#' clusterHH$dk <- clusterHH$dI * clusterHH$dki
#' data = clusterHH
#' for (i in 2:length(Ni)) {
#'       sam = S.SI(Ni[i], ni[i])
#'       clusterII = FrameII[which(FrameII$PSU == sampleI[i]), ]
#'       sam.HH <- data.frame(HHID = unique(clusterII$HHID)[sam])
#'       clusterHH <- left_join(sam.HH, clusterII, by = "HHID") 
#'       clusterHH$dki <- Ni[i]/ni[i]
#'       clusterHH$dk <- clusterHH$dI * clusterHH$dki
#'       data1 = clusterHH
#'       data = rbind(data, data1)
#' }
#' 
#' sum(data$dk)
#' attach(data)
#' estima <- data.frame(Income, Expenditure)
#' area <- as.factor(PSU)
#' stratum <- as.factor(Stratum)
#' 
#' E.UC(stratum, area, dk, estima)
#' 
#' ################################
#' ## Example 2:                 ##
#' ## Self weighted Two-stage SI ##
#' ################################
#' 
#' data('BigCity')
#' FrameI <- BigCity %>% group_by(PSU) %>%
#' summarise(Stratum = unique(Stratum),
#'           Households = length(unique(HHID)),
#'           Income = sum(Income),
#'           Expenditure = sum(Expenditure))
#'             
#' attach(FrameI)
#' 
#' sizes = FrameI %>% group_by(Stratum) %>%
#'         summarise(NIh = n(),
#'         nIh = 2)
#'         
#' NIh <- sizes$NIh
#' nIh <- sizes$nIh
#' 
#' resI <- S.STpiPS(Stratum, Households, nIh)
#' head(resI)
#' samI <- resI[, 1]
#' piI <- resI[, 2]
#' UI <- levels(as.factor(FrameI$PSU))
#' sampleI <- data.frame(PSU = UI[samI], dI = 1/piI) 
#'  
#' FrameII <- left_join(sampleI, 
#'            BigCity[which(BigCity$PSU %in% sampleI[,1]), ])
#'            
#' attach(FrameII)
#' 
#' HHdb <- FrameII %>% 
#'         group_by(PSU) %>%
#'         summarise(Ni = length(unique(HHID)))
#' Ni <- as.numeric(HHdb$Ni)
#' ni <- 5
#' 
#' sam = S.SI(Ni[1], ni)
#' clusterII = FrameII[which(FrameII$PSU == sampleI$PSU[1]), ]
#' sam.HH <- data.frame(HHID = unique(clusterII$HHID)[sam])
#' clusterHH <- left_join(sam.HH, clusterII, by = "HHID") 
#' clusterHH$dki <- Ni[1]/ni
#' clusterHH$dk <- clusterHH$dI * clusterHH$dki
#' data = clusterHH
#' for (i in 2:length(Ni)) {
#'       sam = S.SI(Ni[i], ni)
#'       clusterII = FrameII[which(FrameII$PSU == sampleI$PSU[i]), ]
#'       sam.HH <- data.frame(HHID = unique(clusterII$HHID)[sam])
#'       clusterHH <- left_join(sam.HH, clusterII, by = "HHID") 
#'       clusterHH$dki <- Ni[i]/ni
#'       clusterHH$dk <- clusterHH$dI * clusterHH$dki
#'       data1 = clusterHH
#'       data = rbind(data, data1)
#' }
#' 
#' sum(data$dk)
#' attach(data)
#' estima <- data.frame(Income, Expenditure)
#' area <- as.factor(PSU)
#' stratum <- as.factor(Stratum)
#' 
#' E.UC(stratum, area, dk, estima)


E.UC <- function(S, PSU, dk, y) {
  y <- cbind(1, y)
  y <- as.data.frame(y)
  names(y)[1] <- "N"
  PSU <- as.factor(PSU)
  S <- as.factor(S)
  
  Total <- matrix(NA, nrow = 4, ncol = dim(y)[2])
  rownames(Total) = c("Estimation", "Standard Error", "CVE", 
                      "DEFF")
  colnames(Total) <- names(y)
  
  for (k in 1:dim(y)[2]) {
    yk <- tyi <- NULL
    matriz <- data.frame(y[, k], dk, PSU, S)
    colnames(matriz)[1] <- "yk"  
    
    P1 <- matriz %>% 
      group_by(PSU) %>%
      summarise(tyi = sum(yk * dk),
                S = unique(S))
    
    P2 <- P1 %>% 
      group_by(S) %>%
      summarise(barty = mean(tyi))
    
    P3 <- matriz %>% 
      group_by(S) %>%
      summarise(mi = length(unique(PSU)))
    
    T1 <- left_join(left_join(P1, P2, by="S"), P3, by="S")
    T1$s2 <- (T1$mi/(T1$mi-1))*(T1$tyi - T1$barty)^2
    
    Vty <- sum(T1$s2, na.rm = T)
    ty <- sum(matriz$yk * dk)
    
    CVe <- 100 * sqrt(Vty)/ty
    n <- length(y[, k])
    N <- sum(dk)
    VMAS <- (N^2) * (1 - (n/N)) * var(y[, k])/(n)
    DEFF <- Vty/VMAS
    Total[, k] <- c(ty, sqrt(Vty), CVe, DEFF)
  }
  return(Total)
}


