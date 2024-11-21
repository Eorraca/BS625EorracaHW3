test_that("Confidence_OPT calculates confidence intervals for linear model ", {
  data(mtcars)
  modelx <- lm(mpg ~ wt + hp, data = mtcars)
  ci95 <- Confidence_OPT(modelx, level = 0.95)
  expect_lower <- "2.5 %"
  expect_upper <- "97.5 %"
  expect_true(all(colnames(ci95) %in% c(expect_lower, expect_upper)))
})
test_that("Confidence_OPT calculates confidence intervals with different levels", {
  data(mtcars)
  modelx <- lm(mpg ~ wt + hp, data = mtcars)
  ci99 <- Confidence_OPT(modelx, level = 0.99)
expect_lower <- "0.5 %"
expect_upper <- "99.5 %"
expect_true(all(colnames(ci99) %in% c(expect_lower, expect_upper)))
})

test_that("Confidence_OPT works for models with single predictor", {
  data(mtcars)
  modelx_s <- lm(mpg ~ wt, data = mtcars)
  ci_s <- Confidence_OPT(modelx_s, level = 0.95)
  expect_equal(nrow(ci_s), 2)
  expect_true(all(colnames(ci_s) %in% c("2.5 %", "97.5 %")))
})





