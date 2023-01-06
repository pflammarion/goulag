#3.	Comptez le nombre de personnes dont l’abonnement a expiré
# Deux methodes possibles

SELECT COUNT(personne.id_personne) as abonnementExpiré
FROM personne
LEFT JOIN ludotheque_personne lp on personne.id_personne = lp.id_personne
WHERE lp.dateFin < CURRENT_DATE;

#Listez toutes les personnes dont le nom commence par « Dup »

SELECT * FROM personne WHERE personne.nomPersonne LIKE 'Dup%';


# Listez Toutes les personnes qui travaillent à « ludido »

SELECT * FROM personne
    LEFT JOIN ludotheque_personne lp on personne.id_personne = lp.id_personne
    LEFT JOIN ludotheque l on l.id_ludotheque = lp.id_ludotheque
WHERE l.nom = 'Ludido';

# Listez toutes les personnes nom et prénom séparés par espace (en une seule colonne appelée enfants) qui travaillent à la ludothèque qui a pour nom « La ludo »

SELECT concat(personne.nomPersonne, ' ', personne.prenomPersonne) as enfants FROM personne
                  LEFT JOIN ludotheque_personne lp on personne.id_personne = lp.id_personne
                  LEFT JOIN ludotheque l on l.id_ludotheque = lp.id_ludotheque
WHERE l.nom = 'La ludo';

# Trouvez le nombre d’employés dans chaque ludothèque, groupé par ludothèque
SELECT l.nom, COUNT(*) as nombre_employes
FROM personne
         LEFT JOIN ludotheque_personne lp on personne.id_personne = lp.id_personne
         LEFT JOIN ludotheque l on l.id_ludotheque = lp.id_ludotheque
GROUP BY l.nom;


