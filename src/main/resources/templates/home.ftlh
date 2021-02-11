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
</form>
<a href="/greeting">Greeting page</a>
</body>
</html>