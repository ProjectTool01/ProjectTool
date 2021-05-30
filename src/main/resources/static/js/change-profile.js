const settings = document.querySelector('.settings');
const settingsModal = document.querySelector('.modal-user');
const settingsWrap = document.querySelector('.modal-user__wrap');
const email = document.querySelector('.modal-user .input-email');
const password = document.querySelector('.modal-user .input-password');
const userSubmit = document.querySelector('.modal-user .submit');
const userClose = document.querySelectorAll('.modal-user .fa-times');
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
    isActiveSettingsSubmit = email.value.length > 1 || password.value.length > 1;
    if (isActiveSettingsSubmit) {
        userSubmit.classList.remove('disable');
        userSubmit.disabled = false;
    } else {
        userSubmit.classList.add('disable');
        userSubmit.disabled = true;
    }
}

[email, password].forEach(function(element) {
    element.addEventListener("input", function() {
        validateUser();
    });
});

userClose.forEach(function(element) {
    element.addEventListener("click", function() {
        validateUser();
    });
});