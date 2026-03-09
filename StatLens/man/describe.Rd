\name{describe}
\alias{describe}
\alias{describe.numeric}
\alias{describe.data.frame}
\alias{describe.default}
\alias{print.statlens_describe}
\alias{summary.statlens_describe}
\alias{plot.statlens_describe}
\title{Describe: Comprehensive Descriptive Statistics}
\usage{
describe(x, ...)

\method{describe}{numeric}(x, use_iqr = TRUE, ...)

\method{describe}{data.frame}(x, numeric_only = TRUE, ...)

\method{describe}{default}(x, ...)

\method{print}{statlens_describe}(x, digits = 4, ...)

\method{summary}{statlens_describe}(object, ...)

\method{plot}{statlens_describe}(x, main = NULL, col = "steelblue", ...)
}
\arguments{
  \item{x}{An R object (numeric vector or data frame).}
  \item{use_iqr}{Logical; include the IQR in the output (default \code{TRUE}).}
  \item{numeric_only}{Logical; restrict to numeric columns (default \code{TRUE}).}
  \item{digits}{Significant digits when printing.}
  \item{object}{A \code{statlens_describe} object (for \code{summary}).}
  \item{main}{Optional plot title.}
  \item{col}{Bar fill colour.}
  \item{...}{Additional arguments.}
}
\value{
  An object of S3 class \code{"statlens_describe"}.
}
\description{
  A generic function producing comprehensive descriptive statistics for numeric
  vectors and data frames.  The resulting \code{statlens_describe} object
  includes \code{print}, \code{summary}, and \code{plot} methods.
}
\examples{
d <- describe(c(1, 2, 3, 4, 5, NA, 100))
print(d)
summary(d)

d2 <- describe(mtcars)
plot(d2)
}
