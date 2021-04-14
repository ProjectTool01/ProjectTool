const username = document.querySelector('.username');
const password = document.querySelector('.password');
const submit = document.querySelector('.enter');
const visibiliryBtn = document.querySelectorAll('.fa-eye');
const clearBtn = document.querySelectorAll('.fa-times');
const inputs = document.querySelectorAll('input');
var isActiveSubmit = false;

function loginValidation() {
    isActiveSubmit = password.value.length > 1 && username.value.length > 1;
    if (isActiveSubmit) {
        submit.classList.remove('disable');
        submit.disabled = false;
    } else {
        submit.classList.add('disable');
        submit.disabled = true;
    }
}

visibiliryBtn[0].addEventListener('click', 
    () => toggleVisibility(password, 0));

function toggleVisibility(input, number) {
    const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
    input.setAttribute('type', type);
    visibiliryBtn[number].classList.toggle('fa-eye-slash');
}

function clearInput(input) {
    document.querySelector('.' + input).value = '';
}

window.onload = loginValidation(), registerValidation();
