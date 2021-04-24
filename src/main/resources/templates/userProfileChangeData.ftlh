<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ProjectTool</title>
</head>
<body>
Change data
<form method="post" enctype="multipart/form-data">
    <div><label> Change email: <input type="text" name="email"/> </label></div>
    <div><label> Change password: <input type="password" name="password"/> </label></div>
    <input type="file" name="file">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div><input type="submit" value="Save"/></div>
</form>
${changePasswordMessage!}<br/>
${changeEmailMessage!}<br/>
${changeAvatarMessage!}<br/>
<a href="/home">Домой</a>
</body>
</html>