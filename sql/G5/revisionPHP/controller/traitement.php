<?php

$nom = $prenom = $date_naissance = $email = $email_confirmation = '';
$submit = false;
if(!isset($_POST['nom'])){
    $lastname= checkInput($_POST['nom']);
    setcookie('lastname', $lastname, time() + 3600);
    setcookie('lastname_error', 'Merci de remplir votre nom SVP', time() + 3600);
    exit();
}
if (!isset($_POST['prenom'])){
    $firstname= checkInput($_POST['prenom']);
    setcookie('firstname', $firstname, time() + 3600);
    setcookie('firstname_error', 'Merci de remplir votre prenom SVP', time() + 3600);
    exit();
}
if (!isset($_POST['date'])){
    $date = $_POST['date'];
    setcookie('date', $date, time() + 3600);
    setcookie('date_error', 'Merci de remplir votre date de naissance SVP', time() + 3600);
    exit();
}
if (!isset($_POST['email'])){
    if (checkEmail($_POST['email'])){
        $email = $_POST['email'];
        setcookie('email', $email, time() + 3600);
        setcookie('email_error', 'Merci de remplir votre email SVP', time() + 3600);
        exit();
    }
}
if (!isset($_POST['emailConfirmation'])){
    if(checkEmail($_POST['emailConfirmation'])){
        $email_confirmation = $_POST['emailConfirmation'];
        setcookie('emailConfirmation', $email_confirmation, time() + 3600);
        setcookie('emailConfirmation_error', 'Merci de confirmer votre email SVP', time() + 3600);
        exit();
    }
}

else {
    $nom = checkInput($_POST['nom']);
    $prenom = checkInput($_POST['prenom']);
    $date_naissance = $_POST['dateNaissance'];
    $email = $_POST['email'];
    $email_confirmation = $_POST['emailConfirmation'];
    //inserer dans la base de données dans le cas ou c'est une 'vraie' application
    echo 'Vous avez bien rempli le formulaire';
    $submit = true;
}
if (!$submit){
    header('Location: index.php?submit=1');
    exit();
}


function checkInput($input) {
    $input = preg_replace('/[^a-zA-Z0-9\s]/', '', $input);
    $input = strip_tags($input);
    return trim($input);
}

function checkEmail($email) {
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return true;
    } else {
        return false;
    }
}