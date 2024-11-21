test_that("Rstand_OPT has error for non-lm models", {
  data(mtcars)
  modelx <- lm(mpg ~ wt + hp, data = mtcars)
  gmodelx <- glm(mpg ~ wt + hp, data = mtcars)
  logit_model <- glm(vs ~ wt + hp, data = mtcars, family = "binomial")
  expect_error(Rstand_OPT(gmodelx), "Input must be linear")
  expect_error(Rstand_OPT(logit_model), "Input must be linear")
})


test_that("Rstand_OPT computes correct standardized residuals", {
  data(mtcars)
  modelx <- lm(mpg ~ wt + hp, data = mtcars)
  rstand_norm <- rstandard(modelx)
  rstand <- Rstand_OPT(modelx)
  expect_equal(rstand,rstand_norm,tolerance=1e-6)
})


test_that("Rstand_OPT works for models with no predictors", {
  small_data <- data.frame(y = c(3, 4, 5, 6, 7))
  modelx_no_predictors <- lm(y ~ 1,data = small_data)
  rstand_int <- Rstand_OPT(modelx_no_predictors)
  expect_type(rstand_int,"double")
  expect_equal(length(rstand_int),nrow(small_data))
  expect_false(any(is.nan(rstand_int)))
  expect_false(any(is.infinite(rstand_int)))
})

