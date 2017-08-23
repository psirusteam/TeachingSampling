#' @export

PikHol <- function(n, sigma, e, Pi = PiDefault){
  N <- dim(sigma)[1]
  p <- length(n)
  PiDefault <- matrix(NA, nrow = N, ncol = p)
  A <- matrix(NA, nrow = N, ncol = p)
  for (k in 1:p) {
    PiDefault[,k] <- PikPPS(n[k], sigma[,k])
  }
  for (k in 1:p) {
    A[,k] <- sigma[,k] ^ 2/(sum(((1 / Pi[,k]) - 1)*sigma[,k] ^ 2))
  }
  aqk <- rowSums(A)
  n.st <- ceiling(((sum(sqrt(aqk))) ^ 2)/((1 + e) * p + (sum(aqk))))
  pikopt <- PikPPS(n.st, sqrt(aqk))
  return(pikopt)
}
