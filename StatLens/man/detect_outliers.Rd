\name{detect_outliers}
\alias{detect_outliers}
\alias{print.statlens_outliers}
\alias{plot.statlens_outliers}
\title{Detect Outliers in a Numeric Vector}
\usage{
detect_outliers(x, method = c("iqr", "zscore", "both"),
                iqr_multiplier = 1.5, z_threshold = 3, na.rm = TRUE)

\method{print}{statlens_outliers}(x, ...)

\method{plot}{statlens_outliers}(x, main = NULL, ...)
}
\arguments{
  \item{x}{A numeric vector.}
  \item{method}{One of \code{"iqr"}, \code{"zscore"}, or \code{"both"}.}
  \item{iqr_multiplier}{Fence multiplier (default 1.5).}
  \item{z_threshold}{Z-score threshold (default 3).}
  \item{na.rm}{Remove NAs before computing (default \code{TRUE}).}
  \item{main}{Plot title.}
  \item{...}{Additional arguments.}
}
\value{
  An S3 object of class \code{"statlens_outliers"}.
}
\description{
  Identifies outliers using Tukey's IQR fence, a Z-score threshold, or both.
  Returns indices, values, and flag vectors.
}
\examples{
set.seed(1)
x <- c(rnorm(100), 10, -8)
out <- detect_outliers(x)
print(out)
plot(out)
}
