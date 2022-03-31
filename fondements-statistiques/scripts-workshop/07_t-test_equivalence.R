set.seed(8923)
library(tidyverse)
library(see)
library(effectsize)
library(report)
library(TOSTER)
theme_set(theme_modern())

# Test inférentiel pour tester l'équivalence de deux moyennes -------------

# Paramètres des donnés simulées ------------------------------------------

# Paramètres du macro-monde (que nous ne connaissons normalement pas !)
moyenne_groupe_A <- 100
ecart_type_groupe_A <- 15

moyenne_groupe_B <- 115
ecart_type_groupe_B <- 15

# Paramètres du micro-monde
n_participants_per_groupe <- 100

sesoi_lower_d = -0.5 # Limite inférieur de la taille de l'effet considéré équivalent
sesoi_upper_d = 0.5 # Limite supérieur de la taille de l'effet considéré équivalent

# Génération données groupe A
data_groupe_A <- tibble(
  groupe = "A",
  mesure = rnorm(n_participants_per_groupe, mean = moyenne_groupe_A, sd = ecart_type_groupe_A)
)

# Génération données groupe B
data_groupe_B <- tibble(
  groupe = "B",
  mesure = rnorm(n_participants_per_groupe, mean = moyenne_groupe_B, sd = ecart_type_groupe_B)
)

# Mettre les deux groupes dans le même jeu de données
data_combined <- bind_rows(data_groupe_A, data_groupe_B)

# Effectuer un test d'équivalence -----------------------------------------

model <- TOSTtwo(
  m1 = mean(data_groupe_A$mesure),
  sd1 = sd(data_groupe_A$mesure),
  m2 = mean(data_groupe_B$mesure),
  sd2 = sd(data_groupe_B$mesure),
  n1 = nrow(data_groupe_A),
  n2 = nrow(data_groupe_B),
  low_eqbound_d = sesoi_lower_d,
  high_eqbound_d = sesoi_upper_d,
  alpha = 0.05,
  var.equal = FALSE,
  plot = TRUE,
  verbose = TRUE
)
