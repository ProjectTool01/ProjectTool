<#include "parts/security.ftlh">

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="../static/css/home.css">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
	<title>WorkPix</title>
</head>
<body>
	<div id="sidemenu">
		<div class="side_menu-logo">
			<div class="main-title">Project<span>Tool</span></div>
		</div>
		<nav class="side-menu__buttons">
			<a href="" class="side-menu__link">
				<i class="icon-home"></i> Главная
			</a>
			<a href="" class="side-menu__link">
				<i class="icon-message"></i> Сообщения
			</a>
			<a href="" class="side-menu__link">
				<i class="icon-users"></i> Пользователи
			</a>
			<a href="" class="side-menu__link">
				<i class="icon-fact_check"></i> Задачи
			</a>
			<a href="" class="side-menu__link">
				<i class="icon-bar-chart"></i> Статистика
			</a>
		</nav>
	</div><!-- side_menu -->

	<div class="main" id="main">
		<div class="header">
			<div class="header_left">
				<div class="arrow-left" id="arrow-left"></div>
				<div class="div" onclick="openMenu()">
					<i class="icon-bars1 icon-header" id="icon-bars1"></i>
				</div>

					<i class="icon-search icon-header"></i>

			</div><!-- header_left -->

			<div class="header_right">
				<a href="" class="">
					<div class="add_project">
						<i class="icon-plus"></i>
						Добавить Проект
					</div>
				</a>

				<i class="icon-mail-envelope-closed icon-header"></i>

				<i class="icon-notifications icon-header"></i>

				<div class="user__block">
					<div class="user" id="user1"><img src="/img/${avatar}" alt=""></div>
					<div class="user__dropdown-menu" id="dropdown">
						<a class="dropdown-menu__item">Настройки</a>
						<hr class="dropdown-menu__line">
						<a class="dropdown-menu__item">Помощь</a>
						<hr class="dropdown-menu__line">
						<form action="/logout" method="post" class="dropdown-menu__item">
							<input type="hidden" name="_csrf" value="${_csrf.token}"/>
							<input class="dropdown-menu__item" type="submit" value="Выйти"/>
						</form>
					</div>
				</div>
				<div class="arrow-down"></div>
			</div><!-- header_right -->
		</div>
		<div class="content">
			<#if isAdmin>
        <li>
          <a href="/user/list">User list</a>
        </li>
      </#if>
      <a href="/projects">проекты</a>
      <a href="/userlist">список пользователей</a>
      <a href="/user/${userId}">мой профиль</a>
			<a href="/myprofile">мой профиль</a>
			<h1>Привет, <span>${name}</span></h1>
		</div>
	</div><!-- main -->
	<script>
		function openMenu() {
			document.getElementById("sidemenu").classList.toggle('active');
			document.getElementById("main").classList.toggle('active');
			document.getElementById("arrow-left").classList.toggle('active');
			document.getElementById("icon-bars1").classList.toggle('active');
		}
	</script>
	<script src="../static/js/home.js"></script>
</body>
</html>