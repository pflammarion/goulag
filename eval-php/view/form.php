<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width,user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
    <link rel="stylesheet" href="../public/style.css">
	<title>Quiz</title>
    <script src="../public/jquery-3.6.1.min.js"></script>
</head>
<body>

<div class="quiz">
  <img src="../public/images/quiz.png" alt="quiz">
</div>
  <h1>Merci de remplir ce formulaire :</h1>

        <form method="post" action="">
            <p class="erreur"><?php if(isset($_GET["all"]) && $_GET["all"] === "true"){echo "Tous les champs doivent être remplis";}?></p>
          <label for="prenom">Prénom* : </label><br>
          <input type="text" id="prenom" name="prenom" value="<?php if(isset($_COOKIE['prenom'])){echo $_COOKIE['prenom'];}?>" ><br><br>
            <p id="prenomError" class="erreur">
                <!--case php error-->
                <?php if(isset($_GET["prenom"]) && $_GET["prenom"] === "true"){echo "Le prénom doit être rempli";}?>
            </p>
          <label for="nom">Nom* : </label><br>
          <input type="text" id="nom" name="nom" value="<?php if(isset($_COOKIE['nom'])){echo $_COOKIE['nom'];}?>" ><br><br>
            <p id="nomError" class="erreur">
                <!--case php error-->
                <?php if(isset($_GET["nom"]) && $_GET["nom"] === "true"){echo "Le nom doit être rempli";}?>
            </p>
          <label for="email">e-Mail* : </label><br>
          <input type="text" id="email" name="email" value="<?php if(isset($_COOKIE['email'])){echo $_COOKIE['email'];}?>"><br><br>
            <p id="emailError" class="erreur">
                <!--case php error-->
                <?php if(isset($_GET["email"]) && $_GET["email"] === "true"){echo "L'email doit être rempli";}?>
            </p>
          *Champs obligatoires

          <div class="quiz">

            <div class="question">
              Combien y a-t-il de carrés ?
              <img class="images" src="../public/images/carres.png">
              <select name="carres">
               <option value=""> -</option>
               <option value="37"> 37</option>
               <option value="40"> 40</option>
               <option value="42"> 42</option>
               <option value="38"> 38</option>
              </select>
                <p class="erreur2"><?php if(isset($_GET["carre"]) && $_GET["carre"] === "true"){echo "essaie encore";}?></p>

            </div>        

            <div class="question">
              Les lignes horizontales sont-elles parallèles ?
              <img class="images" src="../public/images/horizontaux.png">
              <div class="bradio">
                <input type="radio" name="horizontaux" value="Oui">
               <label for="html">Oui</label><br>
               <input type="radio" id="css" name="horizontaux" value="Non">
               <label for="css">Non</label><br>

              </div>
                <p class="erreur2"><?php if(isset($_GET["hor"]) && $_GET["hor"] === "true"){echo "essaie encore";}?></p>
            </div>
          </div>         
               
          <input type="submit" value="Vérifier">
          <input type="reset" value="effacer les réponses">

        </form>
<script src="../public/index.js"></script>
</body>
</html>
