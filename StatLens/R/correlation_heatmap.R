#' Compute and Visualise a Correlation Matrix
#'
#' Computes pairwise Pearson (or Spearman / Kendall) correlations for all
#' numeric columns of a data frame, or for a numeric matrix, and draws a
#' colour-coded heatmap.
#'
#' @param x A numeric matrix or data frame.  Non-numeric columns are silently
#'   dropped.
#' @param method Correlation method: \code{"pearson"} (default),
#'   \code{"spearman"}, or \code{"kendall"}.
#' @param use Character string passed to \code{\link[stats]{cor}}.  Default
#'   is \code{"pairwise.complete.obs"}.
#' @param plot Logical; whether to draw the heatmap.  Default \code{TRUE}.
#' @param digits Integer; number of decimal places shown in heatmap cells.
#'   Default \code{2}.
#'
#' @return Invisibly, the correlation matrix (class \code{"statlens_cor"}).
#'   The heatmap is drawn as a side effect when \code{plot = TRUE}.
#'
#' @examples
#' cm <- correlation_heatmap(mtcars)
#' cm <- correlation_heatmap(mtcars, method = "spearman", plot = FALSE)
#' print(round(cm, 2))
#'
#' @export
correlation_heatmap <- function(x,
                                method = c("pearson", "spearman", "kendall"),
                                use    = "pairwise.complete.obs",
                                plot   = TRUE,
                                digits = 2) {
  method <- match.arg(method)

  # Keep only numeric columns
  if (is.data.frame(x)) {
    num_cols <- vapply(x, is.numeric, logical(1))
    x <- x[, num_cols, drop = FALSE]
    if (ncol(x) < 2L)
      stop("At least two numeric columns are required.")
    x <- as.matrix(x)
  } else if (!is.matrix(x) || !is.numeric(x)) {
    stop("`x` must be a numeric matrix or data frame.")
  }

  R <- stats::cor(x, method = method, use = use)
  class(R) <- c("statlens_cor", "matrix")

  if (plot) {
    p <- ncol(R)
    pal <- grDevices::colorRampPalette(c("navy", "white", "firebrick"))(200)
    old_par <- graphics::par(mar = c(5, 5, 4, 2))
    on.exit(graphics::par(old_par))

    # image() draws columns bottom-to-top; flip row order so diagonal runs
    # top-left to bottom-right
    R_plot <- R[nrow(R):1, ]
    graphics::image(1:p, 1:p, t(R_plot),
                    col    = pal,
                    zlim   = c(-1, 1),
                    axes   = FALSE,
                    xlab   = "",
                    ylab   = "",
                    main   = paste(tools::toTitleCase(method), "Correlation Heatmap"))

    graphics::axis(1, at = 1:p, labels = colnames(R), las = 2, cex.axis = 0.8)
    graphics::axis(2, at = 1:p, labels = rev(rownames(R)), las = 2, cex.axis = 0.8)

    # Overlay correlation values
    for (i in 1:p) {
      for (j in 1:p) {
        ri <- p - i + 1   # flipped row index
        graphics::text(j, ri, labels = round(R[i, j], digits),
                       cex = 0.75,
                       col = if (abs(R[i, j]) > 0.6) "white" else "black")
      }
    }
  }

  invisible(R)
}

#' @export
print.statlens_cor <- function(x, digits = 3, ...) {
  cat("-- StatLens Correlation Matrix --\n")
  class(x) <- "matrix"
  print(round(x, digits))
  invisible(x)
}
