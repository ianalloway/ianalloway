#' Normalise / Standardise a Numeric Vector or Data Frame
#'
#' Applies one of several common scaling transformations to a numeric vector
#' or to every numeric column of a data frame.
#'
#' @param x A numeric vector or data frame.
#' @param method Scaling method; one of:
#'   \describe{
#'     \item{\code{"minmax"}}{(default) Scales each value to
#'       \eqn{[0, 1]}: \eqn{(x - \min) / (\max - \min)}.}
#'     \item{\code{"zscore"}}{Subtracts the mean and divides by the standard
#'       deviation: \eqn{(x - \bar{x}) / s}.}
#'     \item{\code{"robust"}}{Subtracts the median and divides by the IQR:
#'       \eqn{(x - \mathrm{median}) / \mathrm{IQR}}.}
#'     \item{\code{"log"}}{Natural logarithm transformation
#'       \eqn{\log(x + \mathrm{offset})}.  Requires non-negative input.}
#'   }
#' @param na.rm Logical; if \code{TRUE} (default) \code{NA}s are ignored when
#'   computing scale parameters but kept in the output.
#' @param offset Numeric; added to \code{x} before \code{log} transformation
#'   to handle zeros.  Default \code{1}.
#'
#' @return A numeric vector or data frame of the same dimensions as \code{x},
#'   with an attribute \code{"scale_params"} recording the parameters used
#'   (mean, sd, min, max, etc.) for each column.
#'
#' @examples
#' x <- c(10, 20, 30, 40, 50)
#' normalize(x, "minmax")    # 0.00 0.25 0.50 0.75 1.00
#' normalize(x, "zscore")
#' normalize(x, "robust")
#'
#' df <- normalize(mtcars, "zscore")
#' round(colMeans(df), 10)   # all ~0
#'
#' @export
normalize <- function(x,
                      method = c("minmax", "zscore", "robust", "log"),
                      na.rm  = TRUE,
                      offset = 1) {
  method <- match.arg(method)

  .scale_vec <- function(v, method, na.rm, offset) {
    params <- list()
    out <- switch(method,
      minmax = {
        mn  <- min(v, na.rm = na.rm)
        mx  <- max(v, na.rm = na.rm)
        params <- list(min = mn, max = mx)
        if (mx == mn) rep(0, length(v)) else (v - mn) / (mx - mn)
      },
      zscore = {
        mu <- mean(v, na.rm = na.rm)
        s  <- stats::sd(v, na.rm = na.rm)
        params <- list(mean = mu, sd = s)
        if (s == 0) rep(0, length(v)) else (v - mu) / s
      },
      robust = {
        med <- stats::median(v, na.rm = na.rm)
        iqr <- stats::IQR(v, na.rm = na.rm)
        params <- list(median = med, iqr = iqr)
        if (iqr == 0) rep(0, length(v)) else (v - med) / iqr
      },
      log = {
        if (any(v + offset <= 0, na.rm = TRUE))
          stop("Log normalisation requires x + offset > 0 for all values.")
        params <- list(offset = offset)
        log(v + offset)
      }
    )
    list(out = out, params = params)
  }

  if (is.numeric(x)) {
    res        <- .scale_vec(x, method, na.rm, offset)
    out        <- res$out
    attr(out, "scale_params") <- list(vec = res$params)
    return(out)
  }

  if (is.data.frame(x)) {
    num_cols <- vapply(x, is.numeric, logical(1))
    params   <- list()
    for (nm in names(x)[num_cols]) {
      res     <- .scale_vec(x[[nm]], method, na.rm, offset)
      x[[nm]] <- res$out
      params[[nm]] <- res$params
    }
    attr(x, "scale_params") <- params
    return(x)
  }

  stop("`x` must be a numeric vector or data frame.")
}
