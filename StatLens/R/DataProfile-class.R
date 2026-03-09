#' DataProfile S4 Class
#'
#' An S4 class that stores a comprehensive profile of a data frame, including
#' column-level descriptive statistics, missing-data counts, and detected
#' outlier flags.  Construct a \code{DataProfile} object with the
#' \code{\link{profile_data}} constructor.
#'
#' @slot data_name  Character; name or label for the data source.
#' @slot nrow       Integer; number of rows in the data frame.
#' @slot ncol       Integer; number of columns in the data frame.
#' @slot col_types  Named character vector; R class of each column.
#' @slot stats      Data frame; per-column descriptive statistics.
#' @slot missing    Data frame; per-column missing-data summary.
#' @slot outlier_counts Named integer vector; number of outliers per numeric
#'   column (IQR method).
#' @slot created_at POSIXct; timestamp when the profile was created.
#'
#' @exportClass DataProfile
setClass(
  "DataProfile",
  representation(
    data_name      = "character",
    nrow           = "integer",
    ncol           = "integer",
    col_types      = "character",
    stats          = "data.frame",
    missing        = "data.frame",
    outlier_counts = "integer",
    created_at     = "POSIXct"
  ),
  validity = function(object) {
    if (length(object@data_name) != 1L)
      return("@data_name must be a length-1 character string.")
    if (object@nrow < 0L || object@ncol < 0L)
      return("@nrow and @ncol must be non-negative integers.")
    TRUE
  }
)

# ---- Generics -------------------------------------------------------------- #

#' Summarise a DataProfile
#'
#' @param object A \code{DataProfile} object.
#' @param ... Ignored.
#' @return Invisibly returns \code{object}.
#' @exportMethod profile_summary
setGeneric("profile_summary", function(object, ...) {
  standardGeneric("profile_summary")
})

#' Plot a DataProfile
#'
#' @param object A \code{DataProfile} object.
#' @param which Character; which plot to draw.  One of \code{"missing"},
#'   \code{"outliers"}, \code{"means"} (default).
#' @param ... Additional graphical parameters.
#' @exportMethod profile_plot
setGeneric("profile_plot", function(object, which = "means", ...) {
  standardGeneric("profile_plot")
})

# ---- show ------------------------------------------------------------------ #

#' @describeIn DataProfile Show a brief summary of a DataProfile.
#' @param object A \code{DataProfile} object.
setMethod("show", "DataProfile", function(object) {
  cat("=== StatLens DataProfile ===\n")
  cat(sprintf("  Source    : %s\n", object@data_name))
  cat(sprintf("  Dimensions: %d rows x %d columns\n", object@nrow, object@ncol))
  cat(sprintf("  Created   : %s\n", format(object@created_at)))
  n_num <- sum(object@col_types %in% c("numeric", "integer", "double"))
  n_chr <- sum(object@col_types == "character")
  n_fac <- sum(object@col_types == "factor")
  cat(sprintf("  Numeric cols: %d | Character: %d | Factor: %d\n",
              n_num, n_chr, n_fac))
  total_miss <- sum(object@missing$n_missing)
  cat(sprintf("  Total missing values: %d\n", total_miss))
  cat(sprintf("  Columns with outliers (IQR): %d\n",
              sum(object@outlier_counts > 0L)))
})

# ---- profile_summary ------------------------------------------------------- #

#' @describeIn DataProfile Print a detailed statistics table.
setMethod("profile_summary", "DataProfile", function(object, ...) {
  cat("=== Column Statistics ===\n")
  print(object@stats, row.names = FALSE)
  cat("\n=== Missing Data ===\n")
  print(object@missing, row.names = FALSE)
  cat("\n=== Outlier Counts (IQR) ===\n")
  print(object@outlier_counts)
  invisible(object)
})

# ---- profile_plot ---------------------------------------------------------- #

#' @describeIn DataProfile Draw diagnostic plots.
setMethod("profile_plot", "DataProfile", function(object,
                                                   which = "means", ...) {
  which <- match.arg(which, c("means", "missing", "outliers"))
  switch(which,
    means = {
      nums <- object@stats[, c("column", "mean"), drop = FALSE]
      nums <- nums[!is.na(nums$mean), ]
      graphics::barplot(nums$mean,
                        names.arg = nums$column,
                        col  = "steelblue",
                        las  = 2,
                        main = paste("Column Means —", object@data_name),
                        ylab = "Mean")
    },
    missing = {
      mis <- object@missing
      bar_col <- ifelse(mis$high_missing, "firebrick", "steelblue")
      old_mar <- graphics::par(mar = c(8, 4, 4, 2))
      on.exit(graphics::par(old_mar))
      graphics::barplot(mis$pct_missing,
                        names.arg = mis$column,
                        col  = bar_col,
                        las  = 2,
                        main = paste("Missing Data —", object@data_name),
                        ylab = "Missing (%)")
    },
    outliers = {
      oc <- object@outlier_counts
      oc <- oc[oc > 0L]
      if (length(oc) == 0L) {
        message("No outliers detected in any column.")
      } else {
        graphics::barplot(oc,
                          col  = "firebrick",
                          las  = 2,
                          main = paste("Outlier Counts (IQR) —",
                                       object@data_name),
                          ylab = "Count")
      }
    }
  )
  invisible(object)
})
