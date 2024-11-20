#' Function to compute basic residuals of linear regression
#'
#' This function calculates the residuals of a specified linear model by subtracting the fitted value from y
#' Residual = y - fitted_values
#' @parameter y the response variable
#' @parameter fitted_v the fitted values
#' @parameter resid calculated residuals
#' @examples
#' resid_OPT(modelx)
#' @export
resid_OPT <- function(model) {
  # Make sure model is linear
  if (!inherit(model, "lm")) stop("Input must be linear")
  #Pull Y and fitted values
  y <- model$model[[1]]
  fitted_v <- model$fitted.values
  #Calculate residuals
  resid <- y - fitted_v

  return(resid)
}
