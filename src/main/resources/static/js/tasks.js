const newTasks = document.querySelectorAll('.new-tasks .card-item');
const takenTasks = document.querySelectorAll('.taken-tasks .card-item');
const doneTasks = document.querySelectorAll('.done-tasks .card-item');

document.querySelector('.new-tasks .card-title span').innerHTML = newTasks.length;
document.querySelector('.taken-tasks .card-title span').innerHTML = takenTasks.length;
document.querySelector('.done-tasks .card-title span').innerHTML = doneTasks.length;
