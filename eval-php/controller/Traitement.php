<?php

require_once './model/Personne.php';

class Traitement {

    public function index() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST'){
        $quiz = 0;
            if (isset($_POST["prenom"], $_POST['nom'], $_POST['email'])) {
                $nom = htmlspecialchars($_POST["nom"]);
                $prenom = htmlspecialchars($_POST["prenom"]);
                $email = htmlspecialchars($_POST["email"]);

                if (empty($nom) && empty($prenom) && empty($email)) {
                    header("Location: index.php?all=true");
                    exit();
                }
                else if (empty($nom) || empty($prenom)|| empty($email)) {
                    if (empty($nom)) {
                        $errMessageNom = "true";
                        setcookie("nom", '');
                    } else {
                        $errMessageNom = "false";
                        setcookie("nom", $nom);
                    }
                    if (empty($prenom)) {
                        $errMessagePrenom = "true";
                        setcookie("prenom", '');
                    } else {
                        $errMessagePrenom = "false";
                        setcookie("prenom", $prenom);
                    }
                    if (empty($email)) {
                        $errMessageemail = "true";
                        setcookie("email", '');
                    } else {
                        $errMessageemail = "false";
                        setcookie("email", $email);
                    }
                    header("Location: index.php?nom=" . urlencode($errMessageNom) . "&prenom=" . urlencode($errMessagePrenom)  . "&email=" . urlencode($errMessageemail));
                    exit();
                }
                else {
                    setcookie("nom", $nom);
                    setcookie("prenom", $prenom);
                    setcookie("email", $email);
                    $horizontaux = $carres = "";
                    if(isset($_POST["carres"])){
                        $carres = htmlspecialchars($_POST['carres']);
                    }
                    if(isset($_POST['horizontaux'])){
                        $horizontaux = htmlspecialchars($_POST['horizontaux']);
                    }
                        if($horizontaux !== 'Oui'){
                            $errHor = "true";
                        }
                        else $errHor = "false";
                        if($carres !== '40'){
                            $errCarres = "true";
                        }
                        else $errCarres = "false";
                        if($horizontaux === 'Oui' && $carres === '40'){
                            $quiz = 1;
                        }
                        else {
                            $personne = new Personne();
                            $personne->insertScore($nom, $prenom, $email, $quiz);
                            header("Location: index.php?carre=" . urlencode($errCarres) . "&hor=" . urlencode($errHor));
                            exit();
                        }
                        $personne = new Personne();
                        $success = $personne->insertScore($nom, $prenom, $email, $quiz);
                        if ($success){
                            setcookie("prenom", '');
                            setcookie("nom", '');
                            setcookie("email", '');
                            require_once './view/success.php';
                        }
                        else echo "erreur lors de bdd";


                }
            }
        }
        else require_once './view/form.php';
    }
}