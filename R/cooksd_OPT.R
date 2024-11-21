#' Function to calculate cooks distance
#'
#' This function calculates cooks distance by dividing the residuals squared by number of parameters(p) multiplied by our MSE; this is multiplied by our leverage values divided by (1 - our leverage values)squared
#' cooks distance = (residuals^2/(p*MSE))*levrage values/(1-leverage values)^2
#' @parameter resid residuals
#' @parameter lvh leverage values
#' @parameter n number of observations
#' @parameter p number of predictors (includes intercept)
#' @parameter MSE mean squared error
#' @parameter cooksd calculated cooks distance
#' @examples
#' cooksd_OPT(modelx)
#' @export
cooksd_OPT <- function(model) {
  # Pull residuals and leverage values from the model
  resid <- residuals(model)
  lvH <- hatvalues(model)

  # Calculate Mean squared error (MSE)
  n <- length(resid)
  p <- length(coef(model))
  MSE <- sum(resid^2) / (n - p)

  # Calculate Cook's Distance
  cooksd <- (resid^2 / (p * MSE)) * lvH / ((1 - lvH)^2)

  return(cooksd)
}


