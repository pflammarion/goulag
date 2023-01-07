<!-- Fichier : views/articles/index.php -->

<!-- Inclusion de l'en-tête de la page -->
<?php require 'header.php'; ?>

<!-- Affichage de la liste des articles -->
<h1>Liste des articles</h1>
<ul>
    <?php foreach ($articles as $article): ?>
        <li>
            <a href="/articles/show?id=<?php echo $article['id']; ?>"><?php echo $article['title']; ?></a>
            <p><?php echo $article['summary']; ?></p>
        </li>
    <?php endforeach; ?>
</ul>

<!-- Affichage de la liste des catégories -->
<h1>Liste des catégories</h1>
<ul>
    <?php foreach ($categories as $category): ?>
        <li><?php echo $category['name']; ?></li>
    <?php endforeach; ?>
</ul>

<!-- Inclusion du pied de page -->
<?php require 'footer.php'; ?>
