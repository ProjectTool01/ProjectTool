<#include "parts/security.ftlh">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ProjectTool</title>
</head>
<body>
Home page
${message}
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="submit" value="Sign Out"/>
    <#if isAdmin>
        <li>
            <a href="/user/list">User list</a>
        </li>
    </#if>
</form>
<a href="/userlist">список пользователей</a>
<a href="/user/${profileAddress}">мой профиль</a>
</body>
</html>