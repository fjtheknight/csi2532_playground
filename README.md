# csi2532_playground
csi2532 playground
Firas Jribi 300084463


## lab008

creer table de clients
```sql
CREATE TABLE clients (
  name text,
  token text DEFAULT md5(random()::text),
  data jsonb,
  PRIMARY KEY(name)
);
```

seed de clients
```sql
INSERT INTO clients(name, token) 
	VALUES 
		('Big Co.', 'd7d85f7eac7360d725b44d327445473e'), 
		('Small Co.', '9f8983a8494c8a003e064374ffb77cb6');
```


test api avec curl

![lab8 #1](assets/8/1.png)


test localhost

![lab8 #2](assets/8/2.png)

## lab006

1) 
```sql
SELECT name, dateofbirth FROM artists;
```

![R #1](assets/6/1.png)

2) 
```sql
SELECT title, price FROM artworks WHERE year > 1600;
```

![R #2](assets/6/2.png)

3) 
```sql
SELECT title, type FROM artworks WHERE year = 2000 OR artist_name = 'Picasso';
```

![R #3](assets/6/3.png)

4) 
```sql
SELECT name, birthplace FROM artists 
WHERE EXTRACT(YEAR FROM dateofbirth) > 1880 
and EXTRACT(YEAR FROM dateofbirth) < 1930 ;
```

![R #4](assets/6/4.png)

5) 
```sql
SELECT name, country FROM artists 
WHERE style in ('Modern', 'Baroque', 'Renaissance');
```

![R #5](assets/6/5.png)

6) 
```sql
SELECT * FROM artworks ORDER BY title;
```

![R #6](assets/6/6.png)

7) 
```sql
SELECT name, id
FROM customers
JOIN likeartists ON customers.ID = likeartists.customer_id
where artist_name = 'Picasso';
```

![R #7](assets/6/7.png)

8) 
```sql
SELECT name
FROM customers
JOIN likeartists ON customers.ID = likeartists.customer_id
WHERE artist_name in (
  SELECT name 
  FROM artists JOIN artworks on artists.name = artworks.artist_name
  WHERE style = 'Renaissance' AND price > 30000
);
```

![R #8](assets/6/8.png)


## lab005

Les migrations ont ete ajoutees a db/migrations

## lab004

### Une base de données universitaire

Une base de données universitaire contient des informations sur les professeurs
(identifié par le numéro de sécurité sociale ou SSN) et les cours
(identifié par courseid). Les professeurs donnent des cours; chacun de
les situations suivantes concernent l'ensemble de relation `teaches`.

#### Diagramme ER

Pour chaque situation voici un diagramme ER qui le décrit
(en supposant qu'aucune autre contrainte).

1) Les professeurs peuvent enseigner le même cours sur plusieurs semestres et seule la plus récente doit être enregistrée.

![ER #1](assets/4/1.png)

2) Chaque professeur doit enseigner un cours.

![ER #2](assets/4/2.png)

3) Chaque professeur enseigne exactement un cours (ni plus, ni moins).

![ER #3](assets/4/3.png)

4) Chaque professeur enseigne exactement un cours (ni plus, ni moins), et chaque cours doit être enseigné par un professeur.

![ER #4](assets/4/4.png)

5) Les professeurs peuvent enseigner le même cours sur plusieurs semestres et chaque doit être enregistrée.

![ER #5](assets/4/5.png)

6) Supposons maintenant que certains cours puissent être enseignés conjointement par une équipe de professeurs, mais il est possible qu'aucun professeur dans une équipe ne puisse enseigner le cours. Modélisez cette situation en introduisant des ensembles d'entités et des ensembles de relations supplémentaires si nécessaire.

![ER #6](assets/4/6.png)

#### Diagramme de relation

Avec les diagrammes ER ci-dessus, modèlez un diagramme relationnel pour les systèmes.

1) 
![RD #1](assets/4/7.png)

3) 
![RD #3](assets/4/8.png)

5) 
![RD #5](assets/4/9.png)

6) 
![RD #6](assets/4/10.png)

#### Schèma de relation

Avec les diagrammes relationnel ci-dessus, écrivez un schéma SQL relationnel pour les systèmes.

1) 
```sql
CREATE TABLE "professor" (
  "ssn" varchar(20),
  PRIMARY KEY ("ssn")
);

CREATE TABLE "teaches" (
  "ssn" varchar(20),
  "courseid" varchar(20),
  "semesterid" varchar(20),
  PRIMARY KEY ("ssn", "courseid")
);

CREATE TABLE "course" (
  "courseid" varchar(20),
  PRIMARY KEY ("courseid")
);
```

3) 
```sql
CREATE TABLE "professor" (
  "ssn" varchar(20),
  PRIMARY KEY ("ssn")
);

CREATE TABLE "teaches" (
  "ssn" varchar(20),
  "courseid" varchar(20),
  "semesterid" varchar(20),
  PRIMARY KEY ("courseid")
);

CREATE TABLE "course" (
  "courseid" varchar(20),
  PRIMARY KEY ("courseid")
);


```

5) 
```sql
CREATE TABLE "professor" (
  "ssn" varchar(20),
  PRIMARY KEY ("ssn")
);

CREATE TABLE "teaches" (
  "ssn" varchar(20),
  "courseid" varchar(20),
  "semesterid" varchar(20),
  PRIMARY KEY ("semesterid")
);

CREATE TABLE "course" (
  "courseid" varchar(20),
  PRIMARY KEY ("courseid")
);


```

6) 
```sql
CREATE TABLE "professor" (
  "ssn" varchar(20),
  PRIMARY KEY ("ssn")
);

CREATE TABLE "teaches" (
  "courseid" varchar(20),
  "groupid" varchar(20),
  "semesterid" varchar(20),
  PRIMARY KEY ("semesterid")
);

CREATE TABLE "group" (
  "groupid" varchar(20),
  PRIMARY KEY ("groupid")
);

CREATE TABLE "member_of" (
  "ssn" varchar(20),
  "courseid" varchar(20),
  "membershipid" varchar(20),
  PRIMARY KEY ("membershipid")
);

CREATE TABLE "course" (
  "courseid" varchar(20),
  PRIMARY KEY ("courseid")
);


```

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
