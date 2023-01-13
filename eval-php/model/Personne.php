<?php

class Personne {

    public function insertScore(string $nom, string $prenom, string $email, int $quiz): bool
    {
        $db = $this->databaseConnection();
        $sql = "INSERT INTO personne (nom, prenom, email, quiz, date) VALUES (:nom, :prenom, :email, :quiz, CURRENT_TIMESTAMP()) ";
        $query = $db-> prepare($sql);
        $query->execute(
            array(
                'nom'=>$nom,
                'prenom'=>$prenom,
                'email'=>$email,
                "quiz"=> $quiz,
            )
        );
        return true;
    }

    private function databaseConnection(): PDO
    {
        //database connection cred
        $db_name =  'quiz';
        $db_user = 'root';
        $db_pass = '';
        $db_host = 'localhost';

        try {
            $db = new PDO("mysql:host=". $db_host .";dbname=". $db_name ."", $db_user, $db_pass);
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

        catch(Exception $e) {
            echo 'Database connection error.'.$e->getMessage();
            exit();
        }
        return $db;
    }

}