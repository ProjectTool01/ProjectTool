<#include "parts/security.ftlh">

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
	<!--------------------------- side_menu --------------------------->
	<div id="sidemenu">
		<div class="side_menu-logo">
			<div class="main-title">Project<span>Tool</span></div>
		</div>
		<nav class="side-menu__buttons">
			<a href="" class="side-menu__link">
				<i class="icon-home"></i> Главная
			</a>
			<a href="" class="side-menu__link">
				<i class="icon-fact_check"></i> Задачи
			</a>
			<a href="" class="side-menu__link">
				<i class="icon-message"></i> Сообщения
			</a>
			<a href="/userlist" class="side-menu__link">
				<i class="icon-users"></i> Пользователи
			</a>
		</nav>
	</div>
	<!--------------------------- side_menu --------------------------->

	<div class="main" id="main">
		<!--------------------------- header --------------------------->
		<div class="header">
			<div class="header_left">
				<div class="arrow-left" id="arrow-left"></div>
				<div class="burger-wrap">
					<i class="icon-bars1 icon-header" id="icon-bars1"></i>
				</div>
			</div>

			<div class="header_right">
				<div class="add_project">Добавить Проект</div>
				<div class="user__block">
					<div class="user"><img src="/img/${avatar}" alt=""></div>
					<div class="user__dropdown-menu" id="dropdown">
						<a class="dropdown-menu__item" href="/id${userId}">Мой профиль</a>
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
			</div>
		</div>
		<!--------------------------- header --------------------------->

		<!--------------------------- content --------------------------->
		<div class="content">
			<#if isAdmin>
				<li>
				  <a href="/user/list">User list</a>
				</li>
      		</#if>
			<h1>Hello <span>${name}!</span></h1>
		</div>
		<!--------------------------- content --------------------------->

		<!--------------------------- modal --------------------------->
		<div class="modal-window" data-close="true">
			<div class="modal-window__wrap">
				<button class="close-modal" data-close="true">&times;</button>
				<h2 class="modal-title">Создание проекта</h2>
				<form class="modal-form" action="" method="post">
					<div class="input-wrap">
						<input class="input" type="text" name="projectName" placeholder="Введите название">
						<i class="fa fa-times" aria-hidden="true"></i>
					</div>
					<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					<input class="submit disable" type="submit" value="Добавить проект"/>
				</form>
			</div>
		</div>
		<!--------------------------- modal --------------------------->
	</div>
	<script src="../static/js/home.js"></script>
	<script src="../static/js/add-project.js"></script>
</body>
</html>
