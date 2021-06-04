const settings = document.querySelector('.settings');
const settingsModal = document.querySelector('.user-modal');
const settingsWrap = document.querySelector('.user-modal__wrap');
const email = document.querySelector('.user-modal .input-email');
const password = document.querySelector('.user-modal .input-password');
const fileInput = document.querySelector('.user-modal .file-input');
const userSubmit = document.querySelector('.user-modal .submit');
const userClose = document.querySelectorAll('.user-modal .fa-times');
let isSettingsOpened = false;
let isActiveSettingsSubmit = false;
userSubmit.disabled = true;

settings.addEventListener('click', () => {
    settingsModal.classList.add('active');
    settingsWrap.classList.add('active');
    isSettingsOpened = true;
})

settingsModal.addEventListener('click', event => {
    if(event.target.dataset.close) {
        settingsModal.classList.remove('active');
        settingsWrap.classList.remove('active');
        isSettingsOpened = false;
    }
})

function validateUser() {
    isActiveSettingsSubmit = email.value.length > 1 || password.value.length > 1 || fileInput.value;
    if (isActiveSettingsSubmit) {
        userSubmit.classList.remove('disable');
        userSubmit.disabled = false;
    } else {
        userSubmit.classList.add('disable');
        userSubmit.disabled = true;
    }
}

[email, password, fileInput].forEach(function(element) {
    element.addEventListener("input", function() {
        validateUser();
    });
});

userClose.forEach(function(element) {
    element.addEventListener("click", function() {
        validateUser();
    });
});