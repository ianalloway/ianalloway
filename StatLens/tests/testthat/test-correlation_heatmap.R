test_that("correlation_heatmap returns invisible matrix", {
  cm <- correlation_heatmap(mtcars, plot = FALSE)
  expect_true(is.matrix(cm))
  expect_equal(nrow(cm), ncol(mtcars))
  expect_equal(ncol(cm), ncol(mtcars))
})

test_that("correlation_heatmap diagonal is 1", {
  cm <- correlation_heatmap(mtcars, plot = FALSE)
  expect_true(all(diag(cm) == 1))
})

test_that("correlation_heatmap supports spearman method", {
  cm <- correlation_heatmap(mtcars, method = "spearman", plot = FALSE)
  expect_true(is.matrix(cm))
})

test_that("correlation_heatmap errors with fewer than 2 numeric cols", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  expect_error(correlation_heatmap(df, plot = FALSE),
               "At least two numeric columns")
})
