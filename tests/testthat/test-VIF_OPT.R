test_that("vif_OPT calculates VIFs for linear model", {
  data(mtcars)
  modelx <- lm(mpg ~ wt + hp + qsec, data = mtcars)
  vif_v <- vif_OPT(modelx)
  expect_type(vif_v, "double")
  expect_equal(length(vif_v), length(coef(modelx)) - 1)
  expect_true(all(names(vif_v) %in% c("wt", "hp", "qsec")))
})

test_that("vif_OPT handles missing values correctly", {
  data_na <- data.frame(
    y = c(1, 2, NA, 4, 5),
    x1 = c(1, 2, 3, NA, 5),
    x2 = c(5, 4, 3, 2, NA)
  )
  model_na <- lm(y ~ x1 + x2, data = data_na)
  vif_na <- vif_OPT(model_na)
  expect_true(all(!is.na(vif_na)))
})

test_that("vif_OPT works with skewed data", {
  data_sk <- data.frame(
    y = rlnorm(100),
    x1 = rlnorm(100),
    x2 = rlnorm(100)
  )
  model_sk <- lm(y ~ x1 + x2, data = data_sk)
  vif_sk <- vif_OPT(model_sk)
  expect_equal(length(vif_sk), 2)
})

















