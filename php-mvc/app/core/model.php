<?php

//classe mère des modèles
//cette classe gère toutes les opérations relatives à la bases de données

//variables d'accès à la base de données
define(DB_HOST, "localhost");
define(DB_USERNAME, "root");
define(DB_PASSWORD, "");
define(DB_NAME, "php");

class Model {
    //variable de connection mysqli
    private $db;

    //initialisation de la classe
    public function __construct() {
        //connexion à la base de donnée
        try {
            $this->db = new PDO("mysql:host=". DB_HOST .";dbname=". DB_NAME, DB_USERNAME, DB_PASSWORD);
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

        catch(Exception $e) {
            echo 'Database connection error.'.$e->getMessage();
            exit();
        }

    }

    //exécution d'une requête mysql
    public function execute(string $sql, array $param): bool
    {
        $query = $this->db-> prepare($sql);
        $query->execute($param);
        return true;

    }

    //récupération des données
    public function select(string $sql, array $param): bool
    {
        $query = $this->db-> prepare($sql);
        $query->execute($param);
        return $query->fetchAll();
    }
}
