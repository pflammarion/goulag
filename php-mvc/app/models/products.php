<?php
//Exemple d'architecture MVC en PHP par eliseekn -> 59434291/43403398 - eliseekn@gmail.com

//on charge le fichier mère du modèle
require "app/core/model.php";

//classe ProductsModel instanciée de la classe Model
class ProductsModel extends Model {

    //initialisation de la classe
	public function __construct() {
		parent::__construct();
	}

    //on récupère la liste des produits de la base de données
	public function get_products() {
		return $this->select("SELECT * FROM products");
	}

    //on insère un produit dans la base de données
	public function add_products($product) {
		$this->execute("INSERT INTO products (product) VALUES ('$product')");
	}

    //on met à jour un produit de la base de données
	public function update_products($old_product, $new_product) {
		$this->execute("UPDATE products SET product='$new_product' WHERE product='$old_product'");
	}

    //on supprime un produit de la base de données
	public function delete_products($product) {
		$this->execute("DELETE FROM products WHERE product='$product' LIMIT 1");
	}
}
