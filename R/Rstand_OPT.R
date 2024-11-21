#' Function to calculate standardized residuals
#'
#' This function calculates the standardized residuals by dividing the residuals by the residual standard error multiplied by the square rooot of 1 - our levarage values
#' Standard Residuals = Residuals/(estimated residual standard error*sqrt(1-leverage values)
#' @parameter resid residuals
#' @parameter fitted_v fitted values from model
#' @parameter n number of observations
#' @parameter p number of predictors (includes intercept)
#' @parameter rss resdidual sum of squares
#' @parameter rse residual standard error
#' @parameter lv leverage values
#' @parameter rstand calculated standard residuals
#' @examples
#' Rstand_OPT(modelx)
#' @export
Rstand_OPT <- function(model) {
  # Check if the class of the model is 'lm'
  if (!identical(class(model), "lm")) stop("Input must be linear")

  # Pull out residuals, fitted values, number of observations, and number of predictors
  resid <- residuals(model)
  fitted_v <- fitted(model)
  n <- length(resid)
  p <- length(coef(model))

  # Compute residual sum of squares, residual standard error, leverage values
  rss <- sum(resid^2)
  rse <- sqrt(rss / (n - p))
  lv <- hatvalues(model)

  # Compute Standard residuals
  rstand <- resid / (rse * sqrt(1 - lv))

  return(rstand)
}


