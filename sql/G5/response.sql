#1

alter table centre
    add constraint FK_Centre_Personne
        foreign key (id_dirigeant) references personne (id_personne);

#2

SELECT DISTINCT prenomEnfant, nomEnfant FROM enfant ORDER BY enfant.prenomEnfant ASC

##3


