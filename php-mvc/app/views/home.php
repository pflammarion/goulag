
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title><?php echo $data['title'] ?></title> <!--on affiche le contenu de la variable title définit dans le controlleur correspondant-->
    </head>
    <body>
        <div style="text-align:center">
            <h1>Acceuil</h1>
            <p>Simple page d'acceuil</p>
        </div>

        <p>Menu</p>
        <ul>
            <li> <a href="index.php?p=home">Acceuil</a> </li>
            <li> <a href="index.php?p=products">Produits</a> </li>
            <li> <a href="index.php?p=about">A propos</a> </li>
        </ul>

        <br>

        <p style="text-align:center">coded by eliseekn -> 59434291/43403398 - eliseekn@gmail.com</p>
    </body>
</html>
