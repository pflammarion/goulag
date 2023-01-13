$(document).ready(() => {

    $('form').submit(function() {
        return confirm("Etes-vous sûr de soumettre votre candidature ?")
    });

    let date = document.getElementById('date');
    date.addEventListener('focusout', (event) => {
        event.preventDefault();
        ageChecker();
    });

    ageChecker();

    function ageChecker(){
        let dateOfBirth = new Date(date.value);
        let age = new Date().getFullYear() - dateOfBirth.getFullYear();
        let month = new Date().getMonth() - dateOfBirth.getMonth();

        if (month < 0 || (month === 0 && new Date().getDate() < dateOfBirth.getDate())) {
            age--;
        }

        if (age < 18 && age >= 0) {
            alert('Vous êtes trop jeune');
            date.style.color = 'red';
        }
        else if (age < 0){
            alert('Vous devez être né pour utiliser cette application');
            date.style.color = 'red';
        }
        else date.style.color = 'green';
    }
});