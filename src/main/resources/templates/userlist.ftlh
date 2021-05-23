<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../static/css/home.css">
    <link rel="stylesheet" type="text/css" href="../static/css/modal-window.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
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