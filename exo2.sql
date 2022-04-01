/*
	1. Récupérer les dates de débuts des réservations de David Farrell
	(1 colonne: Dates de début)
	(34 lignes)
*/
SELECT distinct b.starttime as "Dates de debut"
FROM members m
         JOIN bookings b on m.memid = b.memid
WHERE m.surname = 'Farrell'
  AND m.firstname = 'David';

/*
	2. Déterminer les heures de début des réservations pour des courts
	de tennis 1 et 2, le 21/09/2012.
	(2 colonnes: Heures de début, nom du court)
	(12 lignes)
*/
SELECT b.starttime as "Heures de début", f.name as "Nom du court"
FROM facilities f
JOIN bookings b ON f.facid = b.facid
WHERE (f.name = 'Tennis Court 1'
    OR f.name = 'Tennis Court 2')
  AND b.starttime >= '2012-09-21'
  AND b.starttime < '2012-09-22';

/*
	3. Produire une liste de tous les membres qui ont recommandé un autre
	membre.
	(2 colonnes: Prénom, Nom)
	(13 lignes)
*/
SELECT distinct m.surname as "Prénom", m.firstname as "Nom"
FROM members m2
JOIN members m ON  m2.recommendedby = m.memid;

/*
	4. Produire une liste de tous les membres et de leurs parrains
	(4 colonnes: prénom membre, nom membre, prénom parrain, nom parrain)
	(31 lignes)
*/
SELECT m2.surname as "Prénom membre", m2.firstname as "Nom membre",  m.surname as "Prénom parrain", m.firstname as "Nom parrain"
FROM members m
JOIN members m2 ON  m2.recommendedby = m.memid

/*
	5. Dresser une liste de tous les membres qui ont utilisé le court
	de tennis 1 ou 2
	(2 colonnes: "Nom et Prénom du membre", Nom du court)
	(46 lignes)
*/

/*
	6. Produire une liste des réservations qui ont couté plus de 30$
	le 14/09/2012
	(3 colonnes: "Prénom et Nom du membre", Nom du court, coût de la réservation)
	(18 lignes)
*/

/*
	7. Produire une liste de tous les membres, avec leurs parrains,
	sans utiliser de jointure.
	(2 colonnes: "Prenom et Nom des membres", "Prénom et Nom des parrains")
	(30 lignes)
*/

/*
	8. Idem que 6.,	en utilisant une sous-requête.
	(3 colonnes: "Prénom et Nom du membre", Nom du court, coût)
	(18 lignes)
*/