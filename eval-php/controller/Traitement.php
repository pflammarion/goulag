<?php

require_once './model/Personne.php';

class Traitement {

    public function index() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST'){
            if (isset($_POST["submit-btn"], $_POST['nom'], $_POST['prenom'], $_POST['dateNaissance'], $_POST['email'], $_POST['emailConfirmation'])) {
                $nom = $_POST["nom"];
                $prenom = $_POST["prenom"];
                $dateNaissance = $_POST["dateNaissance"];
                $email = $_POST["email"];
                $emailConfirmation = $_POST["emailConfirmation"];

                if (empty($nom) || empty($prenom) || empty($dateNaissance) || empty($email) || empty($emailConfirmation)) {
                    if (empty($nom)) {
                        $errMessageNom = "true";
                    } else {
                        $errMessageNom = "false";
                        setcookie("nom", $nom);
                    }
                    if (empty($prenom)) {
                        $errMessagePrenom = "true";
                    } else {
                        $errMessagePrenom = "false";
                        setcookie("prenom", $prenom);
                    }
                    if (empty($dateNaissance)) {
                        $errMessagedateNaissance = "true";
                    } else {
                        $errMessagedateNaissance = "false";
                        setcookie("date", $dateNaissance);
                    }
                    if (empty($email)) {
                        $errMessageemail = "true";
                    } else {
                        $errMessageemail = "false";
                        setcookie("email", $email);
                    }
                    if (empty($emailConfirmation)) {
                        $errMessageemail2 = "true";
                    } else {
                        $errMessageemail2 = "false";
                        setcookie("emailConfirmation", $emailConfirmation);
                    }
                    header("Location: index.php?nom=" . urlencode($errMessageNom) . "&prenom=" . urlencode($errMessagePrenom) . "&date=" . urlencode($errMessagedateNaissance) . "&email=" . urlencode($errMessageemail) . "&email2=" . urlencode($errMessageemail2));
                } else {
                    echo "Vous avez bien rempli le formulaire !";
                }
            }
        }
        else require_once './view/form.php';
        //$personne = new Personne();
        //$message = $personne->getMessage();
        //require_once './view/view.php';
    }
}