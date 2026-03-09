test_that("missing_summary returns correct class and columns", {
  df <- data.frame(a = c(1, NA, 3), b = 1:3)
  ms <- missing_summary(df)
  expect_s3_class(ms, "statlens_missing")
  expect_true(all(c("column", "n_missing", "pct_missing", "high_missing") %in% names(ms)))
})

test_that("missing_summary counts NAs correctly", {
  df <- data.frame(a = c(NA, NA, 1), b = c(1, 2, 3))
  ms <- missing_summary(df)
  a_row <- ms[ms$column == "a", ]
  expect_equal(a_row$n_missing, 2L)
  expect_equal(a_row$pct_missing, round(2 / 3 * 100, 2))
})

test_that("missing_summary flags columns above threshold", {
  df <- data.frame(x = c(NA, NA, NA, 1, 2))  # 60% missing
  ms <- missing_summary(df, threshold = 0.5)
  expect_true(ms$high_missing[1])
})

test_that("missing_summary errors on non-data.frame", {
  expect_error(missing_summary(1:5), "`data` must be a data frame")
})
