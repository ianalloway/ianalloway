test_that("profile_data returns a DataProfile S4 object", {
  dp <- profile_data(mtcars, name = "Test")
  expect_s4_class(dp, "DataProfile")
})

test_that("profile_data stores correct dimensions", {
  dp <- profile_data(iris)
  expect_equal(dp@nrow, nrow(iris))
  expect_equal(dp@ncol, ncol(iris))
})

test_that("profile_data captures data_name", {
  dp <- profile_data(mtcars, name = "Motor Cars")
  expect_equal(dp@data_name, "Motor Cars")
})

test_that("profile_data stats data frame has expected columns", {
  dp <- profile_data(mtcars)
  expected_cols <- c("column", "mean", "sd", "median", "n_missing")
  expect_true(all(expected_cols %in% names(dp@stats)))
})

test_that("profile_data errors on non-data.frame", {
  expect_error(profile_data(1:5), "`data` must be a data frame")
})
