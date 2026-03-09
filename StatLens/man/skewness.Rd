\name{skewness}
\alias{skewness}
\title{Sample Skewness}
\usage{
skewness(x)
}
\arguments{
  \item{x}{A numeric vector; \code{NA}s are silently removed.}
}
\value{
  A single numeric value.
}
\description{
  Computes the bias-corrected sample skewness (adjusted Fisher-Pearson
  standardised moment coefficient).
}
\examples{
skewness(c(1, 2, 2, 3, 3, 3, 4, 4, 5))
skewness(rexp(500))
}
