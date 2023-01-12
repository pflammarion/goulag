<?php

//on définit le controlleur par défaut
$controller_name = "home";
//on définit l'action par défaut
$action_name = "index";
//on définit les paramètres de l'action par défaut
$params = [];

//on récupère l'url si elle est définit
if (isset($_GET['p']) && !empty($_GET['p'])) {
    $url = explode('/', $_GET['p']); //on récupère chaque élément de l'url dans un tableau

    //on vérifie que le nom du controller est définit dans l'url (ex: index.php?p=home)
    if (isset($url[0])) {
        $controller_name = $url[0]; //on récupère le nom du controleur
        unset($url[0]);
    }

    //on vérifie qu'une action est définit (ex: index.php?p=home/index)
    if (isset($url[1])) {
        $action_name = $url[1]; //on récupère le nom de l'action
        unset($url[1]);
    }

    //le reste constitue les paramètres de l'action (ex: index.php?p=products/add_products/iPhone X)
    $params = $url ? $url : [];

	//ajout des paramètres de la variable $_POST si définis
	if (!empty($_POST)) {
		foreach ($_POST as $key => $value) {
			$params[] = $value;
		}
	}
}

//si un fichier php porte le nom de ce controller, on instancie la classe associée
if (file_exists("app/controllers/".$controller_name.".php")) {
    //on charge le fichier en question
    require_once "app/controllers/".$controller_name.".php";

    //on donne un nom au controller identique au nom de la classe en question selon une méthode personnelle
	$controller_name = ucfirst(strtolower($controller_name))."Controller"; //ex: home -> HomeController
    //on initialise la classe
	$controller = new $controller_name();

    //exécution du controlleur avec tous les paramètres
	call_user_func_array([$controller, $action_name], $params);
} else {
    //le fichier en question n'existe pas donc on affiche une erreur 404
    echo "<p>Erreur 404. <br> La page " . $controller_name . " n'existe pas </p>";
}
