<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ProjectTool</title>
</head>
<body>
    <span><a href="/home">Home page</a> </span>
    Список пользователей
    <form method="get" action="/userlist">
        <input type="text" name="username" value="${username!}">
        <button type="submit">Найти по нику</button>
    </form>
    <#list users as user>
            <b><a href="/id${user.id}">${user.username}</a></b><br/>
    </#list>
</body>
</html>