#' Function to compute confidence Intervals for linear regression
#'
#' This function calculates the critical value and calculates a confidence interval based on the level of interest, df, coefficients, and covariance matrix. Returns the upper and lower bounds.
#' confidence interval = coef +/- t_value*standard error
#' @parameter coeff Coefficients pulled from the model
#' @parameter cov_mat the covariance matrix of the model
#' @parameter df degrees of freedom
#' @parameter t_value calculated critical value for the model
#' @parameter standard_err standard error computed from the covariance matrix
#' @parameter lower_b, upper_b Our calculated upper bounds/lower bounds of our confidence interval
#' @examples
#' Confidence_OPT(modelx, level= .95)
#' @export
Confidence_OPT <- function(model,level) {
  #Pull out covariance matrix, degrees of freedom, and coefficients from specified model
  coeff <- coef(model)
  cov_mat <- vcov(model)
  df <- df.residual(model)
  #Calculate critical value (T) and standard errors
  alpha <- 1-level
  lower_p <- alpha/2
  upper_p <- 1-lower_p
  t_value <- qt(upper_p, df=df)
  standard_err <- sqrt(diag(cov_mat))
  #Compute Confidence Interval
  lower_b <-coeff - t_value*standard_err
  upper_b <-coeff + t_value*standard_err
  #Formatting for output
  lower_col<-paste0(lower_p*100," %")
  upper_col<-paste0(upper_p*100," %")
  #Combine results into data frame
  conf_int <- cbind(lower_b, upper_b)
  rownames(conf_int) <- names(coeff)
  colnames(conf_int) <- c(lower_col,upper_col)
  return(conf_int)
}





