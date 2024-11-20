#' Function to calculate VIF (Variance Inflation Factor)
#'
#' This function calculates the vif by dividing 1 by 1- R-squared value for ith predictor
#' cooks distance = 1/(1-R^2)
#' @parameter x design matrix w/o intercept column
#' @parameter n number of observations
#' @parameter p number of predictors
#' @parameter vif_v vector to store VIFs
#' @parameter x_out all predictors but ith one
#' @parameter fit regression of Xi on all other predictors
#' @parameter r2 r-squared
#' @parameter vif_v[i] vif for ith predictor
#' @examples
#' vif_opt(modelx)
#' @export

vif_OPT <- function(model){
  #Pull out design matrix w/o intercept column, response variable, number of observations and number of predictors
  x <- model.matrix(model)[,-1]
  n <- nrow(x)
  p <- ncol(x)
  # Assign vector to hold VIFs
  vif_v <- numeric(p)
  #Calculate VIF for ith predictor
  for (i in 1:p){
    x_out <- X[,-i]
    fit <- lm(x[,-i] ~x_out)
    r2 <- summary(fit)$r.squared
    vif_v[i] <- 1/(1-r2)
  }
    names(vif_v) <-colnames(x)
    return(vif_v)
  }
