<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="../static/css/authorization.css">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
	<title>ProjectTool</title>
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
			<div class="login_title">Пожалуйста <span>зарегистрируйтесь!</span></div>
			<form action="/registration" method="post">
				<div class="input-wrap">
					<input class="username" type="text" name="username" placeholder="Имя пользователя"/>
					<i class="fa fa-times" aria-hidden="true" onclick="clearInput('username')"></i>
				</div>
				<div class="input-wrap">
					<input class="email" type="email" name="email" placeholder="Email"/>
					<i class="fa fa-times" aria-hidden="true" onclick="clearInput('email')"></i>
				</div>
				<div class="input-wrap">
					<input class="name" type="text" name="name" placeholder="Имя"/>
					<i class="fa fa-times" aria-hidden="true" onclick="clearInput('name')"></i>
				</div>
				<div class="input-wrap">
					<input class="surname" type="text" name="surname" placeholder="Фамилия"/>
					<i class="fa fa-times" aria-hidden="true" onclick="clearInput('surname')"></i>
				</div>
				<div class="input-wrap">
					<input class="confirm-password" type="password" name="confirm-password" placeholder="Пароль"/>
					<i class="far fa-eye fa-eye-slash"></i>
				</div>
				<div class="input-wrap">
					<input class="password" type="password" name="password" placeholder="Подтвердите пароль"/>
					<i class="far fa-eye fa-eye-slash"></i>
				</div>
				<input type="hidden" name="_csrf" value="${_csrf.token}"/>
				<input type="submit" class="enter disable" value="Зарегистрироваться"/>
				<p>${message!}</p>
			</form>
		</div>
	</div>
	<script src="../static/js/registration.js"></script>
</body>
</html>
