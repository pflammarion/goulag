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