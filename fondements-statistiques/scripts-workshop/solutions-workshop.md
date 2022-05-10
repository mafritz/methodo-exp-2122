# Solution aux questions dans le workshop

Ce document propose les réponses aux questions proposées dans le README.md du workshop.

## 01 Modélisation de base

**Quelle est la différence entre la moyenne et la médiane ?**\
Il s'agit de deux modélisation de données de type *tendance centrale*, c'est-à-dire qui essaie de représenter un échantillon à travers un indice qui maximise le *groupement* des données. La moyenne est calculé sur la base de la somme des mesures divisée par le nombre :

-   *M*{1, 2, 3, 4, 10} = (1 + 2 + 3 + 4 + 10) / 5 = 4

La médiane dispose chaque mesure en ordre croissant et s'intéresse à l'observation qui se trouve exactement au milieu de la liste, ou entre la moyenne des deux observations qui se trouve au centre si N est multiple de 2 :

-   *Md*{1, 2, 3, 4, 10} = 1, 2, 3, 4, 10 = 3 (i.e. le troisième chiffre a deux chiffre sur la droite et deux sur la gauche)

En général, la moyenne est plus sensible aux valeurs extrêmes comparé à la médiane.

**Plus l'écart type entre données est grance, plus la variance est \_\_\_\_\_\_ ?**\
Grande. La variance est la somme de la différence entre chaque observation et la moyenne de l'échantillon au carré. L'utilisation de la puissance au carré a deux conséquences importantes :

1.  Tous les différences deviennent positives et donc des valeurs supérieurs à la moyenne ne s'annulent pas dans la somme avec des valeurs inférieurs à la moyenne

2.  La puissance au carré donne plus de poids aux valeurs extrêmes : une différence de 2 unités par rapport à la moyenne a un poids de 4 unités de variance, tandis qu'une différence de 3 unités a un poids de 9 unités de variance.

**Quel est le rapport entre la variance et l'écart type ?**\
L'écart type est la racine carrée de la variance. Ceci permet de re-transformer l'écart type dans la même unité de la mesure (e.g. en seconds). Contrairement à la moyenne ou médiane qui sont des mesures de tendance centrale, l'écart type mesure la dispersion des données dans un échantillon : le plus l'écart type est élévé, le plus les données sont *disséminées*/hétérogènes.

## 02 Simulations des données et randomisation

**Si on utilise une attribution totalement aléatoire, les trois groupes/modalités auront toujours le même nombre de participant-es ?**\
Non. Une randomisation totale signifie que chaque groupe/modalité a à chaque tirage exactement les mêmes chances d'être attribué. Par conséquent, nous n'avons aucune garantie que chaque groupe/modalité ait le même nombre d'observations. Pour ce faire, il faut utiliser des mécanismes qui balancent les observations.

**Quelles mesures sont plus similaires/différentes dans les trois groupes ? Est-ce qu'il y a un rapport entre la distribution depuis laquelle les données sont tirées et la similarité des moyennes/écarts types ?**\
C'est difficile à dire depuis les données car elles ne sont pas sur la même échelle. Il faut se méfier des analyses *à l'œil nu.* Il faudrait à la rigueur transformer les données dans une échelle comparable, par exemple en les standardisant (les transformer dans une moyenne de 0 et un écart type de 1). D'un point de vue logique, des données uniformes sont potentiellement plus éloignés car toutes ont la même fréquence potentielle. Les distributions normales et exponentielles, au contraire, présentent des *sommets*, ce qui augmente la probabilité d'avoir des données plus proches.

**Plus grand le nombre de participant-es, plus \_\_\_\_\_\_\_\_\_ les différences entre moyennes et écarts types.**\
Petite. En augmentant les observations on diminue le poids d'éventuels valeurs extrêmes. Par conséquent, les données sont moins exposées à des fluctuations due simplement à l'effet d'échantillonnage.

**Qu'est-ce que vous en concluez sur la possibilité d'avoir des potentiels facteurs indépendants de la VI qui pourraient influencer la VD (pas présente dans ce jeu de données) ?**\
On peut voir par exemple qu'avec les données de base du script, l'âge moyen du groupe B est inférieur de plus de 10 ans des groupes A et C. Si nous avions choisi une VD sensible à l'âge (e.g. vitesse de traitement, expérience préalable dans un domaine, ...) nos résultats pourrait montrer des différences dans les groupes qui est déterminée par les effets de fluctuation de l'âge dans l'échantillon plutôt que à l'intervention.

| groupe |   N | M_age | SD_age | M_fatigue | SD_fatigue |   M_qi | SD_qi |
|:-------|----:|------:|-------:|----------:|-----------:|-------:|------:|
| A      |   9 | 47.27 |  15.46 |      0.66 |       0.53 | 106.29 | 16.93 |
| B      |   9 | 35.52 |  13.04 |      0.71 |       0.46 |  98.16 | 19.17 |
| C      |  12 | 48.99 |  13.00 |      1.32 |       2.03 | 104.21 |  9.09 |

**Imaginez deux phénomènes en relation avec les technologies éducatives dans le MALTT (e.g. compétences techniques, intérêt pour les technologies, ...). Comment pensez-vous que ce phénomène est/serait distribué chez l'ensemble des apprenant-es (passé-es et futures) du MALTT ?**\
C'est la difficulté de raisonner en termes de distribution/mesure des phénomènes. Il faut une connaissance du domaine pour imaginer comment un phénomène peut se distribuer, ou de données pour l'établir empiriquement. On peut soupçonner que les compétences techniques suivent une distribution exponentielle (pas mal sans connaissances techniques, la plupart seulement avec quelques connaissances, et ensuite une diminution progressive jusqu'à ce qui en ont beaucoup).

## 03 Échantillonnage

**Est-ce que les distributions des moyennes et écarts types sont différentes ou similaires en fonction de la distribution *mère* depuis laquelle les échantillons sont tirés ?**\
Elles sont similaires indépendamment de la distribution *mère*, que ce soit pour les moyennes ou les écarts types.

**Est-ce que les distributions obtenues ont des formes reconnaissables ? Si oui, avec quel type de distribution on peut les identifier ?**\
Oui, toutes les distributions s'approchent d'une distribution normale/gaussienne.

**Qu'est-ce que vous pouvez en conclure ?**\
Lorsqu'on a à faire avec des échantillons et non pas des *populations* entières, les échantillons sont normalement distribués. Il faut bien comprendre qu'il s'agit de distribution d'échantillons et non pas de distributions de données. Chaque distribution représente la fréquence des moyennes (ou écarts types) d'échantillons différents. Ce principe s'applique aussi par exemple aux différences entre moyennes dans deux groupes/échantillons. Ce code R simule de tirer deux groupes/échantillons de 100 observations depuis une distribution normale M = 100, SD = 15. Si on ne retient que la différence entre les deux moyennes et on affiche la distribution des 1000 moyennes, on obtient une distribution normale. En d'autres termes, le fait qu'il y a une différence de 0 entre les deux est l'outcome la plus probable/plausible.

    # Simuler la différence entre deux groupes tirés de la même distribution normale
    difference = replicate(1000, {
      groupe1 = rnorm(100, 100, 15)
      groupe2 = rnorm(100, 100, 15)
      groupe2 - groupe1
    })
    plot(density(difference))

## 04 Puissance statistique pour un test *t* de Welch

**Combien de participant-es seraient nécessaire pour détecter un SESOI de Cohen's d = 0.5, avec un erreur de type I de 0.05 et de type II de 0.8 ?**\
64 par groupe, donc 128 au total.

**En gardant type I = 0.05 et type II = 0.8, mais avec SESOI = 0.25, la taille de l'échantillon nécessaire et plus grande ou plus petite ? De ce fait, vous pouvez conclure que plus \_\_\_\_\_\_\_\_ est le SESOI, plus \_\_\_\_\_\_\_\_\_\_ sera l'échantillon nécessaire. Essayez d'expliquer ce phénomène.**\
Plus grand le SESOI, plus petit l'échantillon nécessaire. Ou respectivement plus petit le SESOI, plus grand l'échantillon nécessaire. Cela s'explique par le fait qu'un grand effet, par exemple une grande différence entre deux groupes, est plus évidente et nécessite donc de moins d'observations pour la déceler. Au contraire, une petite différence est plus sensible à du *bruit* et nécessite donc plus d'observations avant de pouvoir détecter le signal.

Avec à nouveau le SESOI = 0.5.

**Augmentez d'abord le type I à 0.15, quelle variation observez vous sur la taille de l'échantillon nécessaire ? Puis diminuez le type I à 0.01, quelle variation observez vous maintenant ?**\
Avec alpha = 0.15, il faut 2x43 participants. Avec alpha 0.01, il faut 2x96 participants.

**Remettez le type I à 0.05 et augmentez le type II à 0.95, quelle variation observez vous sur la taille de l'échantillon nécessaire ? Diminuez maintenant le type II à 0.6, quelle variation observez vous ?**\
Avec 1-beta = 0.95, il faut 2x105 participants. Avec 1-beta = 0.6, il faut 2x41 participants.

**Sur la base de ces changements, la variation de quel type d'erreur influence davantage la taille de l'échantillon ?**\
L'erreur de type II a généralement plus d'impact sur la taille de l'échantillon et cela en dépit du fait qu'on a la tendance plutôt à se focaliser sur l'erreur de type I. Quelle erreur est plus importante dépend néanmoins du domaine/contexte dans lequel on se trouve. Est-il plus grave de penser qu'un effet existe lorsqu'en réalité il n'existe pas ? Ou de rater un effet qui existe en pensant qu'il n'existe pas ?

## 05 Effectuer une comparaison entre deux moyennes/groupes

**Testez plusieurs combinaisons entre paramètres, par exemple en augmentant ou diminuant la différence entre les deux moyennes ou en explicitant des écarts types plus grands/petits ou hétérogènes entre les deux groupes. Modifiez aussi le nombre de participants par groupe. Notez si vous pensez trouver des *pattern* qui se manifestent (e.g. si j'augmente \_\_\_\_ alors \_\_\_\_\_\_).\
**En règle générale vous maximiser la chance de pouvoir détecter un effet, c'est-à-dire une différence *statistiquement* significative entre les deux moyennes, si :

-   La différence entre les deux moyennes est grande

-   L'écart type des deux groupes est petit et similaire pour les deux groupes

-   Vous augmentez le nombre d'observations/participant-es

**Utilisez maintenant les paramètres suivants M1 = 100, SD1 = 15 et M2 = 102, SD2 = 15, ce qui signifie qu'il y a dans le macro-monde une petite différence de 2 points entre les deux moyennes. Utilisez `n_participants_per_groupe = 1000`, donc avec beaucoup de participants pour chaque groupe. Menez le test et observez le résultat. Qu'est-ce que vous pouvez conclure depuis cette simulation ?\
**D'un point de vue mathématique, il est garanti qu'une différence entre deux moyennes à un certain moment devienne *statistiquement* significative, mais cela ne signifie pas qu'elle est *pratiquement* digne de note. Ici nous ne savons pas à quoi correspondent les deux unités de différence entre 100 et 102. Si on parle par exemple d'une intervention qui vise à réduire des problèmes psychologiques dans les étudiant-es, 2 personnes sont une différence importante d'un point de vue pratique. Si on parle de millisecondes pour télécharger un fichier dans une utilisation habituelle, alors cette différence n'a pas vraiment d'impact pratique.
