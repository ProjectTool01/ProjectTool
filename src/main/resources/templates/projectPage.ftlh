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
Владелец проекта: ${project.projectOwner}<br/>
Задачи проекта:<br/>
<#list tasks as task>
    <td>task name = , task text = , task status = </td><br/>
</#list>
</body>
</html>