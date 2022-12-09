#1

alter table centre
    add constraint FK_Centre_Personne
        foreign key (id_dirigeant) references personne (id_personne);

#2

SELECT DISTINCT prenomEnfant, nomEnfant FROM enfant ORDER BY enfant.prenomEnfant ASC

#3

SELECT COUNT(*)
from enfant
  JOIN categorie on enfant.id_categorie = categorie.id_categorie
WHERE categorie.id_categorie = 1;

#4

INSERT INTO categorie (nom)
VALUES ('1-2 ans');

#5

DELETE
FROM enfant
WHERE enfant.nomEnfant = 'Long' AND enfant.prenomEnfant = 'Angèle';

#6
UPDATE personne
SET personne.nomPersonne = 'Leblanc-Duchaine'
WHERE personne.nomPersonne = 'Duchaine' AND personne.prenomPersonne = 'Léa';

#7

SELECT concat(enfant.prenomEnfant, ' ', enfant.nomEnfant, ',', enfant.dateNaissance)
FROM enfant
    LEFT JOIN enfant_centre ec on enfant.id_enfant = ec.id_enfant
WHERE cantine=1;

#8

SELECT categorie.nom, COUNT(*) AS Count
from personne_categorie
         LEFT JOIN categorie on personne_categorie.id_categorie = categorie.id_categorie
GROUP BY categorie.nom;

#9

UPDATE centre SET centre.id_dirigeant = (SELECT personne.id_personne
       FROM personne
       WHERE nomPersonne='Bertrand' AND prenomPersonne='Camille')
WHERE centre.nom = 'Jean Monnet';
