/* 1. Comment récupérer toutes les infos de facilities ? */
SELECT *
FROM facilities;

/* 2. Récupérer la liste des equipements(facilities)
      et leur coût pour les membres */
SELECT name, membercost
FROM facilities;

/* 3. Récupérer la liste des équipements qui appliquent
      des frais aux membres */
SELECT name, membercost
FROM facilities
WHERE membercost > 0;

/* 4. Récupérer la liste des équipements qui font payer
      des frais aux membre inférieurs à 1/50e
      du coût d'entretien mensuel.
      Ne renvoyer que facid, le nom de l'equipement,
      le coût des membres et le coût d'entretien */
SELECT facid, name, membercost, monthlymaintenance
FROM facilities
WHERE membercost > 0
  AND membercost < monthlymaintenance / 50;

/* 5. Renvoyer la liste des equipements contenant le mot "tennis"
      dans leur nom */
SELECT name
FROM facilities
WHERE lower(name) like '%tennis%';

/* 6. Renvoyer les données des équipements d'id 1 et 5, sans utiliser
      le mot clé "OR" */
SELECT *
FROM facilities
WHERE facid between 1 and 5;

/* 7. Renvoyer la liste des noms des équipements et une colonne "cost"
      qui contient "cheap" quand le cout de maintenance est < 100
      et "expensive" dans les autres cas */
SELECT name,
       CASE
           WHEN monthlymaintenance < 100 THEN 'cheap'
           ELSE 'expensive'
           END as cost
FROM facilities;

/* 8. Renvoyer les "memid", "surname", "firstname" et "joindate" des
      membres inscrit apres le debut de septembre 2012 */
SELECT memid, surname, firstname, joindate
FROM members
WHERE joindate > '2012-09-01 00:00:00.000000';

/* 9. Créer une liste ordonnée des 10 premiers prénom des membres
      (ordre alphabétique) */
SELECT firstname
FROM members
ORDER BY firstname
limit 10;

/* 10 Créer une liste d'une seule colonne contenant d'abord les
      noms des equipements, puis les prénoms des membres */
SELECT name FROM facilities
UNION
SELECT firstname FROM members;

/* 11 Renvoyer uniquement la date d'inscription du dernier membre  */
SELECT joindate
FROM members
ORDER BY joindate DESC
LIMIT 1;

/* 12 Pareil que le (11) mais avec le prenom et le nom de ce membre */
SELECT concat(surname, ' ', firstname) as name_member
FROM members
ORDER BY joindate DESC
LIMIT 1;

