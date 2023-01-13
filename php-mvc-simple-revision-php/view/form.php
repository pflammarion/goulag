<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
    <title>MVC PHP</title>
    <link rel="stylesheet" href="../public/style.css">
    <script src="../public/jquery-3.6.1.min.js"></script>
</head>
<body>
<form method="POST" action="">
    <label>Nom</label>
    <input type="text" name="nom" value="<?php if(isset($_COOKIE['nom'])){echo $_COOKIE['nom'];}?>">
    <p class="error"><?php if(isset($_GET["nom"]) && $_GET["nom"] === "true"){echo "Merci de remplir votre nom SVP !";}?></p>
    <label>Prénom</label>
    <input type="text" name="prenom" value="<?php if(isset($_COOKIE['prenom'])){echo $_COOKIE['prenom'];}?>">
    <p class="error"><?php if(isset($_GET["prenom"]) && $_GET["prenom"] === "true"){echo "Merci de remplir votre prénom SVP !";}?></p>
    <label>Date de naissance</label>
    <input type="date" id="date" name="dateNaissance"  value="<?php if(isset($_COOKIE['date'])){echo $_COOKIE['date'];}?>">
    <p class="error"><?php if(isset($_GET["date"]) && $_GET["date"] === "true"){echo "Merci de remplir votre date SVP !";}?></p>
    <label>e-mail</label>
    <input id="email1" type="text" name="email" value="<?php if(isset($_COOKIE['email'])){echo $_COOKIE['email'];}?>">
    <p class="error"><?php if(isset($_GET["email"]) && $_GET["email"] === "true"){echo "Merci de remplir votre email SVP !";}?></p>
    <label>Confirmez email</label>
    <input id="email2" type="text" name="emailConfirmation" value="<?php if(isset($_COOKIE['emailConfirmation'])){echo $_COOKIE['emailConfirmation'];}?>">
    <p class="error"><?php if(isset($_GET["email2"]) && $_GET["email2"] === "true"){echo "Merci de remplir votre email de confirmation SVP !";}?></p>
    <input type="submit" name="submit-btn" value="Soumettez votre candidature">
</form>
<?php
if(isset($_COOKIE['form_submission'], $_GET['validate'])){
    echo '<p>'. $_COOKIE['form_submission'] .'</p>';
}
?>
<script src="../public/index.js"></script>
</body>
</html>