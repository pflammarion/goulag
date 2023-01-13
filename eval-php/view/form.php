<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="../public/style.css">
	<title>Quiz</title> 
</head>
<body>

<div class="quiz">
  <img src="../public/images/quiz.png" alt="quiz">
</div>
  <h1>Merci de remplir ce formulaire :</h1>
  
 
    
        <form>  
                       
          <label for="prenom">Prénom* : </label><br>
          <input type="text" id="prenom" name="prenom" ><br><br>
          <label for="nom">Nom* : </label><br>
          <input type="text" id="nom" name="nom" ><br><br>
          <label for="email">e-Mail* : </label><br>
          <input type="text" id="email" name="email" ><br><br>
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
            </div> 
          </div>         
               
          <input type="submit" value="Vérifier">
          <input type="reset" value="effacer les réponses">

        </form>

</body>
</html>
