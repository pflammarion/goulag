<!DOCTYPE html>
<html>
<head>
    <title>Formulaire admission</title>
    <link rel="stylesheet" type="text/css" href="public/css/index.css">
</head>
<body>
<form method="POST" action="controller/traitement.php" onsubmit="formSubmit()">
    <label>Nom</label>
    <input type="text" name="nom" value="
    <?php
    if(isset($_COOKIE['lastname'], $_GET['submit']) && $_COOKIE['lastname'] !== ""){
        echo $_COOKIE['lastname'];
    }
    ?>
">
    <?php
    if(isset($_COOKIE['firstname_error'], $_GET['submit'])){
        echo '<p class="error">'. $_COOKIE['firstname_error'] .'</p>';
    }
    ?>
    <label>Prénom</label>
    <input type="text" name="prenom">
    <?php
    if(isset($_COOKIE['lastname_error'], $_GET['submit'])){
        echo '<p class="error">'. $_COOKIE['lastname_error'] .'</p>';
    }
    ?>
    <label>Date de naissance</label>
    <input type="date"  id="date" name="dateNaissance">
    <?php
    if(isset($_COOKIE['date_error'], $_GET['submit'])){
        echo '<p class="error">'. $_COOKIE['date_error'] .'</p>';
    }
    ?>
    <label>e-mail</label>
    <input id="email1" type="text" name="email">
    <?php
    if(isset($_COOKIE['email_error'], $_GET['submit'])){
        echo '<p class="error">'. $_COOKIE['email_error'] .'</p>';
    }
    ?>
    <label>Confirmez email</label>
    <input id="email2" type="text" name="emailConfirmation">
    <?php
    if(isset($_COOKIE['emailConfirm_error'], $_GET['submit'])){
        echo '<p class="error">'. $_COOKIE['emailConfirm_error'] .'</p>';
    }
    ?>
    <input type="submit" value="Soumettez votre candidature">
</form>
<?php
if(isset($_COOKIE['form_submission'], $_GET['validate'])){
    echo '<p>'. $_COOKIE['form_submission'] .'</p>';
}
?>
<script src="public/js/index.js"></script>
</body>
</html>