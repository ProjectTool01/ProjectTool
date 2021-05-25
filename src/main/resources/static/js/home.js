const invitations = document.querySelectorAll('.invitations .card-item');
const projectName = document.querySelector('.project-info__title');
const projectDescription = document.querySelector('.project-description');
const projectMembers = document.querySelector('.project-info__members span');
const projectTasks = document.querySelector('.project-info__tasks span');
const avatar = '/img/defaultAvatar.jpg';
const projectsInfo = {
    project1: {
        projectDescription: 'This is super Puper Ultra duper project description, so this is all that i can sad about this.',
        members: 10,
        tasks: {
            task1: {
                taskDescription: 'This is task description, and i dont now what to write here',
                status: 'New'
            },
            task2: {
                taskDescription: 'This is task description, and i dont now what to write here',
                status: 'InProgress'
            },
            task3: {
                taskDescription: 'This is task description, and i dont now what to write here',
                status: 'Complete'
            }
        }
    },
    project2: {
        projectDescription: 'Lorem ipsum ipsum lorem lorem ipsum ipsum lorem lorem ipsum ipsum lorem lorem',
        members: 99,
        tasks: {
            task1: {
                taskDescription: 'This is task description, and i dont now what to write here',
                status: 'New'
            },
            task2: {
                taskDescription: 'This is task description, and i dont now what to write here',
                status: 'InProgress'
            },
            task3: {
                taskDescription: 'This is task description, and i dont now what to write here',
                status: 'InProgress'
            },
            task4: {
                taskDescription: 'This is task description, and i dont now what to write here',
                status: 'InProgress'
            },
            task5: {
                taskDescription: 'This is task description, and i dont now what to write here',
                status: 'InProgress'
            },
            task6: {
                taskDescription: 'This is task description, and i dont now what to write here',
                status: 'Complete'
            }
        }
    }
};

let projectsItems = '';
let canvas = document.querySelector('.pie-chart')
let ctx = canvas.getContext('2d');
let data = [200,60,15];
let myColor = ['#f6f7fa','#5584ff','#00fc00'];
const result = document.querySelector('.result');

// Формирование списка проектов
Object.keys(projectsInfo).forEach((item) => {
    projectsItems = projectsItems + `
    <div class="card-item">
        <div class="person-img"><img src="${avatar}"></div>
        <div class="select-project__info">
            <div class="project-name">${item}</div>
            <div class="project-description">${projectsInfo[item].projectDescription}</div>
        </div>
    </div>
    `
})
document.querySelector('.select-project .card-content').innerHTML = projectsItems;

//Слушаем клик каждого проекта в списке проектов
document.querySelectorAll('.select-project .card-item').forEach((item, index) => {
    item.addEventListener('click', event => {
        switchProject(projectsInfo, index);
    })
})

//Кол-во приглашений, задач и проектов
document.querySelector('.invitations span').innerHTML = invitations.length;
document.querySelector('.select-project span').innerHTML = document.querySelectorAll('.select-project .card-item').length;

//Функция переключения проекта
switchProject(projectsInfo, 0);
function switchProject(object, number) {
    let newTask = 0;
    let inProgressTask = 0;
    let completeTask = 0;
    let taskList = '';

    projectName.innerHTML = Object.keys(object)[number];
    projectDescription.innerHTML = object[Object.keys(object)[number]].projectDescription;
    projectMembers.innerHTML = object[Object.keys(object)[number]].members;
    projectTasks.innerHTML = Object.keys(object[Object.keys(object)[number]].tasks).length;

    Object.keys(object[Object.keys(object)[number]].tasks).forEach((key) => {
        taskList = taskList + `
        <div class="card-item">
            <div class="task-status">${object[Object.keys(object)[number]].tasks[key].status.charAt(0)}</div>
            <div class="task-text">${object[Object.keys(object)[number]].tasks[key].taskDescription}</div>
        </div>
        `
    })
    document.querySelector('.tasks .card-content').innerHTML = taskList;
    document.querySelector('.tasks span').innerHTML = document.querySelectorAll('.tasks .card-item').length;

    Object.keys(object[Object.keys(object)[number]].tasks).forEach((key) => {
        if (object[Object.keys(object)[number]].tasks[key].status === 'New') {
            newTask++;
        } else if (object[Object.keys(object)[number]].tasks[key].status === 'InProgress') {
            inProgressTask++;
        } else {
            completeTask++;
        }
    })
    data[0] = newTask;
    data[1] = inProgressTask;
    data[2] = completeTask;
    drawCanvas();
}

//Pie chart
function drawCanvas() {
    let myTotal = 0;
    let lastend = 0;
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    for(let e = 0; e < data.length; e++)
    {
        myTotal += data[e];
    }

    for (let i = 0; i < data.length; i++) {
        ctx.fillStyle = myColor[i];
        ctx.beginPath();
        ctx.moveTo(canvas.width/2,canvas.height/2);
        ctx.arc(canvas.width/2,canvas.height/2,canvas.height/2,lastend,lastend+(Math.PI*2*(data[i]/myTotal)),false);
        ctx.lineTo(canvas.width/2,canvas.height/2);
        ctx.fill();
        lastend += Math.PI*2*(data[i]/myTotal);
    }

    result.innerHTML = ((data[2] / myTotal) * 100).toFixed(1) + '%';
}
