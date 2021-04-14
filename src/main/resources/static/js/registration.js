const username = document.querySelector('.username');
const email = document.querySelector('.email');
const firstName = document.querySelector('.name');
const surname = document.querySelector('.surname');
const confirmPassword = document.querySelector('.confirm-password');
const password = document.querySelector('.password');
const submit = document.querySelector('.enter');
const visibiliryBtn = document.querySelectorAll('.fa-eye');
const clearBtn = document.querySelectorAll('.fa-times');
const inputs = document.querySelectorAll('input');
var isActiveSubmit = false;

function registerValidation() {
    if (
        username.value.length > 1 &&
        email.value.length > 1 &&
        firstName.value.length > 1 &&
        surname.value.length > 1 &&
        confirmPassword.value.length > 1 &&
        password.value.length > 1 &&
        password.value == confirmPassword.value
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

visibiliryBtn[0].addEventListener('click', 
    () => toggleVisibility(confirmPassword, 0));

visibiliryBtn[1].addEventListener('click', 
    () => toggleVisibility(password, 1));

function toggleVisibility(input, number) {
    const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
    input.setAttribute('type', type);
    visibiliryBtn[number].classList.toggle('fa-eye-slash');
}

function clearInput(input) {
    document.querySelector('.' + input).value = '';
}

window.onload = registerValidation();
