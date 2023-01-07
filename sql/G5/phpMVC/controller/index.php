<?php
class ArticleController {
    // Affiche la liste de tous les articles
    public function index() {
        // Charge les modèles nécessaires
        $articlesModel = new ArticlesModel();
        $categoriesModel = new CategoriesModel();

        // Récupère la liste de tous les articles et de toutes les catégories
        $articles = $articlesModel->getAll();
        $categories = $categoriesModel->getAll();

        // Charge la vue et lui fournit les données nécessaires
        $view = new View('articles/index');
        $view->render(array(
            'articles' => $articles,
            'categories' => $categories
        ));
    }

    // Affiche le détail d'un article
    public function show($id) {
        // Charge les modèles nécessaires
        $articlesModel = new ArticlesModel();
        $commentsModel = new CommentsModel();

        // Récupère l'article et les commentaires associés
        $article = $articlesModel->getById($id);
        $comments = $commentsModel->getByArticleId($id);

        // Charge la vue et lui fournit les données nécessaires
        $view = new View('articles/show');
        $view->render(array(
            'article' => $article,
            'comments' => $comments
        ));
    }
}