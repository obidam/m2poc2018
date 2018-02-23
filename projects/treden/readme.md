## Apprentissage supervisé: détection de tempêtes.

#Dataset 
On a récupéré les données de pression atmosphériques nord-atlantique, depuis 1949. (0.5deg, 6h)

Tout d'abord, pour détecter les tempêtes, l'idée est de détecter les zones de très basses pression. Par confort, la moyenne temporelle a été soustraite à chaque point de grille. La déviation ainsi obtenue est comprise entre -60 et 10 mbar.

On commence par construire une base d'apprentissage qui servira pour l'entraînement et le test.
La moitié est constituée de vignettes positive (ou il y a une tempête), et l'autre moitié de vignettes négatives (sans tempête) générée aléatoirement. Un vecteur flag contiendra ainsi respectivement les valeurs 1 et 0.
Dans notre cas, la matrice de vignettes sera consitutée de 501 échantillons, pour des vignettes 12*12 contenant donc 144 variables.
Le nombre d'échantillons d'apprnetissage est sous-dimensionné, il faudrait au moins avoir autant de vignettes que de variables.

#Apprentissage
On utilise une méthode de forêt d'arbres de décisions, pour effectuer l'apprentissage sur notre jeu de donnée.
Ensuite, après test:
Mean accuracy score : 0.94
Confusion Maxtrix : 
 [10  0]
 [ 0  7]

Mais ce résultat est biaisé par mon manque d'échantillons d'apprentissage ! 

#Test en situation réelle 

Un système de fenêtre glissante est mis en place, pour extraire toutes les vignettes 12*12 à une date donnée.
Ensuite on soumet une matrice contenant ces vignettes à la fonction de prédiction.
La fonction de prédiction nous renvoie ensuite matrice contenant un flag à 1 pour chaque vignette qu'il a détécté comme contenant une tempête.
 
On a testé sur les données du 23 janv 90, où l'on sait qu'il y a eu une tempête, et le modèle nous a retoruné des vignettes où une structure dépressionnaire nette était observée.  
