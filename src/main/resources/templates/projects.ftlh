<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ProjectTool</title>
</head>
<body>
<span><a href="/home">Home page</a> </span>
Проекты
${message!}
<form method="post" action="/createProject">
    <div><label> Proj name <input type="text" name="name"/> </label></div>
    <div><label> Proj text <input type="text" name="text"/> </label></div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div><input type="submit" value="Создать проект"/></div>
</form>
<form method="post" action="/addProject">
    <div><label> Proj identifier <input type="text" name="projectIdentifier"/> </label></div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div><input type="submit" value="Вступить в проект"/></div>
</form>
<#list projects as project>
    <td><a href="/project${project.id}">proj.name = ${project.name}, proj.text = ${project.projectText}</a></td><br/>
</#list>
</body>
</html>