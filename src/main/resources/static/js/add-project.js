const body = document.body;
const button = document.querySelector('.add_project');
const addProject = document.querySelector('.modal-window');
const windowWrap = document.querySelector('.modal-window__wrap');
const input = document.querySelector('.input');
const submit = document.querySelector('.submit');
const close = document.querySelector('.fa-times');
let isModalOpened = false;
let isActiveSubmit = false;

button.addEventListener('click', () => {
    addProject.classList.add('active');
    windowWrap.classList.add('active');
    isModalOpened = true;
})

addProject.addEventListener('click', event => {
    if(event.target.dataset.close) {
        addProject.classList.remove('active');
        windowWrap.classList.remove('active');
        isModalOpened = false;
    }
})

function clearInput(input) {
    document.querySelector('.' + input).value = '';
}

function validateForm() {
    isActiveSubmit = input.value.length > 5;
    if (isActiveSubmit) {
        submit.classList.remove('disable');
        submit.disabled = false;
    } else {
        submit.classList.add('disable');
        submit.disabled = true;
    }
}

input.addEventListener('input', () => {
    validateForm();
});

close.addEventListener('click', () => {
    clearInput('input');
    validateForm();
});