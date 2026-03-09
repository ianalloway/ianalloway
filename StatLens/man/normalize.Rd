\name{normalize}
\alias{normalize}
\title{Normalise / Standardise a Numeric Vector or Data Frame}
\usage{
normalize(x, method = c("minmax", "zscore", "robust", "log"),
          na.rm = TRUE, offset = 1)
}
\arguments{
  \item{x}{A numeric vector or data frame.}
  \item{method}{Scaling method: \code{"minmax"}, \code{"zscore"},
    \code{"robust"}, or \code{"log"}.}
  \item{na.rm}{Ignore NAs when computing scale parameters (default
    \code{TRUE}).}
  \item{offset}{Constant added before log transformation (default 1).}
}
\value{
  A scaled numeric vector or data frame with attribute
  \code{"scale_params"}.
}
\description{
  Applies min-max, Z-score, robust (median/IQR), or log scaling to a numeric
  vector or all numeric columns of a data frame.
}
\examples{
normalize(c(10, 20, 30), "minmax")
normalize(mtcars, "zscore")
}
