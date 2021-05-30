const invitations = document.querySelectorAll('.invitations .card-item');
const projects = document.querySelectorAll('.select-project .card-item');
const tasks = document.querySelectorAll('.tasks .card-item');

let canvas = document.querySelector('.pie-chart')
let ctx = canvas.getContext('2d');
let data = [200,60,15];
let myColor = ['#f6f7fa','#5584ff','#00fc00'];
const result = document.querySelector('.result');

//Кол-во приглашений, задач и проектов
document.querySelector('.invitations span').innerHTML = invitations.length;
document.querySelector('.select-project span').innerHTML = projects.length;
document.querySelector('.tasks span').innerHTML = tasks.length;

//Pie chart
drawCanvas();
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
