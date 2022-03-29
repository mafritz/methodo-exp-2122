set.seed(8923)
library(tidyverse)
library(see)
theme_set(theme_modern())


# Simulation de données ---------------------------------------------------

# La simulation des données est une bonne manière pour comprendre les statistiques


# Chiffres entières au hasard ---------------------------------------------

random_integer <- sample(x = 1:10, size = 1000, replace = TRUE)
qplot(random_integer)


# Chiffres décimales depuis une distribution uniforme ---------------------

random_uniform <- runif(n = 1000, min = 1, max = 10)
qplot(random_uniform)


# Chiffres décimales depuis une distribution normale (cloche) -------------

random_normal <- rnorm(n = 1000, mean = 100, sd = 10)
qplot(random_normal)


# Chiffres décimales depuis une distribution exponéntielle ----------------

random_exponential <- rexp(n = 1000, rate = 1)
qplot(random_exponential)

