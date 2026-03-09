test_that("detect_outliers returns correct class", {
  out <- detect_outliers(c(rnorm(50), 100))
  expect_s3_class(out, "statlens_outliers")
})

test_that("detect_outliers finds obvious outlier via IQR", {
  x <- c(rep(0, 50), 1000)
  out <- detect_outliers(x, method = "iqr")
  expect_equal(out$n_outliers, 1L)
  expect_equal(out$values, 1000)
})

test_that("detect_outliers finds outlier via zscore", {
  x <- c(rep(0, 50), 1000)
  out <- detect_outliers(x, method = "zscore", z_threshold = 2)
  expect_gte(out$n_outliers, 1L)
})

test_that("detect_outliers method='both' is union of iqr and zscore", {
  set.seed(10)
  x <- c(rnorm(100), 20, -20)
  n_iqr  <- detect_outliers(x, "iqr")$n_outliers
  n_z    <- detect_outliers(x, "zscore")$n_outliers
  n_both <- detect_outliers(x, "both")$n_outliers
  expect_gte(n_both, max(n_iqr, n_z))
})

test_that("detect_outliers errors on non-numeric input", {
  expect_error(detect_outliers(letters), "`x` must be a numeric vector")
})
