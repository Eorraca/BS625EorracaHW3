test_that("resid_OPT correctly calculates residuals", {
  data(mtcars)
  modelx <- lm(mpg ~ wt + hp, data = mtcars)
  resid_values <- resid_OPT(modelx)
  expect_resid <- residuals(modelx)
  expect_equal(resid_values, expect_resid)
})

test_that("resid_OPT returns residuals with correct length", {
  data(mtcars)
  modelx <- lm(mpg ~ wt + hp, data = mtcars)
  resid_values <- resid_OPT(modelx)
  expect_equal(length(resid_values), nrow(mtcars))
})

test_that("resid_OPT works for linear model with single predictor", {
  data(mtcars)
  modelx_s <- lm(mpg ~ wt, data = mtcars)
  resid_s <- resid_OPT(modelx_s)
  y_s <- modelx_s$model[[1]]
  fitted_vs <- modelx_s$fitted.values
  expect_resid_s <- y_s - fitted_vs
  expect_equal(resid_s, expect_resid_s)
})


