<?php

require_once './model/Personne.php';

class Traitement {

    public function index() {
        $personne = new Personne();
        $message = $personne->getMessage();
        require_once './view/form.php';
    }
}