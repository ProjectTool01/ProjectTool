const myProfileButton = document.querySelector('.my-profile');
const myProfileModal = document.querySelector('.my-profile__modal');
const myProfileWrap = document.querySelector('.my-profile__wrap');
let isMyProfileModal = false;

myProfileButton.addEventListener('click', () => {
    myProfileModal.classList.add('active');
    myProfileWrap.classList.add('active');
    isMyProfileModal = true;
})

myProfileModal.addEventListener('click', event => {
    if(event.target.dataset.close) {
        myProfileModal.classList.remove('active');
        myProfileWrap.classList.remove('active');
        isMyProfileModal = false;
    }
})
