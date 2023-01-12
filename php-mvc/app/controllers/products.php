<?php

//on charge le fichier mère du controlleur
require "app/core/controller.php";
//on charge le fichier modèle des produits
require "app/models/products.php";

//classe ProductsController instanciée de la classe Controlleur
class ProductsController extends Controller {

	private $products;

    //initialisation de la classe
	public function __construct() {
		parent::__construct();

		//initialisation de la classe modèle des produits
		$this->products = new ProductsModel();
	}

	private function render() {
		$this->view->render("products", [
                "title" => "Architecture MVC en PHP - Produits",
                "products" => $this->products->get_products() //on récupère la liste des produits de la base de données
            ]
        );
	}

    //on affiche la page products avec une variable title définie
	public function index() {
		$this->render();
	}

    //on affiche la page products avec une variable title définie
	public function add_products($product) {
		$this->products->add_products($product);
		$this->render(); //on actualise la page
	}

    //on affiche la page products avec une variable title définie
	public function update_products($old_product, $new_product) {
		$this->products->update_products($old_product, $new_product);
		$this->render();  //on actualise la page
	}

    //on affiche la page products avec une variable title définie
	public function delete_products($product) {
		$this->products->delete_products($product);
		$this->render(); //on actualise la page
	}
}
?>
