USE  centreLoisirs;

#1
alter table enfant
    add constraint fk_enfant
        foreign key (id_categorie) references categorie (id_categorie);

#2
SELECT centre.nom FROM centre GROUP BY centre.nom order by centre.nom DESC;

#3
SELECT count(centre.id_centre) FROM centre WHERE centre.ville='Vanves';
#4
INSERT INTO personne (nomPersonne, prenomPersonne, dateNaissance)
VALUES ('Blanchier', 'Hugo', '1974-03-12');

#5
DELETE
FROM personne
WHERE personne.nomPersonne = 'Leclerc' AND personne.prenomPersonne = 'Yann';

## 3 tables sont liée, mais je sais pas si il était dedans :/

#6
UPDATE centre
SET centre.numeroTel = '0171109641'
WHERE centre.nom = 'ALM Cabourg';

#7
SELECT CONCAT(enfant.prenomEnfant,'-',  enfant.nomEnfant) FROM enfant WHERE (lower(nomEnfant) LIKE 'C%') AND (lower(nomEnfant) LIKE '%L');

#8
SELECT categorie.nom, COUNT(*) AS Count
from enfant
         LEFT JOIN categorie on enfant.id_categorie = categorie.id_categorie
GROUP BY categorie.nom;

#9
SELECT enfant.nomEnfant
FROM enfant
         LEFT JOIN enfant_centre
                   ON enfant.id_enfant = enfant_centre.id_enfant
         LEFT JOIN centre
                   ON enfant_centre.id_centre = centre.id_centre
WHERE centre.nom = 'La Fontaine'
  AND enfant_centre.dateDebut >= '2022/12/19'
  AND enfant_centre.dateFin <= '2022/12/26';

#10
SELECT centre.nom FROM centre
WHERE (SELECT personne.id_personne
       FROM personne
       WHERE nomPersonne='Martin' AND prenomPersonne='Pascale')= centre.id_dirigeant;
