LinearRTools

The package LinearRTools is  useful for different measures of analysis when looking at linear regression. This includes confidence intervals, VIF, Residuals, Standardized residuals, and Cook's distance 

Installation
You can install LinearRTools from GitHub with:

# install.packages("devtools")
devtools::install_github("EOrraca/BS625EorracaHW3")

Examples
These are basic examples which show you how to use each function:

library(LinearRTools)
Examples will use the following dataset and model
data(mtcars)
modelx <- lm(mpg ~ wt + hp, data = mtcars)
Example of Confidence Interval
Confidence_OPT(modelx, level =.95)
#>                2.5 %      97.5 %
#(Intercept) 33.95738245 40.49715778
#wt          -5.17191604 -2.58374544
#hp          -0.05024078 -0.01330512

Example of Residual Calculation
resid_OPT(modelx)
#>      Mazda RX4       Mazda RX4 Wag          Datsun 710      Hornet 4 Drive   Hornet Sportabout             Valiant 
      -2.57232940         -1.58348256         -2.47581872          0.13497989          0.37273336         -2.37381631 
         Duster 360           Merc 240D            Merc 230            Merc 280           Merc 280C          Merc 450SE 
        -1.29904236          1.51293266          0.80632669         -0.77945988         -2.17945988          0.67463146 
         Merc 450SL         Merc 450SLC  Cadillac Fleetwood Lincoln Continental   Chrysler Imperial            Fiat 128 
         0.25616901         -1.64993945          0.04479541          1.03726743          5.50751301          5.80097202 
        Honda Civic      Toyota Corolla       Toyota Corona    Dodge Challenger         AMC Javelin          Camaro Z28 
         1.08761978          5.85379085         -3.08644148         -3.31136386         -3.94097947         -1.25202805 
   Pontiac Firebird           Fiat X1-9       Porsche 914-2        Lotus Europa      Ford Pantera L        Ferrari Dino 
         2.44325481         -0.32665313         -0.03737415          2.63023081         -0.74648866         -1.22541324 
      Maserati Bora          Volvo 142E 
         2.26052287         -1.58364943
Example of Standardized residuals
Rstand_OPT(modelx)
#>          Mazda RX4       Mazda RX4 Wag          Datsun 710      Hornet 4 Drive   Hornet Sportabout             Valiant 
#        -1.01458647         -0.62332752         -0.98475880          0.05332850          0.14644776         -0.94769800 
#         Duster 360           Merc 240D            Merc 230            Merc 280           Merc 280C          Merc 450SE 
#        -0.53305899          0.62035108          0.32068555         -0.30786160         -0.86081660          0.26776519 
#         Merc 450SL         Merc 450SLC  Cadillac Fleetwood Lincoln Continental   Chrysler Imperial            Fiat 128 
#         0.10087865         -0.65019507          0.01914207          0.44970228          2.35451716          2.33192251 
#        Honda Civic      Toyota Corolla       Toyota Corona    Dodge Challenger         AMC Javelin          Camaro Z28 
#         0.44781172          2.37861784         -1.22297829         -1.30026858         -1.54564189         -0.50973308 
#   Pontiac Firebird           Fiat X1-9       Porsche 914-2        Lotus Europa      Ford Pantera L        Ferrari Dino 
#         0.96380569         -0.13220037         -0.01494999          1.10241512         -0.32270884         -0.48919397 
#      Maserati Bora          Volvo 142E 
#         1.11989090         -0.62369214 

Example of Cook's Distance
cooksd_OPT(modelx)
#>          Mazda RX4       Mazda RX4 Wag          Datsun 710      Hornet 4 Drive   Hornet Sportabout             Valiant 
#       1.589652e-02        5.464779e-03        2.070651e-02        4.724822e-05        2.736184e-04        2.155064e-02 
#         Duster 360           Merc 240D            Merc 230            Merc 280           Merc 280C          Merc 450SE 
#       1.255218e-02        1.677650e-02        2.188702e-03        1.554996e-03        1.215737e-02        1.423008e-03 
#         Merc 450SL         Merc 450SLC  Cadillac Fleetwood Lincoln Continental   Chrysler Imperial            Fiat 128 
#       1.458960e-04        6.266049e-03        2.786686e-05        1.780910e-02        4.236109e-01        1.574263e-01 
#        Honda Civic      Toyota Corolla       Toyota Corona    Dodge Challenger         AMC Javelin          Camaro Z28 
#       9.371446e-03        2.083933e-01        2.791982e-02        2.087419e-02        2.751510e-02        9.943527e-03 
#   Pontiac Firebird           Fiat X1-9       Porsche 914-2        Lotus Europa      Ford Pantera L        Ferrari Dino 
#       1.443199e-02        5.920440e-04        5.674986e-06        7.353985e-02        8.919701e-03        5.732672e-03 
#      Maserati Bora          Volvo 142E 
#       2.720397e-01        5.600804e-03

Example of VIF
vif_OPT(modelx)
#>      wt       hp 
#1.766625 1.766625 

Explanation can be found in vignettes/ tab on Github
