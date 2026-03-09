#' Summarise Missing Data in a Data Frame
#'
#' Produces a column-by-column missing-data profile for a data frame, sorting
#' columns from most to least missing and providing a simple bar-chart
#' visualisation.
#'
#' @param data A data frame.
#' @param sort Logical; if \code{TRUE} (default) columns are sorted in
#'   descending order of missing proportion.
#' @param threshold Numeric in \eqn{[0, 1]}; columns with a missing proportion
#'   above this value are flagged.  Default is \code{0.05} (5 \%).
#'
#' @return An object of class \code{"statlens_missing"} (a data frame) with
#'   columns:
#'   \describe{
#'     \item{column}{Column name.}
#'     \item{n_missing}{Number of \code{NA} values.}
#'     \item{n_total}{Total number of rows.}
#'     \item{pct_missing}{Proportion missing (0–100).}
#'     \item{high_missing}{Logical flag: \code{TRUE} if above
#'       \code{threshold}.}
#'   }
#'
#' @examples
#' df <- data.frame(
#'   a = c(1, NA, 3, 4, NA),
#'   b = c(NA, NA, NA, 4, 5),
#'   c = 1:5
#' )
#' ms <- missing_summary(df)
#' print(ms)
#' plot(ms)
#'
#' @export
missing_summary <- function(data, sort = TRUE, threshold = 0.05) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.")
  n <- nrow(data)
  n_miss <- vapply(data, function(col) sum(is.na(col)), integer(1))
  pct    <- n_miss / n * 100

  result <- data.frame(
    column       = names(data),
    n_missing    = n_miss,
    n_total      = n,
    pct_missing  = round(pct, 2),
    high_missing = pct / 100 > threshold,
    stringsAsFactors = FALSE
  )
  rownames(result) <- NULL

  if (sort) result <- result[order(-result$pct_missing), ]
  class(result) <- c("statlens_missing", "data.frame")
  attr(result, "threshold") <- threshold
  result
}

#' @export
print.statlens_missing <- function(x, ...) {
  thr <- attr(x, "threshold") * 100
  cat(sprintf("-- StatLens Missing Data Summary (flag threshold: %.1f%%) --\n",
              thr))
  class(x) <- "data.frame"
  print(x, row.names = FALSE)
  invisible(x)
}

#' @export
plot.statlens_missing <- function(x, main = NULL, ...) {
  thr <- attr(x, "threshold") * 100
  bar_col <- ifelse(x$high_missing, "firebrick", "steelblue")
  old_mar <- graphics::par(mar = c(8, 4, 4, 2))
  on.exit(graphics::par(old_mar))

  bp <- graphics::barplot(x$pct_missing,
                          names.arg = x$column,
                          col       = bar_col,
                          las       = 2,
                          ylim      = c(0, max(x$pct_missing, thr) * 1.15),
                          ylab      = "Missing (%)",
                          main      = main %||% "Missing Data by Column")
  graphics::abline(h = thr, lty = 2, col = "darkred")
  graphics::mtext(sprintf("Threshold = %.1f%%", thr),
                  side = 4, at = thr, col = "darkred", las = 2, cex = 0.8)
  invisible(x)
}
