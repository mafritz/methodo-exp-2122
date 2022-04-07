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
