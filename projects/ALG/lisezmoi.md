***A LA RECHERCHE DU MEDDY DISPARU***

***BUT du projet :***  
*Chercher des meddies (ou quelque chose d'autre)*  
-lentille d'eau salée aux alentours de 1000m

**Methode**  
-focus sur un région proche de la sortie de la mediterranée et
clusteriser en selon deux directions qui correspondent 
à deux profondeurs : 200m et 1200m  
-repérer un cluster qui peut s'apparenter a un classe "meddy"  
-apprentissage avec un petit dataset, puis test avec le dataset  
complet
-puis apprentissage avec le grand dataset pour comparer

**Discussion**  
Ici la méthode du BIC n'est pas bonne, car il faudrait considérer  
seulement des profiles indépendant.  
Les pdf 2D semblent montrer 3 pics dominant, donc interressant  
regarder les clustering avec 4 classe, afin de classer les points  
localiser entre les 3 pics dominants.

**Conclusion**  
-Nous avons reperé la sortie d'eaux méditerranéenes mais difficile
d'en extraire une vraie classe "meddy"  
-Utilisation des profiles de température ou densité à la place ?
Non car moins grand spreading dans la zone de recherche
  
-Nous avons regardé en-dessous de 800m les profiles qui
dépassent MEAN+STD en salinité  

**Ouverture**  
Plutôt que de regarder les profiles qui dépassent une certaine  
valeur, il faudrait regarder par exemple les dérivées en  
salinité de ces profiles, afin de repérer des patterns particuliers.
