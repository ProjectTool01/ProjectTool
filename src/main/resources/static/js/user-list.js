const searchButton = document.querySelector('.submit');
const inputName = document.querySelector('.input');
const users = document.querySelectorAll('.users .card-item');
const usersNumber = document.querySelector('.users .card-title span');
let xhr = new XMLHttpRequest();

searchButton.addEventListener('click', getRequest)

function getRequest() {
    let request;
    let name = inputName.value;
    xhr.open('GET', '/userlist?username=' + name, false);
    xhr.send();
    if (xhr.status !== 200) {
        console.log( xhr.status + ': ' + xhr.statusText );
    } else {
        request = xhr.responseText;
        console.log(request.document.querySelector('.content'));
    }
}

usersNumber.innerHTML = users.length;