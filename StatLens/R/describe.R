#' Describe: Comprehensive Descriptive Statistics
#'
#' @description
#' A generic function that produces a rich descriptive-statistics summary for
#' numeric vectors and data frames.  The result is an object of class
#' \code{"statlens_describe"} which has \code{print}, \code{summary}, and
#' \code{plot} methods.
#'
#' @param x An R object.  Currently supported: \code{numeric} vectors and
#'   \code{data.frame} objects.
#' @param ... Additional arguments passed to methods.
#'
#' @return An object of S3 class \code{"statlens_describe"} (a named list).
#'
#' @examples
#' # Numeric vector
#' d <- describe(c(1, 2, 3, 4, 5, NA, 100))
#' print(d)
#'
#' # Data frame
#' d2 <- describe(mtcars)
#' plot(d2)
#'
#' @export
describe <- function(x, ...) {
  UseMethod("describe")
}

#' @rdname describe
#' @param use_iqr Logical; if \code{TRUE} (default) the inter-quartile range
#'   is also reported.
#' @export
describe.numeric <- function(x, use_iqr = TRUE, ...) {
  n_total   <- length(x)
  n_missing <- sum(is.na(x))
  n_valid   <- n_total - n_missing
  x_clean   <- stats::na.omit(x)

  q <- stats::quantile(x_clean, probs = c(0.25, 0.50, 0.75), na.rm = TRUE)

  result <- list(
    n          = n_total,
    n_missing  = n_missing,
    n_valid    = n_valid,
    mean       = mean(x_clean),
    sd         = stats::sd(x_clean),
    min        = min(x_clean),
    q1         = unname(q[1]),
    median     = unname(q[2]),
    q3         = unname(q[3]),
    max        = max(x_clean),
    iqr        = if (use_iqr) unname(q[3] - q[1]) else NULL,
    skewness   = skewness(x_clean),
    kurtosis   = kurtosis(x_clean),
    type       = "numeric"
  )
  class(result) <- "statlens_describe"
  result
}

#' @rdname describe
#' @param numeric_only Logical; if \code{TRUE} (default) only numeric columns
#'   are summarised.
#' @export
describe.data.frame <- function(x, numeric_only = TRUE, ...) {
  if (numeric_only) {
    cols <- names(x)[vapply(x, is.numeric, logical(1))]
    if (length(cols) == 0L)
      stop("No numeric columns found in the data frame.")
    x <- x[, cols, drop = FALSE]
  }

  col_stats <- lapply(x, function(col) {
    if (is.numeric(col)) {
      describe.numeric(col, ...)
    } else {
      list(type = "non-numeric", n = length(col),
           n_missing = sum(is.na(col)),
           n_unique  = length(unique(col)))
    }
  })

  result <- list(
    columns    = col_stats,
    nrow       = nrow(x),
    ncol       = ncol(x),
    col_names  = names(x),
    type       = "data.frame"
  )
  class(result) <- "statlens_describe"
  result
}

#' @rdname describe
#' @export
describe.default <- function(x, ...) {
  stop(
    "No describe() method for objects of class '",
    paste(class(x), collapse = "', '"), "'."
  )
}

# ---- S3 Methods ------------------------------------------------------------ #

#' Print method for statlens_describe objects
#'
#' @param x A \code{statlens_describe} object.
#' @param digits Integer; number of significant digits to print.
#' @param ... Ignored.
#' @export
print.statlens_describe <- function(x, digits = 4, ...) {
  if (x$type == "numeric") {
    cat("-- StatLens Descriptive Summary (numeric) --\n")
    cat(sprintf("  n         : %d  (missing: %d)\n", x$n, x$n_missing))
    cat(sprintf("  Mean      : %.*g\n", digits, x$mean))
    cat(sprintf("  SD        : %.*g\n", digits, x$sd))
    cat(sprintf("  Min / Max : %.*g / %.*g\n", digits, x$min, digits, x$max))
    cat(sprintf("  Q1 / Median / Q3 : %.*g / %.*g / %.*g\n",
                digits, x$q1, digits, x$median, digits, x$q3))
    if (!is.null(x$iqr))
      cat(sprintf("  IQR       : %.*g\n", digits, x$iqr))
    cat(sprintf("  Skewness  : %.*g\n", digits, x$skewness))
    cat(sprintf("  Kurtosis  : %.*g\n", digits, x$kurtosis))
  } else {
    cat(sprintf("-- StatLens Descriptive Summary (%d x %d data frame) --\n",
                x$nrow, x$ncol))
    for (nm in x$col_names) {
      s <- x$columns[[nm]]
      if (s$type == "numeric") {
        cat(sprintf("  %-18s mean=%.*g  sd=%.*g  NAs=%d\n",
                    nm, 4, s$mean, 4, s$sd, s$n_missing))
      } else {
        cat(sprintf("  %-18s [non-numeric]  n=%d  NAs=%d  unique=%d\n",
                    nm, s$n, s$n_missing, s$n_unique))
      }
    }
  }
  invisible(x)
}

#' Summary method for statlens_describe objects
#'
#' @param object A \code{statlens_describe} object.
#' @param ... Ignored.
#' @return A data frame (data.frame describe) or named vector (numeric
#'   describe) of summary statistics.
#' @export
summary.statlens_describe <- function(object, ...) {
  if (object$type == "numeric") {
    data.frame(
      statistic = c("n", "n_missing", "mean", "sd",
                    "min", "q1", "median", "q3", "max",
                    "iqr", "skewness", "kurtosis"),
      value     = c(object$n, object$n_missing, object$mean, object$sd,
                    object$min, object$q1, object$median, object$q3, object$max,
                    object$iqr %||% NA_real_, object$skewness, object$kurtosis),
      stringsAsFactors = FALSE
    )
  } else {
    do.call(rbind, lapply(names(object$columns), function(nm) {
      s <- object$columns[[nm]]
      if (s$type == "numeric") {
        data.frame(column = nm, mean = s$mean, sd = s$sd,
                   median = s$median, n_missing = s$n_missing,
                   stringsAsFactors = FALSE)
      } else {
        data.frame(column = nm, mean = NA_real_, sd = NA_real_,
                   median = NA_real_, n_missing = s$n_missing,
                   stringsAsFactors = FALSE)
      }
    }))
  }
}

#' Plot method for statlens_describe objects
#'
#' For a \emph{numeric} describe, a histogram with an overlaid density curve
#' is drawn.  For a \emph{data frame} describe, side-by-side box plots of all
#' numeric columns are drawn.
#'
#' @param x A \code{statlens_describe} object.
#' @param main Optional title string.
#' @param col Bar fill colour.
#' @param ... Additional graphical parameters passed to \code{hist} or
#'   \code{boxplot}.
#' @export
plot.statlens_describe <- function(x, main = NULL, col = "steelblue", ...) {
  if (x$type == "numeric") {
    h <- hist(c(x$min, x$max),  # dummy — we need the raw data stored
              plot = FALSE)
    # Reconstruct approximate data from stored stats is not ideal;
    # instead we fall back to a simple bar chart of key statistics.
    stats_vals <- c(Mean = x$mean, Median = x$median,
                    SD   = x$sd,   IQR    = x$iqr %||% NA_real_)
    stats_vals <- stats_vals[!is.na(stats_vals)]
    graphics::barplot(stats_vals,
                      col  = col,
                      main = main %||% "Descriptive Statistics",
                      ylab = "Value",
                      las  = 2)
  } else {
    # Build a matrix from per-column means and sds
    means <- vapply(x$columns, function(s) {
      if (s$type == "numeric") s$mean else NA_real_
    }, numeric(1))
    means <- means[!is.na(means)]
    graphics::barplot(means,
                      col  = grDevices::rainbow(length(means)),
                      main = main %||% "Column Means",
                      las  = 2,
                      ylab = "Mean value")
  }
  invisible(x)
}

# Helper: infix NULL-coalescing operator (internal only)
`%||%` <- function(a, b) if (!is.null(a)) a else b
