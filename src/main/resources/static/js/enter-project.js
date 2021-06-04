const enterProjectButton = document.querySelector('.enter_project');
const enterProjectModal = document.querySelector('.enter-project__modal');
const enterProjectWrap = document.querySelector('.enter-project__wrap');
const enterProjectIdentifier = document.querySelector('.enter-project__modal .project-identifier');
const enterProjectSubmit = document.querySelector('.enter-project__modal .submit');
let isEnterProjectModal = false;
let isEnterActiveSubmit = false;
enterProjectSubmit.disabled = true;

enterProjectButton.addEventListener('click', () => {
    enterProjectModal.classList.add('active');
    enterProjectWrap.classList.add('active');
    isEnterProjectModal = true;
})

enterProjectModal.addEventListener('click', event => {
    if(event.target.dataset.close) {
        enterProjectModal.classList.remove('active');
        enterProjectWrap.classList.remove('active');
        isEnterProjectModal = false;
    }
})

function validateEnter() {
    isEnterActiveSubmit = enterProjectIdentifier.value.length > 1;
    if (isEnterActiveSubmit) {
        enterProjectSubmit.classList.remove('disable');
        enterProjectSubmit.disabled = false;
    } else {
        enterProjectSubmit.classList.add('disable');
        enterProjectSubmit.disabled = true;
    }
}

enterProjectIdentifier.addEventListener("input", function() {
    validateEnter();
});
