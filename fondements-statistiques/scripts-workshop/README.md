# Workshop fondements statistiques

Ce document est accompagné par des fichiers/scripts en R qui permettent de découvrir et comprendre le fonctionnement des statistiques *fréquentistes*. Les fichiers sont numérotés de manière progressive et contient du code à exécuter/adapter en fonction des consignes illustrées dans ce document.

## Préparation et informations utiles

### Logiciels nécessaires

Pour exécuter le code les logiciels suivants sont nécessaires :

-   [R](https://www.r-project.org/) version 4.0.0 ou supérieur

-   [RStudio desktop](https://www.rstudio.com/products/rstudio/) version RStudio 2021.09.0 ou supérieur. En alternative, un compte [RStudio cloud](https://rstudio.cloud). Pour plus d'informations sur RStudio, voir [la page EduTechWiki homonyme](https://edutechwiki.unige.ch/fr/RStudio).

Il existe également un parcours sur EduTechWiki qui permet de découvrir R/RStudio dans une perspective Open Science : [pensée computationnelle avec R](https://edutechwiki.unige.ch/fr/Pens%C3%A9e_computationnelle_avec_R).

### Setup du workshop

Pour utiliser les fichiers, téléchargez ou clonez l'ensemble de ce dépôt GitHub qui est en soi un projet de RStudio. Ensuite, dans RStudio :

1.  Choisissez la commande du menu principal `File > Open Project...`

2.  Cherchez le dossier qui contient les fichiers du dépôt

3.  Ouvrez le fichier qui s'appelle `methodo-exp-2122.Rproj`

4.  Le projet va s'ouvrir en RStudio

5.  Ouvrez le dossier `fondements-statistiques/scripts-workshop/` dans le gestionnaire des fichiers de l'interface

6.  Ouvrez au fur et à mesure les fichiers correspondants aux activités

### Commandes fréquentes

Pour exécuter le code des scripts, la manière la plus rapide est d'utiliser les raccourcis de clavier :

-   `Ctrl + Enter` (Win) ou `Cmd + Enter` (Mac) pour exécuter un bout de code (e.g. une ligne) à la fois.

-   `Ctrl + Shift + Enter` (Win) ou `Cmd + Shift + Enter` (Mac) pour exécuter l'ensemble du code d'un fichier script

Les résultats des exécutions vont s'afficher :

-   Dans la **console** en bas de l'interface RStudio (avec configuration standard de RStudio) pour les résultats des tests statistiques et autres informations textuelles

-   Dans l'onglet **Plots** dans le côté inférieur à droite de l'interface (avec configuration standard de RStudio)

### Présence d'un *seed* dans le code des fichiers

Dans les scripts du workshop il a été inséré ce qu'on appelle un *seed* avec un code similaire à :

`set.seed(8923)`

Ce code permet d'obtenir toujours les mêmes résultats a des tests statistiques, car les ordinateurs utilisent des tables de chiffres pseudo-aléatoires pour simuler des données stochastiques/randomisées. Si vous voulez obtenir des résultats différents en essayant plusieurs fois le même scripts, vous pouvez commenter la ligne du *seed* avec un \# au début de la ligne :

`# set.seed(8923)`

## Installation paquets R

Le fichier `00_installation.R` contient une ligne de code qui permet d'installer les paquets externes de R utilisés dans les scripts. Vous pouvez l'exécuter avec les commandes illustrées plus haut, ou la copier/coller dans la console. L'installation des paquets peut prendre quelques temps.

## Modélisation de base

Le fichier `01_basic-models.R` contient des fonctions qui permettent de créer des modélisation de bases comme la moyenne, la médiane, la variance et l'écart type, ainsi que des graphiques pour voir la distribution de données.

1.  Dans la première partie du code, dans la section **Données**, vous avez 5 vecteurs/jeu de données sous la forme `jeu_de_donnes <- c(1, 2, 3, 4, 5, ...)`. Le dernier de ces vecteurs/jeux des données s'appelle `your_data`. Modifiez le contenu du vecteur en ajoutant quelques chiffres de votre choix. Laissez les autres vecteurs/jeux de données intactes.

2.  Parcourrez les différentes sections du script et exécuter le code de manière progressive. À travers l'exécution du code, essayez de répondre aux questions suivantes :

    -   Quelle est la différence entre la moyenne et la médiane ?

    -   Plus l'écart entre données est grand, plus la variance est \_\_\_\_\_\_\_\_ ?

    -   Quel est le rapport entre la variance et l'écart type ?

## Simulations des données et randomisation

Le fichier `02_simulations-donnees-et-randomisation.R` a trois objectifs connectés :

-   Introduire le concept de distributions de données

-   Simuler des données tirées distributions différentes

-   Appliquer la randomisation à des données tirées de distributions différentes

Le code de cette activité prévoit :

1.  Dans la première partie du code, quatre bouts de code qui permettent de générer des données de quatre manières différentes. Les données sont ensuite représentées graphiquement pour donner une idée de la distribution des données. Modifiez les différents paramètres des fonctions et contrôlez ensuite l'effet sur les distributions dans les graphiques. Les paramètres sont assez intuitifs et les commentaires devraient aider à comprendre les différentes fonctions/distributions.

2.  Dans la deuxième partie, des données simulées depuis les fonctions/distributions illustrées plus haut sont créées dans un jeu de données avec les caractéristiques suivantes :

    -   Participant : un identifiant unique de chaque participant

    -   Groupe : l'attribution aléatoire à une hypothétique VI avec trois modalités A, B et C

    -   Age : avec un chiffre représentant les années (avec décimaux) du participant

    -   Fatigue : un indicateur auto-reporté de fatigue avant d'entamer ue tâche mesuré à travers un hypothétique *slider* allant de pas du tout fatigué-e à extrêmement fatigué-e

    -   QI : une mesure psychométrique de l'intelligence selon un test de type performance

3.  Le jeu de données est stratifié par le groupe/VI et les mesures sont agrégés avec des indicateurs comme le nombre de participant-es, les moyennes et écarts types de chaque mesure. D'abord avec le nombre de participant-es proposé et puis en variant ce nombre, essayez de répondre aux questions suivantes :

    -   Si on utilise une attribution totalement aléatoire, les trois groupes/modalités auront toujours le même nombre de participant-es ?

    -   Quelles mesures sont plus similaires/différentes dans les trois groupes ? Est-ce qu'il y a un rapport entre la distribution depuis laquelle les données sont tirées et la similarité des moyennes/écarts types ?

    -   Plus grand le nombre de participant-es, plus \_\_\_\_\_\_\_\_\_ les différences entre moyennes et écarts types.

    -   Qu'est-ce que vous en concluez sur la possibilité d'avoir des potentiels facteurs indépendants de la VI qui pourraient influencer la VD (pas présente dans ce jeu de données) ?

    -   Imaginez deux phénomènes en relation avec les technologies éducatives dans le MALTT (e.g. compétences techniques, intérêt pour les technologies, ...). Comment pensez-vous que ce phénomène est/serait distribué chez l'ensemble des apprenant-es (passé-es et futures) du MALTT ?

## Échantillonnage

Le fichier `03_echantillonnage.R` introduit le concept d'échantillon, c'est-à-dire un sous-groupe de l'espace/population de référence. L'objectif de l'activité est double :

-   Introduire la différence entre la distribution des données tirées d'un seul échantillon et la distribution de plusieurs échantillon par rapport à une caractéristique comme la moyenne ou l'écart type

-   Montrez de manière simulé/empirique le théorème de la limite centrale

Le code du script est organisé en trois parties similaires :

1.  Échantillonnage depuis une distribution normale. Au lieu de simuler un seul jeu de données/échantillon, la simulation est répétée 1'000 fois pour générer 1'000 échantillons depuis une distribution normale avec des caractéristiques à paramétrer dans le script. Pour chaque échantillon généré, le script calcule la moyenne et l'écart type de l'échantillon et le stocke dans un jeu de données. Ce jeu de données contient donc 1'000 observations, chacune représentative d'un échantillon. La distribution de ces moyennes et écarts types sont ensuite représentés graphiquement.

2.  Le même mécanisme du point précédent est répliqué dans l'échantillonnage depuis une distribution uniforme.

3.  Le même mécanisme est répliqué encore une fois depuis une distribution exponentielle.

Sur la base de cette explication et en comparant les distributions des moyennes et écarts types obtenues :

-   Est-ce que les distributions des moyennes et écarts types sont différentes ou similaires en fonction de la distribution *mère* depuis laquelle les échantillons sont tirés ?

-   Est-ce que les distributions obtenues ont des formes reconnaissables ? Si oui, avec quel type de distribution on peut les identifier ?

-   Qu'est-ce que vous pouvez en conclure ?

## Puissance statistique pour un test *t* de Welch

Le fichier `04_t-test_power.R` permet de s'exercer au concept de puissance statistique dans le contexte de la comparaison entre deux groupes/moyennes. La puissance statistique est une fonction déterminée par 4 éléments :

-   Le seuil de l'erreur de type I : le risque de *voir* dans le micro-monde un effet qui n'existe pas dans le macro-monde
-   Le seuil de l'erreur de type II : le risque de *rater* dans le micro-monde un effet qui existe dans le macro-monde
-   Le *Smallest Effect Size Of Interest* (SESOI) : la taille de l'effet minimal qui est considérée intéressante à chercher/déceler
-   La taille de l'échantillon : nombre d'entités/observations/participants dans le micro-monde

Lorsqu'on connait 3 de ces 4 éléments, on peut dériver le 4ème mathématiquement. On utilise cette fonction pour justifier/déterminer la taille de l'échantillon dans le test.

En modifiant les trois premiers paramètres dans le script en question, répondez aux questions suivantes :

-   Combien de participant-es seraient nécessaire pour détecter un SESOI de Cohen's d = 0.5, avec un erreur de type I de 0.05 et de type II de 0.8 ?

-   En gardant type I = 0.05 et type II = 0.8, mais avec SESOI = 0.25, la taille de l'échantillon nécessaire et plus grande ou plus petite ? De ce fait, vous pouvez conclure que plus \_\_\_\_\_\_\_\_ est le SESOI, plus \_\_\_\_\_\_\_\_\_\_ sera l'échantillon nécessaire. Essayez d'expliquer ce phénomène.

-   Mettez à nouveau le SESOI = 0.5, ensuite :

    -   Augmentez d'abord le type I à 0.15, quelle variation observez vous sur la taille de l'échantillon nécessaire ? Puis diminuez le type I à 0.01, quelle variation observez vous maintenant ?

    -   Remettez le type I à 0.05 et augmentez le type II à 0.95, quelle variation observez vous sur la taille de l'échantillon nécessaire ? Diminuez maintenant le type II à 0.6, quelle variation observez vous ?

    -   Sur la base de ces changements, la variation de quel type d'erreur influence davantage la taille de l'échantillon ?

## Effectuer une comparaison entre deux groupes/moyennes

Le fichier `05_t-test_single.R` permet de simuler des tests pour comparer deux moyennes/groupes à la recherche d'un effet, ici dans une perspective inter-sujets (i.e. à groupes indépendants). Le script permet de faire principalement 4 choses :

1.  Essayer différents paramètres pour le macro-monde des deux groupes (moyennes et écarts types). C'est un mécansime de rétro-ingégnierie, car normalement ces paramètres sont ceux qu'on ne connait pas et qu'on veut justement estimer sur la base de l'expérience.

2.  Montrer graphiquement la dispersion/distribution des données autour de la moyenne du groupe et des intervalles de confiance

3.  Effectuer un test t de Welch et afficher le résultats avec les différents indicateurs (degrés de liberté, résultat du test statistique, p-valuer, taille de l'effet brute et standardisée)

4.  Affichez la p-valeur en fonction de la distribution nulle pour une seuil de l'erreur de type I de 0.05 bilatéral

En adaptant les paramètres moyennes et écarts types des deux macro-mondes, ainsi que le nombre d'observations par groupe, essayez de tester/comprendre les scénarios suivants :

-   Testez plusieurs combinaisons entre paramètres, par exemple en augmentant ou diminuant la différence entre les deux moyennes ou en explicitant des écarts types plus grands/petits ou hétérogènes entre les deux groupes. Modifiez aussi le nombre de participants par groupe. Notez si vous pensez trouver des *pattern* qui se manifestent (e.g. si j'augmente \_\_\_\_ alors \_\_\_\_\_\_).

-   Utilisez maintenant les paramètres suivants M1 = 100, SD1 = 15 et M2 = 102, SD2 = 15, ce qui signifie qu'il y a dans le macro-monde une petite différence de 2 points entre les deux moyennes. Utilisez `n_participants_per_groupe = 1000`, donc avec beaucoup de participants pour chaque groupe. Menez le test et observez le résultat. Qu'est-ce que vous observez ?
