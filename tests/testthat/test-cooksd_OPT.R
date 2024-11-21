test_that("cooksd_OPT works for linear models", {
  data(mtcars)
  modelx <- lm(mpg ~ wt + hp, data = mtcars)
  cooksd_v <- cooksd_OPT(modelx)
  expect_type(cooksd_v, "double")
  expect_equal(length(cooksd_v), nrow(mtcars))
  expect_false(any(is.nan(cooksd_v)))
  expect_false(any(is.infinite(cooksd_v)))
})

test_that("cooksd_OPT works for models with no predictors", {
  small_data <- data.frame(y = c(3, 4, 5, 6, 7))
  modelx_NP <- lm(y ~ 1, data = small_data)
  cooksd_int <- cooksd_OPT(modelx_NP)
  expect_type(cooksd_int, "double")
  expect_equal(length(cooksd_int), nrow(small_data))
  expect_false(any(is.nan(cooksd_int)))
  expect_false(any(is.infinite(cooksd_int)))
})


test_that("cooksd_OPT handles missing values", {
 data_na <- data.frame(x = c(1, 2, 3, 4), y = c(3, NA, 5, 6))
  modelx_na <- lm(y ~ x, data =data_na)
  cooksd_na <- cooksd_OPT(modelx_na)
  expect_false(any(is.nan(cooksd_na)))
  expect_false(any(is.infinite(cooksd_na)))
})

