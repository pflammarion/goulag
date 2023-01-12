<?php

//on charge les fichiers mères du modèle et de la vue
require "view.php";

//classe mère des controlleurs
class Controller {

    //initialisation de la classe
    public function __construct() {
		$this->view = new View();
    }
}
