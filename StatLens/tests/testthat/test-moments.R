test_that("skewness returns near-zero for symmetric data", {
  set.seed(1)
  expect_lt(abs(skewness(rnorm(10000))), 0.1)
})

test_that("skewness returns positive for right-skewed data", {
  expect_gt(skewness(rexp(1000)), 0)
})

test_that("skewness returns NA for fewer than 3 observations", {
  expect_true(is.na(skewness(c(1, 2))))
})

test_that("kurtosis returns near-zero for normal data", {
  set.seed(2)
  expect_lt(abs(kurtosis(rnorm(10000))), 0.2)
})

test_that("kurtosis returns positive for heavy-tailed distributions", {
  set.seed(3)
  expect_gt(kurtosis(rt(5000, df = 4)), 0)
})
