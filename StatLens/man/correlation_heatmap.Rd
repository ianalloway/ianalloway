\name{correlation_heatmap}
\alias{correlation_heatmap}
\alias{print.statlens_cor}
\title{Compute and Visualise a Correlation Matrix}
\usage{
correlation_heatmap(x, method = c("pearson", "spearman", "kendall"),
                    use = "pairwise.complete.obs", plot = TRUE, digits = 2)

\method{print}{statlens_cor}(x, digits = 3, ...)
}
\arguments{
  \item{x}{A numeric matrix or data frame.}
  \item{method}{Correlation method: \code{"pearson"}, \code{"spearman"}, or
    \code{"kendall"}.}
  \item{use}{Handling of missing values; passed to \code{stats::cor}.}
  \item{plot}{Draw heatmap (default \code{TRUE}).}
  \item{digits}{Decimal places in heatmap cells.}
  \item{...}{Additional arguments.}
}
\value{
  Invisibly, the correlation matrix with class \code{"statlens_cor"}.
}
\description{
  Computes pairwise correlations and renders a colour-coded heatmap with
  cell-level value annotations.
}
\examples{
cm <- correlation_heatmap(mtcars)
print(cm)
}
