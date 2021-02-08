# csi2532_playground
csi2532 playground
Firas Jribi 300084463

## lab003

Pour chaque situation voici un diagramme ER qui le décrit (en supposant qu'aucune autre contrainte).

Les professeurs peuvent enseigner le même cours sur plusieurs semestres et seule la plus récente doit être enregistrée.

ER #1
![ER #1](assets/3/1.png)

Chaque professeur doit enseigner un cours.

ER #2
![ER #2](assets/3/2.png)

Chaque professeur enseigne exactement un cours (ni plus, ni moins).

ER #3
![ER #3](assets/3/3.png)

Chaque professeur enseigne exactement un cours (ni plus, ni moins), et chaque cours doit être enseigné par un professeur.

ER #4
![ER #4](assets/3/4.png)

Les professeurs peuvent enseigner le même cours sur plusieurs semestres et chaque doit être enregistrée.

ER #5
![ER #5](assets/3/5.png)

Supposons maintenant que certains cours puissent être enseignés conjointement par une équipe de professeurs, mais il est possible qu'aucun professeur dans une équipe ne puisse enseigner le cours. Modélisez cette situation en introduisant des ensembles d'entités et des ensembles de relations supplémentaires si nécessaire.

ER #6
![ER #6](assets/3/6.png)

## lab002

```bash
# psql -c "DROP DATABASE university"
psql -c "CREATE DATABASE university"
psql university -f ./db/schema.sql
psql university -f ./db/seed.sql
psql university -f ./db/test.sql
```
