
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title><?php echo $data['title'] ?></title> <!--on affiche le contenu de la variable title définit dans le controlleur correspondant-->

        <script type="text/javascript">
            //cette fonction nous permet de générer l'url de modification du nom de produit
            function update_products(url) {
                var product_name = window.prompt("Entrez le nom du produit", "");
                if (product_name != "") {
                    window.location.href = url + "/" + product_name;
                }
            }
        </script>

    </head>
    <body>
        <div style="text-align:center">
            <h1>Produits</h1>
            <p>Le concept même d'application CRUD s'applique sur cette page</p>
        </div>

        <p>Menu</p>
        <ul>
            <li> <a href="index.php?p=home">Acceuil</a> </li>
            <li> <a href="index.php?p=products">Produits</a> </li>
            <li> <a href="index.php?p=about">A propos</a> </li>
        </ul>

        <br>

        <p>Liste des produits</p>
        <ul>
            <!--on affiche la liste des produits contenu dans la variable products définit dans le controlleur-->
            <?php foreach ($data['products'] as $product) { ?>
                <li>
                    <?php echo $product ?>
                    <!--on utilise un script javascript pour envoyer la requête de mise à jour du nom du produit-->
                    <a href="<?php echo "javascript:update_products('index.php?p=products/update_products/".$product."')" ?>">Modifier</a>
                    <a href="<?php echo "index.php?p=products/delete_products/".$product ?>">Supprimer</a>
                </li>
            <?php } ?>
        </ul>

        <br>

        <!--l'ajout de nouveau produit dans la base de données se fait grâce â ce formulaire-->
        <!--l'url de redirection sera index.php?p=products/add_products/product, product étant le nom du produit-->
        <p>Ajouter un produit</p>
        <form action="index.php?p=products/add_products" method="post">
            <input type="text" name="product" required>
            <button type="submit" name="button">Ajouter</button>
        </form>

        <br>

        <p style="text-align:center">coded by eliseekn -> 59434291/43403398 - eliseekn@gmail.com</p>
    </body>
</html>
