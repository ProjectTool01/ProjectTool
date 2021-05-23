const username = document.querySelector('.username');
const email = document.querySelector('.email');
const firstName = document.querySelector('.name');
const surname = document.querySelector('.surname');
const confirmPassword = document.querySelector('.confirm-password');
const password = document.querySelector('.password');
const submit = document.querySelector('.enter');
const visibilityBtn = document.querySelectorAll('.fa-eye');
const clearBtn = document.querySelectorAll('.fa-times');
let isActiveSubmit = false;

function registerValidation() {
    if (
        username.value.length > 1 &&
        email.value.length > 1 &&
        firstName.value.length > 1 &&
        surname.value.length > 1 &&
        confirmPassword.value.length > 1 &&
        password.value.length > 1 &&
        password.value === confirmPassword.value
    ) {isActiveSubmit = true}
    else {isActiveSubmit = false}
    
    if (isActiveSubmit) {
        submit.classList.remove('disable');
        submit.disabled = false;
    } else {
        submit.classList.add('disable');
        submit.disabled = true;
    }
}

visibilityBtn[0].addEventListener('click',
    () => toggleVisibility(confirmPassword, 0));

visibilityBtn[1].addEventListener('click',
    () => toggleVisibility(password, 1));

function toggleVisibility(input, number) {
    const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
    input.setAttribute('type', type);
    visibilityBtn[number].classList.toggle('fa-eye-slash');
}

function clearInput(input) {
    document.querySelector('.' + input).value = '';
}

[ username, email, firstName, surname, confirmPassword, password ].forEach(function(element) {
    element.addEventListener("input", function() {
        registerValidation();
        console.log('input triggered');
    });
});

clearBtn.forEach(function(element) {
    element.addEventListener("click", function() {
        registerValidation();
    });
});
