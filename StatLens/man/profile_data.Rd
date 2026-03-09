\name{profile_data}
\alias{profile_data}
\title{Create a DataProfile Object}
\usage{
profile_data(data, name = deparse(substitute(data)),
             outlier_method = "iqr", missing_threshold = 0.05)
}
\arguments{
  \item{data}{A data frame.}
  \item{name}{Label for the data source.}
  \item{outlier_method}{Method passed to \code{\link{detect_outliers}}.}
  \item{missing_threshold}{Flag threshold for \code{\link{missing_summary}}.}
}
\value{
  A \code{\linkS4class{DataProfile}} S4 object.
}
\description{
  Constructor for the S4 \code{DataProfile} class.  Analyses a data frame
  and bundles descriptive statistics, missing-data rates, and outlier counts
  into a single validated object.
}
\examples{
dp <- profile_data(mtcars, name = "Motor Trend Cars")
show(dp)
profile_summary(dp)
profile_plot(dp, which = "means")
}
