<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ProjectTool</title>
</head>
<body>
<span><a href="/home">Home page</a> </span>
${message!}
Проект: ${project.name}<br/>
Описание проекта: ${project.projectText}<br/>
Идентификатор проекта:${project.projectIdentifier}<br/>
Владелец проекта: ${project.projectOwner.username}<br/>
Задачи проекта:<br/>
<#list tasks as task>
    <td>task starter = ${task.taskStarter.username},task name = ${task.name}, task text = ${task.taskText}, task status = ${task.status}</td><br/>
</#list>
<form method="post" action="/createTask">
    <div><label> Название задачи <input type="text" name="name"/> </label></div>
    <div><label> Текст сообщения <input type="text" name="text"/> </label></div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="hidden" name="id" value="${project.id}"/>
    <div><input type="submit" value="Отправить сообщение"/></div>
</form>
<form method="post" action="/sendMessage">
    <div><label> Текст сообщения <input type="text" name="text"/> </label></div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="hidden" name="id" value="${project.id}"/>
    <div><input type="submit" value="Отправить сообщение"/></div>
</form>
<#list messages as message>
    <td>${message.fromUser.username} сказал ${message.text}, время ${message.messageTime}</td><br/>
</#list>
</body>
</html>