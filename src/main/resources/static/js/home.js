const invitations = document.querySelectorAll('.invitations .card-item');
const tasks = document.querySelectorAll('.tasks .card-item');
const projects = document.querySelectorAll('.select-project .card-item');

document.querySelector('.invitations span').innerHTML = invitations.length;
document.querySelector('.tasks span').innerHTML = tasks.length;
document.querySelector('.select-project span').innerHTML = projects.length;