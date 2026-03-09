#' StatLens: Tools for Exploratory Statistical Analysis and Visualization
#'
#' @description
#' \pkg{StatLens} provides a focused, self-contained toolkit for performing
#' exploratory data analysis (EDA) in R.  The package is built around two
#' complementary object systems:
#'
#' \itemize{
#'   \item \strong{S3 classes}: \code{statlens_describe},
#'     \code{statlens_outliers}, \code{statlens_missing}, and
#'     \code{statlens_cor} — lightweight result containers with intuitive
#'     \code{print}, \code{summary}, and \code{plot} methods.
#'   \item \strong{S4 class}: \code{\link{DataProfile}} — a structured,
#'     validated object that stores a full data-frame profile including
#'     descriptive statistics, missing-data rates, and outlier counts.
#' }
#'
#' @section Main functions:
#' \describe{
#'   \item{\code{\link{describe}}}{Descriptive statistics for numeric vectors
#'     and data frames.}
#'   \item{\code{\link{detect_outliers}}}{Outlier detection via IQR fences or
#'     Z-score thresholding.}
#'   \item{\code{\link{missing_summary}}}{Column-level missing-data profile.}
#'   \item{\code{\link{correlation_heatmap}}}{Pairwise correlation matrix with
#'     an integrated heatmap.}
#'   \item{\code{\link{normalize}}}{Min-max, Z-score, robust, and log scaling.}
#'   \item{\code{\link{skewness}}}{Bias-corrected sample skewness.}
#'   \item{\code{\link{kurtosis}}}{Bias-corrected sample excess kurtosis.}
#'   \item{\code{\link{profile_data}}}{Construct a \code{DataProfile} S4
#'     object from a data frame.}
#' }
#'
#' @section Object systems:
#' \strong{S3} methods are used for the function-level result objects because
#' they are simple, lightweight, and easily extended.  The \strong{S4} class
#' \code{DataProfile} is used for the top-level profile object because it
#' benefits from formal slot definitions, validity checking, and method
#' dispatch via \code{setGeneric}/\code{setMethod}.
#'
#' @keywords internal
"_PACKAGE"
