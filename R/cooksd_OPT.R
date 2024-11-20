#' Function to calculate cooks distance
#'
#' This function calculates cooks distance by dividing the residuals squared by number of parameters(p) multiplied by our MSE; this is multiplied by our leverage values divided by (1 - our leverage values)squared
#' cooks distance = (residuals^2/(p*MSE))*levrage values/(1-leverage values)^2
#' @parameter y response variable
#' @parameter x design matrix
#' @parameter H hat matrix
#' @parameter resid residuals
#' @parameter fitted_v fitted values from model
#' @parameter lvh leverage values of hat matrix
#' @parameter n number of observations
#' @parameter p number of predictors (includes intercept)
#' @parameter MSE mean squared error
#' @parameter cooksd calculated cooks distance
#' @examples
#' cooksd_OPT(modelx)
#' @export
cooksd_OPT <- function(model){
  #Pull out design matrix and response variable
  y <-model$model[[1]]
  x <-model.matrix(model)
  #Calculate residuals, fitted values and leverage values
  resid <-residuals(model)
  fitted_v <- model$fitted.values
  H <- x %*% solve(t(x) %*% x) %*% t(x)
  lvH <- diag(H)
  #Calculate mean squared error (MSE)
  n <-length(y)
  p<-length(coef(model))
  MSE <-sum(resid^2)/ (n-p)
  #Calculate Cook's Distance
  cooksd <- (resid^2/ (p*MSE)) *lvh/((1-lvh)^2)

  return(cooksd)

}
