<?php

//on charge le fichier mère du controlleur
require "app/core/controller.php";

//classe HomeController instanciée de la classe Controlleur
class HomeController extends Controller {

    //initialisation de la classe
	public function __construct() {
		parent::__construct();
	}

    //on affiche la page home avec une variable title définie
	public function index() {
		$this->view->render("home", ["title" => "Architecture MVC en PHP - Acceuil"]);
	}
}
?>
