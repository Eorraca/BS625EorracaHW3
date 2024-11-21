#' Function to calculate VIF (Variance Inflation Factor)
#'
#' This function calculates the vif by dividing 1 by 1- R-squared value for ith predictor
#' cooks distance = 1/(1-R^2)
#' @parameter X design matrix w/o intercept column
#' @parameter vif_v vector to store VIFs
#' @parameter X_out all predictors but ith one
#' @parameter fit regression of Xi on all other predictors
#' @parameter r2 r-squared
#' @parameter vif_v[i] vif for ith predictor
#' @examples
#' vif_opt(modelx)
#' @export

vif_OPT <- function(model) {
  # Pull design matrix w/o intercept
  X <- model.matrix(model)[,-1, drop = FALSE]

  # Create vector to store VIF values
  vif_v <- numeric(ncol(X))

  #Calculate VIF for ith predictor by fitting linear model of ith predictor against all others for our r^2
  for (i in 1:ncol(X)) {
    X_out <- X[, -i,drop = FALSE]
    fit <- lm(X[, i] ~ X_out)
    r2 <- summary(fit)$r.squared
    vif_v[i] <- 1/(1-r2)
  }
  names(vif_v) <- colnames(X)

  return(vif_v)
}

