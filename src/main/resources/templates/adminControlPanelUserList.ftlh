<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ProjectTool</title>
</head>
<body>
<span><a href="/home">Home page</a> </span>
List of users
<table>
    <thead>
    <tr>
        <th>id</th>
        <th>Name</th>
        <th>Role</th>
        <th>Password</th>
        <th></th>
    </tr>
    </thead>
    <body>
    <#list users as user>
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td><#list user.roles as role>${role}<#sep>, </#list></td>
            <td><a href="/user/list/${user.id}">edit</a></td>
        </tr>
    </#list>
    </body>
</table>
</body>
</html>