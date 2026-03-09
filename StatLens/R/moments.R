#' Sample Skewness
#'
#' Computes the sample skewness (third standardised central moment) of a
#' numeric vector using the bias-corrected formula employed by many
#' statistical packages.
#'
#' @param x A numeric vector.  \code{NA} values are silently removed.
#' @return A single numeric value representing skewness.
#' @details
#' The formula used is the adjusted Fisher–Pearson standardised moment
#' coefficient:
#' \deqn{g_1 = \frac{n}{(n-1)(n-2)} \sum_{i=1}^{n}\left(\frac{x_i - \bar{x}}{s}\right)^3}
#' where \eqn{s} is the sample standard deviation and \eqn{n} is the number
#' of non-missing observations.
#'
#' @examples
#' skewness(c(1, 2, 2, 3, 3, 3, 4, 4, 5))   # mild positive skew
#' skewness(rnorm(500))                        # near zero
#' skewness(rexp(500))                         # strong positive skew
#'
#' @export
skewness <- function(x) {
  x <- stats::na.omit(x)
  n <- length(x)
  if (n < 3L) return(NA_real_)
  m <- mean(x)
  s <- stats::sd(x)
  if (s == 0) return(NA_real_)
  z <- (x - m) / s
  (n / ((n - 1L) * (n - 2L))) * sum(z^3)
}

#' Sample Excess Kurtosis
#'
#' Computes the sample excess kurtosis (fourth standardised central moment
#' minus 3) of a numeric vector.
#'
#' @param x A numeric vector.  \code{NA} values are silently removed.
#' @return A single numeric value.  A value of 0 corresponds to a normal
#'   distribution; positive values indicate heavier tails (leptokurtic);
#'   negative values indicate lighter tails (platykurtic).
#' @details
#' Uses the bias-corrected formula:
#' \deqn{G_2 = \frac{n(n+1)}{(n-1)(n-2)(n-3)} \sum\left(\frac{x_i-\bar{x}}{s}\right)^4
#'              - \frac{3(n-1)^2}{(n-2)(n-3)}}
#'
#' @examples
#' kurtosis(rnorm(1000))     # near 0 (excess kurtosis)
#' kurtosis(rt(1000, df=4))  # positive (heavy tails)
#'
#' @export
kurtosis <- function(x) {
  x <- stats::na.omit(x)
  n <- length(x)
  if (n < 4L) return(NA_real_)
  m <- mean(x)
  s <- stats::sd(x)
  if (s == 0) return(NA_real_)
  z <- (x - m) / s
  kurt_raw <- (n * (n + 1L)) / ((n - 1L) * (n - 2L) * (n - 3L)) * sum(z^4)
  correction <- (3 * (n - 1L)^2) / ((n - 2L) * (n - 3L))
  kurt_raw - correction
}
