#' Detect Outliers in a Numeric Vector
#'
#' Identifies potential outliers using two classical methods: the
#' Inter-Quartile Range (IQR) fence and the Z-score threshold.  The function
#' returns an S3 object with flagged indices, values, and diagnostic
#' information.
#'
#' @param x A numeric vector.
#' @param method Character string; one of \code{"iqr"} (default),
#'   \code{"zscore"}, or \code{"both"}.
#' @param iqr_multiplier Numeric; the fence multiplier applied to the IQR.
#'   Default is \code{1.5} (Tukey's rule); use \code{3} for "far outliers".
#' @param z_threshold Numeric; the absolute Z-score above which observations
#'   are flagged.  Default is \code{3}.
#' @param na.rm Logical; if \code{TRUE} (default) missing values are ignored.
#'
#' @return An object of class \code{"statlens_outliers"} (a list) containing:
#'   \describe{
#'     \item{indices}{Integer vector of outlier positions.}
#'     \item{values}{Numeric vector of outlier values.}
#'     \item{flags}{Logical vector of length \code{length(x)}.}
#'     \item{method}{The method(s) used.}
#'     \item{bounds}{Named numeric vector with lower/upper fences (IQR) or
#'       thresholds (Z-score).}
#'     \item{n_outliers}{Number of detected outliers.}
#'   }
#'
#' @examples
#' set.seed(1)
#' x <- c(rnorm(100), 10, -8, 15)
#'
#' out_iqr <- detect_outliers(x, method = "iqr")
#' print(out_iqr)
#'
#' out_z <- detect_outliers(x, method = "zscore", z_threshold = 2.5)
#' print(out_z)
#'
#' out_both <- detect_outliers(x, method = "both")
#' plot(out_both)
#'
#' @export
detect_outliers <- function(x,
                            method         = c("iqr", "zscore", "both"),
                            iqr_multiplier = 1.5,
                            z_threshold    = 3,
                            na.rm          = TRUE) {
  method <- match.arg(method)
  if (!is.numeric(x)) stop("`x` must be a numeric vector.")

  if (na.rm) x_clean <- x[!is.na(x)] else x_clean <- x
  n <- length(x_clean)

  flag_iqr   <- logical(length(x))
  flag_z     <- logical(length(x))
  bounds     <- list()

  if (method %in% c("iqr", "both")) {
    q   <- stats::quantile(x_clean, c(0.25, 0.75), na.rm = TRUE)
    iqr <- unname(q[2] - q[1])
    lo  <- unname(q[1]) - iqr_multiplier * iqr
    hi  <- unname(q[2]) + iqr_multiplier * iqr
    flag_iqr <- (!is.na(x)) & (x < lo | x > hi)
    bounds$iqr <- c(lower = lo, upper = hi)
  }

  if (method %in% c("zscore", "both")) {
    mu  <- mean(x_clean)
    s   <- stats::sd(x_clean)
    zsc <- ifelse(is.na(x), NA_real_, (x - mu) / s)
    flag_z <- (!is.na(zsc)) & (abs(zsc) > z_threshold)
    bounds$zscore <- c(lower = mu - z_threshold * s,
                       upper = mu + z_threshold * s)
  }

  flags <- switch(method,
                  iqr    = flag_iqr,
                  zscore = flag_z,
                  both   = flag_iqr | flag_z)

  out <- list(
    indices    = which(flags),
    values     = x[flags],
    flags      = flags,
    x          = x,
    method     = method,
    bounds     = bounds,
    n_outliers = sum(flags)
  )
  class(out) <- "statlens_outliers"
  out
}

#' @export
print.statlens_outliers <- function(x, ...) {
  cat(sprintf("-- StatLens Outlier Detection (method: %s) --\n", x$method))
  cat(sprintf("   Total observations : %d\n", length(x$x)))
  cat(sprintf("   Outliers detected  : %d\n", x$n_outliers))
  if (x$n_outliers > 0) {
    cat("   Outlier values     :", paste(round(x$values, 3), collapse = ", "), "\n")
    cat("   At indices         :", paste(x$indices, collapse = ", "), "\n")
  }
  if (!is.null(x$bounds$iqr))
    cat(sprintf("   IQR fences         : [%.4g, %.4g]\n",
                x$bounds$iqr["lower"], x$bounds$iqr["upper"]))
  if (!is.null(x$bounds$zscore))
    cat(sprintf("   Z-score bounds     : [%.4g, %.4g]\n",
                x$bounds$zscore["lower"], x$bounds$zscore["upper"]))
  invisible(x)
}

#' @export
plot.statlens_outliers <- function(x, main = NULL, ...) {
  col_vec <- ifelse(x$flags, "firebrick", "steelblue")
  graphics::plot(seq_along(x$x), x$x,
                 col  = col_vec,
                 pch  = 19,
                 xlab = "Index",
                 ylab = "Value",
                 main = main %||% paste("Outlier Detection —", x$method))
  if (!is.null(x$bounds$iqr)) {
    graphics::abline(h = x$bounds$iqr["lower"], lty = 2, col = "darkgreen")
    graphics::abline(h = x$bounds$iqr["upper"], lty = 2, col = "darkgreen")
  }
  if (!is.null(x$bounds$zscore)) {
    graphics::abline(h = x$bounds$zscore["lower"], lty = 3, col = "purple")
    graphics::abline(h = x$bounds$zscore["upper"], lty = 3, col = "purple")
  }
  graphics::legend("topright",
                   legend = c("Normal", "Outlier"),
                   col    = c("steelblue", "firebrick"),
                   pch    = 19, bty = "n")
  invisible(x)
}
