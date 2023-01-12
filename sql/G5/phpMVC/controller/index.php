<?php

class ArticleController {
    // Affiche la liste de tous les articles
    public function index() {
        // Charge les modèles nécessaires
        $personneModel = new \model\Personne();

        // Récupère la liste de tous les articles et de toutes les catégories
        $personnes = $personneModel->getAll();

        // Charge la vue et lui fournit les données nécessaires
        $view = new View('articles/index');
        $view->render(array(
            'personnes' => $personnes,
        ));
    }

    // Affiche le détail d'un article
    public function show($id) {
        $personneModel = new \model\Personne();

        // Récupère la liste de tous les articles et de toutes les catégories
        $personne = $personneModel->getById($id);

        // Charge la vue et lui fournit les données nécessaires
        $view = new View('../view/index.php');
        $view->render(array(
            'personne' => $personne,
        ));

    }
}