\name{missing_summary}
\alias{missing_summary}
\alias{print.statlens_missing}
\alias{plot.statlens_missing}
\title{Summarise Missing Data in a Data Frame}
\usage{
missing_summary(data, sort = TRUE, threshold = 0.05)

\method{print}{statlens_missing}(x, ...)

\method{plot}{statlens_missing}(x, main = NULL, ...)
}
\arguments{
  \item{data}{A data frame.}
  \item{sort}{Sort by descending missingness (default \code{TRUE}).}
  \item{threshold}{Flag columns above this proportion (default 0.05 = 5\%).}
  \item{x}{A \code{statlens_missing} object.}
  \item{main}{Plot title.}
  \item{...}{Additional arguments.}
}
\value{
  A data frame with class \code{"statlens_missing"}.
}
\description{
  Profiles missing data column-by-column and flags columns that exceed a
  user-defined threshold.
}
\examples{
df <- data.frame(a = c(1, NA, 3), b = c(NA, NA, 3), c = 1:3)
ms <- missing_summary(df)
print(ms)
plot(ms)
}
