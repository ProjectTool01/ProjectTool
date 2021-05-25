const burger = document.querySelector('.burger-wrap');
const container = document.querySelector('.content');
const user = document.querySelector('.user');
let isNavMenuOpened = true;
let isDropDownMenuOpened = false;

function openMenu(target) {
    if (isNavMenuOpened || target !== 'container') {
        document.getElementById("sidemenu").classList.toggle('active');
        document.getElementById("main").classList.toggle('active');
        document.getElementById("arrow-left").classList.toggle('active');
        document.getElementById("icon-bars1").classList.toggle('active');
        isNavMenuOpened = !isNavMenuOpened;
    }
}

function openDropDownMenu(target) {
    if (isDropDownMenuOpened || target !== 'container') {
        document.getElementById("dropdown").classList.toggle("active");
        isDropDownMenuOpened = !isDropDownMenuOpened;
    }
}

container.addEventListener('click', () => {
    openMenu('container');
    openDropDownMenu('container');
});
burger.addEventListener('click', () => openMenu('burger'));
user.addEventListener("click", () => openDropDownMenu('user'));