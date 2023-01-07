<!DOCTYPE html>
<html>
<head>
    <title>Formulaire admission</title>
    <link rel="stylesheet" type="text/css" href="./public/css/index.css">
</head>
<body>
<form method="POST" action="traitement.php" onsubmit="formSubmit()">
    <label>Nom</label>
    <input type="text" name="nom">
    <label>Prénom</label>
    <input type="text" name="prenom">
    <label>Date de naissance</label>
    <input type="date"  id="date" name="dateNaissance">
    <label>e-mail</label>
    <input id="email1" type="text" name="email">
    <label>Confirmez email</label>
    <input id="email2" type="text" name="emailConfirmation">
    <input type="submit" value="Soumettez votre candidature">
</form>
<script src="./public/js/index.js"></script>
</body>
</html>