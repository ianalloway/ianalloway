\name{DataProfile-class}
\alias{DataProfile-class}
\alias{show,DataProfile-method}
\alias{profile_summary,DataProfile-method}
\alias{profile_plot,DataProfile-method}
\docType{class}
\title{DataProfile S4 Class}
\description{
  An S4 class storing a comprehensive profile of a data frame, built by
  \code{\link{profile_data}}.
}
\section{Slots}{
  \describe{
    \item{\code{data_name}}{Character; label for the data source.}
    \item{\code{nrow}}{Integer; number of rows.}
    \item{\code{ncol}}{Integer; number of columns.}
    \item{\code{col_types}}{Named character vector; R class of each column.}
    \item{\code{stats}}{Data frame; per-column descriptive statistics.}
    \item{\code{missing}}{Data frame; missing-data summary.}
    \item{\code{outlier_counts}}{Named integer vector; outliers per column.}
    \item{\code{created_at}}{POSIXct; creation timestamp.}
  }
}
\section{Methods}{
  \describe{
    \item{\code{show}}{Prints a concise overview.}
    \item{\code{profile_summary}}{Prints full statistics tables.}
    \item{\code{profile_plot}}{Draws diagnostic bar charts
      (\code{which = "means"}, \code{"missing"}, or \code{"outliers"}).}
  }
}
\seealso{
  \code{\link{profile_data}}
}
\examples{
dp <- profile_data(iris, name = "Iris Dataset")
show(dp)
profile_plot(dp, which = "outliers")
}
