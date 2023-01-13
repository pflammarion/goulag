$(document).ready(() => {
    $('form').submit(function() {
        let prenom = $('#prenom');
        let nom = $('#nom');
        let email = $('#email');
        let prenomError = $('#prenomError');
        let nomError = $('#nomError');
        let emailError = $('#emailError');
        if(prenom.val() === '' || nom.val() === '' || email.val() === ''){
            if(prenom.val() === ''){
                prenomError.text('Le prénom doit être rempli')
            }

            if(nom.val() === ''){
                nomError.text('Le nom doit être rempli')
            }

            if(email.val() === ''){
                emailError.text('L\'email doit être rempli');
            }
            return false;
        }
        else if (email.val() !== '' && !isEmailFormat(email.val())){
            emailError.text('Attention, l\'email n\'est pas correct');
            email.focus();
            return false;
        }
        else return confirm("Etes-vous sûr de soumettre votre candidature ?")
    });

    function isEmailFormat(email){
        let validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
        if (email.match(validRegex)) {
            return true;
        }
        else return false;
    }

});