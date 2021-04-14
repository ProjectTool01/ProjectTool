<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
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
					<a href="/registration" class="header-tab inactive-tab">Регистрация</a>
					<a href="/login" class="header-tab active-tab">Авторизация</a>
				</div>
			</div>
			<div class="login_title">Добро пожаловать <span>обратно!</span></div>
			<form>
				<div class="input-wrap">
					<input class="username" type="text" name="username" onkeyup="loginValidation()" placeholder="Имя пользователя">
					<i class="fa fa-times" aria-hidden="true" onclick="clearInput('username')"></i>
				</div>
				<div class="input-wrap">
					<input class="password" type="password" name="password" onkeyup="loginValidation()" placeholder="Пароль">
					<i class="far fa-eye fa-eye-slash"></i>
				</div>
				<input type="hidden" name="_csrf" value="${_csrf.token}"/>
				<input type="submit" class="enter disable" value="Войти"/>
				<p>${message!}</p>
			</form>
		</div>
	</div>
	<script src="../static/js/login.js"></script>
</body>
</html>
