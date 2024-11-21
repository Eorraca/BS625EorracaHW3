---
output: github_document
---


# LinearRTools

The package LinearRTools is useful for different measures of analysis when looking at linear regression. This includes confidence intervals, VIF, Residuals, Standardized residuals, and Cook's distance

## Installation

You can install LinearRTools from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("EOrraca/BS625EorracaHW3")
```

## Examples

This is the datset we will be using for our basic examples
```{r setup, include = FALSE}
devtools::load_all(".")
data(mtcars)
modelx <- lm(mpg ~ wt + hp, data = mtcars)
```

```{r example}
library(LinearRTools)
```

Example of Confidence Interval
```{r example 1}
Confidence_OPT(modelx, level=.95)
```

Example of Basic Residuals
```{r example 2}
resid_OPT(modelx)
```

Example of Standardized Residuals
```{r example 3}
Rstand_OPT(modelx)
```


Example of Cook's Distance
```{r example 4}
cooksd_OPT(modelx)
```

Example of VIF
```{r example 5}
vif_OPT(modelx)
```

For more information about each function, visit the vignette folder
