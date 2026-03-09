\name{kurtosis}
\alias{kurtosis}
\title{Sample Excess Kurtosis}
\usage{
kurtosis(x)
}
\arguments{
  \item{x}{A numeric vector; \code{NA}s are silently removed.}
}
\value{
  A single numeric value (excess kurtosis; 0 for a normal distribution).
}
\description{
  Computes the bias-corrected sample excess kurtosis.
}
\examples{
kurtosis(rnorm(1000))
kurtosis(rt(1000, df = 4))
}
