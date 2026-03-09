test_that("describe.numeric returns correct class and fields", {
  d <- describe(c(1, 2, 3, 4, 5))
  expect_s3_class(d, "statlens_describe")
  expect_equal(d$n, 5L)
  expect_equal(d$n_missing, 0L)
  expect_equal(d$mean, 3)
  expect_equal(d$median, 3)
})

test_that("describe.numeric handles NAs", {
  d <- describe(c(1, NA, 3))
  expect_equal(d$n_missing, 1L)
  expect_equal(d$n_valid, 2L)
})

test_that("describe.data.frame returns correct structure", {
  d <- describe(mtcars)
  expect_s3_class(d, "statlens_describe")
  expect_equal(d$type, "data.frame")
  expect_equal(length(d$columns), ncol(mtcars))
})

test_that("summary.statlens_describe returns a data frame for numeric type", {
  d <- describe(1:10)
  s <- summary(d)
  expect_s3_class(s, "data.frame")
  expect_true("statistic" %in% names(s))
})

test_that("describe.default stops with informative error", {
  expect_error(describe(list(a = 1)), "No describe\\(\\) method")
})
