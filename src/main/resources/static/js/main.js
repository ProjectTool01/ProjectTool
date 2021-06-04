const burger = document.querySelector('.burger-wrap');
const container = document.querySelector('.content');
const user = document.querySelector('.user');
const projects = document.querySelectorAll('.select-project .card-item');
const messagesDiv = document.querySelector('.messages .card-content');
let isDropDownMenuOpened = false;

function openMenu() {
        document.getElementById("sidemenu").classList.toggle('active');
        document.getElementById("main").classList.toggle('active');
        document.getElementById("arrow-left").classList.toggle('active');
        document.getElementById("icon-bars1").classList.toggle('active');
}

function openDropDownMenu(target) {
    if (isDropDownMenuOpened || target !== 'container') {
        document.getElementById("dropdown").classList.toggle("active");
        isDropDownMenuOpened = !isDropDownMenuOpened;
    }
}

container.addEventListener('click', () => {
    openDropDownMenu('container');
});
burger.addEventListener('click', () => openMenu('burger'));
user.addEventListener("click", () => openDropDownMenu('user'));
document.querySelector('.select-project span').innerHTML = projects.length;
messagesDiv.scrollTop = messagesDiv.scrollHeight;