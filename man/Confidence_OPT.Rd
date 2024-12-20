% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Confidence_OPT.R
\name{Confidence_OPT}
\alias{Confidence_OPT}
\title{Function to compute confidence Intervals for linear regression}
\usage{
Confidence_OPT(model, level)
}
\description{
This function calculates the critical value and calculates a confidence interval based on the level of interest, df, coefficients, and covariance matrix. Returns the upper and lower bounds.
confidence interval = coef +/- t_value*standard error
}
\examples{
Confidence_OPT(modelx, level= .95)
}
