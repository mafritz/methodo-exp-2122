set.seed(8923)
library(tidyverse)
library(see)
library(effectsize)
library(report)
theme_set(theme_modern())

# Test inférentiel pour comparer deux groupes indépendants ----------------

# Paramètres des donnés simulées ------------------------------------------

# Paramètres du macro-monde (que nous ne connaissons normalement pas !)
moyenne_groupe_A <- 100
ecart_type_groupe_A <- 15

moyenne_groupe_B <- 115
ecart_type_groupe_B <- 15

# Paramètres du micro-monde
n_participants_per_groupe <- 20

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

# Montrer graphiquement les résultats -------------------------------------

ggplot(data = data_combined, aes(x = groupe, y = mesure, color = groupe)) +
  geom_jitter(alpha = 0.2) +
  stat_summary(
    fun.data = mean_cl_normal,
    geom = "errorbar",
    width = 0.3,
    position = position_dodge(width = 0.1)
  ) +
  stat_summary(
    fun = mean, geom = "point",
    size = 3,
    shape = 15,
    position = position_dodge(width = 0.6)
  ) +
  labs(
    x = "Modalité de la seule VI",
    y = "Mesure", title = "Graphique du test. Barres = CI 95%"
  ) +
  scale_color_flat() +
  theme(legend.position = "none")

# Effectuer un t-test de Welch avec hétérogénité de la variance -----------

model <- t.test(
  formula = mesure ~ groupe,
  data = data_combined,
  alternative = "two.sided",
  paired = FALSE,
  var.equal = FALSE,
  mu = 0
)

# Afficher les résultats "brutes"
print(model)

# Afficher une synthèse textuelle
report(model, verbose = FALSE)
