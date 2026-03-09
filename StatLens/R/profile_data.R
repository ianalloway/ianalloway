#' Create a DataProfile Object
#'
#' Constructor for the S4 \code{\link{DataProfile}} class.  Analyses a data
#' frame and stores descriptive statistics, missing-data proportions, and
#' outlier counts in a single structured object.
#'
#' @param data A data frame to profile.
#' @param name Character; a label for the data source, used in print output
#'   and plot titles.  Defaults to the name of the object passed as
#'   \code{data}.
#' @param outlier_method Character; method for outlier detection passed to
#'   \code{\link{detect_outliers}}.  Default \code{"iqr"}.
#' @param missing_threshold Numeric in \eqn{[0, 1]}; passed to
#'   \code{\link{missing_summary}} to flag high-missing columns.  Default
#'   \code{0.05}.
#'
#' @return A \code{DataProfile} S4 object.
#'
#' @examples
#' dp <- profile_data(mtcars, name = "Motor Trend Cars")
#' show(dp)
#' profile_summary(dp)
#' profile_plot(dp, which = "means")
#' profile_plot(dp, which = "missing")
#'
#' @export
profile_data <- function(data,
                         name              = deparse(substitute(data)),
                         outlier_method    = "iqr",
                         missing_threshold = 0.05) {
  if (!is.data.frame(data))
    stop("`data` must be a data frame.")

  # Column types
  col_types <- vapply(data, function(col) class(col)[1L], character(1))

  # Descriptive stats (numeric cols only)
  num_cols <- names(data)[vapply(data, is.numeric, logical(1))]
  stats_df <- do.call(rbind, lapply(num_cols, function(nm) {
    v   <- data[[nm]]
    vc  <- stats::na.omit(v)
    q   <- stats::quantile(vc, c(0.25, 0.5, 0.75))
    data.frame(
      column    = nm,
      n         = length(v),
      n_missing = sum(is.na(v)),
      mean      = mean(vc),
      sd        = stats::sd(vc),
      min       = min(vc),
      q1        = unname(q[1]),
      median    = unname(q[2]),
      q3        = unname(q[3]),
      max       = max(vc),
      skewness  = skewness(vc),
      kurtosis  = kurtosis(vc),
      stringsAsFactors = FALSE
    )
  }))
  if (is.null(stats_df))
    stats_df <- data.frame()

  # Missing summary
  miss_df <- missing_summary(data,
                             sort      = TRUE,
                             threshold = missing_threshold)
  class(miss_df) <- "data.frame"   # strip statlens_missing for slot storage

  # Outlier counts
  out_counts <- vapply(num_cols, function(nm) {
    tryCatch(
      detect_outliers(data[[nm]], method = outlier_method)$n_outliers,
      error = function(e) 0L
    )
  }, integer(1))

  methods::new("DataProfile",
    data_name      = as.character(name),
    nrow           = nrow(data),
    ncol           = ncol(data),
    col_types      = col_types,
    stats          = if (nrow(stats_df) > 0) stats_df else data.frame(),
    missing        = miss_df,
    outlier_counts = out_counts,
    created_at     = Sys.time()
  )
}
