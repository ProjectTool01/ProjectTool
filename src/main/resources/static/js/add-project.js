const button = document.querySelector('.add_project');
const addProject = document.querySelector('.modal-window');
const windowWrap = document.querySelector('.modal-window__wrap');
const name = document.querySelector('.modal-window .input-name');
const text = document.querySelector('.modal-window .input-description');
const projectSubmit = document.querySelector('.modal-window .submit');
const close = document.querySelectorAll('.fa-times');
let isModalOpened = false;
let isActiveProject = false;
projectSubmit.disabled = true;

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
    isActiveProject = name.value.length > 4 && text.value.length > 6;
    if (isActiveProject) {
        projectSubmit.classList.remove('disable');
        projectSubmit.disabled = false;
    } else {
        projectSubmit.classList.add('disable');
        projectSubmit.disabled = true;
    }
}

[name, text].forEach(function(element) {
    element.addEventListener("input", function() {
        validateForm();
    });
});

close.forEach(function(element) {
    element.addEventListener("click", function() {
        validateForm();
    });
});