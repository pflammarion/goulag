<!DOCTYPE html>
<html>
<head>
    <title>Formulaire admission</title>
    <link rel="stylesheet" type="text/css" href="./public/css/index.css">
    <script src="./public/js/index.js"></script>
</head>
<body>
<form id="form" method="POST" action="traitement.php">
    <label>Nom</label>
    <input type="text" name="nom">
    <label>Prénom</label>
    <input type="text" name="prenom">
    <label>Date de naissance</label>
    <input type="date"  id="date" name="dateNaissance" >
    <label>e-mail</label>
    <input id="email1" type="text" name="email">
    <label>Confirmez email</label>
    <input id="email2" type="text" name="emailConfirmation">
    <input type="submit" value="Soumettez votre candidature">
</form>
</body>
</html>