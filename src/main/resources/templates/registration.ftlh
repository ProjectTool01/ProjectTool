<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="../static/css/authorization.css">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
	<title>WorkPix</title>
</head>
<body>
	<div class="background">
		<div class="autentification">
			<div class="login_top">
				<div class="login__title">Project<span>Tool</span></div>
				<div class="tabs">
					<a href="/registration" class="header-tab active-tab">Регистрация</a>
					<a href="/login" class="header-tab inactive-tab">Авторизация</a>
				</div>
			</div>
			<form action="/registration" method="post">
				<div class="login_title">Пожалуйста <span>зарегистрируйтесь!</span></div>
				<input class="input" type="text" name="username" placeholder="Имя пользователя"/>
                <input class="input" type="email" name="email" placeholder="Email"/>
                <input class="input" type="text" name="name" placeholder="Имя"/>
                <input class="input" type="text" name="surname" placeholder="Фамилия"/>
				<input class="input" type="password" name="password" placeholder="Пароль">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
				<input type="submit" class="enter" value="Зарегистрироваться"/>
				<p>${message!}</p>
			</form>
		</div>
	</div>
</body>
</html>