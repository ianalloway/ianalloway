test_that("normalize minmax scales to [0, 1]", {
  v <- normalize(c(10, 20, 30, 40, 50), "minmax")
  expect_equal(min(v), 0)
  expect_equal(max(v), 1)
})

test_that("normalize zscore produces zero mean", {
  v <- normalize(1:100, "zscore")
  expect_lt(abs(mean(v)), 1e-10)
})

test_that("normalize robust uses median/IQR", {
  v <- normalize(c(1, 2, 3, 4, 5), "robust")
  expect_equal(v[3], 0)  # median maps to 0
})

test_that("normalize log applies log(x + offset)", {
  v <- normalize(c(0, 1, 2), "log", offset = 1)
  expect_equal(v, log(c(1, 2, 3)))
})

test_that("normalize works on data frames", {
  df_z <- normalize(mtcars, "zscore")
  expect_s3_class(df_z, "data.frame")
  expect_true(!is.null(attr(df_z, "scale_params")))
})

test_that("normalize stores scale_params attribute", {
  v <- normalize(1:10, "minmax")
  params <- attr(v, "scale_params")
  expect_true(!is.null(params))
  expect_equal(params$vec$min, 1)
  expect_equal(params$vec$max, 10)
})
