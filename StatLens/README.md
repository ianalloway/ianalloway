# StatLens <img src="man/figures/logo.png" align="right" height="139" alt="" />

<!-- badges: start -->
[![R-CMD-check](https://github.com/ianalloway/ianalloway/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ianalloway/ianalloway/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

**StatLens** provides a focused, self-contained toolkit for exploratory data
analysis (EDA) in R.  It is designed for students, analysts, and researchers
who need to quickly understand the structure and quality of a dataset without
pulling in large third-party dependencies.

---

## Features

| Function | Description |
|---|---|
| `describe()` | Descriptive statistics for numeric vectors and data frames (S3 generic) |
| `detect_outliers()` | Outlier detection via IQR fence or Z-score threshold |
| `missing_summary()` | Column-level missing-data profile with flagging |
| `correlation_heatmap()` | Pairwise correlations with integrated heatmap |
| `normalize()` | Min-max, Z-score, robust, and log scaling |
| `skewness()` | Bias-corrected sample skewness |
| `kurtosis()` | Bias-corrected sample excess kurtosis |
| `profile_data()` | All-in-one `DataProfile` S4 object |

---

## Installation

```r
# Install from GitHub (requires the remotes package)
remotes::install_github("ianalloway/ianalloway/StatLens")
```

---

## Quick Start

```r
library(StatLens)

# --- Descriptive statistics -------------------------------------------------
d <- describe(mtcars)
print(d)
plot(d)

# --- Outlier detection ------------------------------------------------------
set.seed(1)
x <- c(rnorm(100), 12, -10)
out <- detect_outliers(x, method = "both")
print(out)
plot(out)

# --- Missing data -----------------------------------------------------------
df <- data.frame(a = c(1, NA, 3), b = c(NA, NA, 3), c = 1:3)
ms <- missing_summary(df)
plot(ms)

# --- Correlation heatmap ----------------------------------------------------
correlation_heatmap(mtcars)

# --- Normalisation ----------------------------------------------------------
cars_scaled <- normalize(mtcars, method = "zscore")

# --- Full data profile (S4) -------------------------------------------------
dp <- profile_data(iris, name = "Iris Dataset")
show(dp)
profile_summary(dp)
profile_plot(dp, which = "outliers")
```

---

## Object Systems

### S3 Classes

| Class | Produced by | Methods |
|---|---|---|
| `statlens_describe` | `describe()` | `print`, `summary`, `plot` |
| `statlens_outliers` | `detect_outliers()` | `print`, `plot` |
| `statlens_missing` | `missing_summary()` | `print`, `plot` |
| `statlens_cor` | `correlation_heatmap()` | `print` |

### S4 Class: `DataProfile`

The `DataProfile` class stores a complete profile of a data frame in a
formally validated S4 object.

```
Slots     : data_name, nrow, ncol, col_types, stats, missing,
            outlier_counts, created_at
Generics  : show(), profile_summary(), profile_plot()
```

---

## Long-form Documentation

A detailed vignette is included:

```r
vignette("introduction", package = "StatLens")
```

---

## License

MIT © 2026 Ian Alloway
