# Mini-doc

## Configuration

Installer + migrer la base de données + lancer `rails s`, pas de seed dans le projet.

## Déroulement :

Pour clarification, j'ai lu l'exercice vendredi mais je l'ai fait samedi. J'y ai pensé entre-temps, mais sans coder.

Au bout d'une heure quarante, j'ai interrompu ma tâche en cours pour me concentrer sur les tests. J'ai dû finir en presque deux heures, excluant ce readme et le push sur git.

Mon retour : Avec du recul, je soupçonne de ne pas avoir simplifié assez, imaginant une version plus courte où je ne séparais pas les concepts de "patate" et de "stock". Néanmoins, au début, cette séparation de logique me semblait importante.

Ce que j'aurais aimé faire en plus :
-   Déplacer le formatage du "€" hors du service de calcul.
-   Extraire la logique de "trouver ou créer des stocks" du contrôleur, peut-être avec un query object, mais je ne maîtrise pas bien ce pattern.
-   Mon association polymorphic est maladroite, et c'est la chose que j'ai laissée en suspens après une heure et quarante minutes. Vu l'état actuel, j'aurais au moins pu associer une date à une patate, ce qui aurait grandement amélioré les performances sur mes endpoint, en bonne cohérence en plus avec la notion de "day-trading". Cependant il reste un problème sémantique que je n'ai pas résolu.
-   Déplacer les validations hors de mon contrôleur + une meilleure validation sur le type de stock.
-   Mes tests de Model ne fonctionnent pas ; j'ai choisi de les laisser en commentaire pour respecter le timing.
-   Faire la pagination dans mes requêtes, mais en voulant éviter d'utiliser des gems dans le cadre de l'exercice, j'ai préféré laisser cet aspect.
- Optimiser encore plus la méthode de max_gain en temps de calcul (purement personnel, je me doute que ce n'est pas pertinent dans le cadre de l'exercice)
- avoir un historique de commit

## Requête pour l'Index

La première requête sera plus lente car elle créera dynamiquement les données.

```http://localhost:3000/api/v1/stocks?stock_type=potato&time=1997-12-12``` 

## Requête pour le Gain Maximum

La première requête sera plus lente car elle créera dynamiquement les données.


```http://localhost:3000/api/v1/stocks/max_gain?stock_type=potato&time=1997-12-12```