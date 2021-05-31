<#include "parts/security.ftlh">

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="../static/css/main.css">
	<link rel="stylesheet" type="text/css" href="../static/css/home.css">
	<link rel="stylesheet" type="text/css" href="../static/css/select-project.css">
	<link rel="stylesheet" type="text/css" href="../static/css/add-project.css">
	<link rel="stylesheet" type="text/css" href="../static/css/change-profile.css">
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
			<a href="/home" class="side-menu__link">
				<i class="fa fa-home" aria-hidden="true"></i>
				Главная
			</a>
			<a href="/tasks" class="side-menu__link">
				<i class="fa fa-check-circle" aria-hidden="true"></i>
				Задачи
			</a>
			<a href="/messages" class="side-menu__link">
				<i class="fa fa-comment" aria-hidden="true"></i>
				Сообщения
			</a>
			<a href="/userlist" class="side-menu__link">
				<i class="fa fa-users" aria-hidden="true"></i>
				Пользователи
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
					<i class="fa fa-bars" aria-hidden="true" id="icon-bars1"></i>
				</div>
			</div>

			<div class="header_right">
				<div class="add_project">Добавить Проект</div>
				<div class="user__block">
					<div class="user"><img src="/img/${avatar}" alt=""></div>
					<div class="user__dropdown-menu" id="dropdown">
						<a class="dropdown-menu__item settings">Настройки</a>
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
			<div class="content-left">
				<h1>Hello <span>${name}!</span></h1>
				<div class="project-info">
					<div class="project-info__left">
						<div>
							<div class="project-info__title"><#if project?has_content>${project.name}</#if></div>
							<div class="project-description"><#if project?has_content>${project.projectText}</#if></div>
							<div class="project-owner">Владелец проекта:<span><#if project?has_content>${project.projectOwner.username}</#if></span></div>
							<div class="project-identificator">Идентификатор проекта:<span><#if project?has_content>${project.projectIdentifier}</#if></span></div>
							<div class="project-info__members">Members: <span>9</span></div>
							<div class="project-info__tasks">Tasks: <span>100</span></div>
						</div>
						<button class="button decline">Close Project</button>
					</div>
					<div class="project-info__right">
						<canvas class="pie-chart" width="200" height="200"></canvas>
						<div class="result"></div>
					</div>
				</div>
				<div class="content-left__bottom">
					<div class="invitations card">
						<div class="card-title">Invitations <span></span></div>
						<div class="card-content">
							<#--<#list>-->
								<div class="card-item">
									<div class="card-text">Super Puper Project Name</div>
									<div class="invitations-buttons">
										<form class="modal-form" action="/accept" method="post">
											<input type="hidden" name="_csrf" value="${_csrf.token}"/>
											<input class="button accept" type="submit" value="Accept"/>
										</form>
										<form class="modal-form" action="/decline" method="post">
											<input type="hidden" name="_csrf" value="${_csrf.token}"/>
											<input class="button decline" type="submit" value="Decline"/>
										</form>
									</div>
								</div>
							<#--</#list>-->
						</div>
					</div>
					<div class="tasks card">
						<div class="card-title">Tasks <span></span></div>
						<div class="card-content">
							<#--<#list>-->
								<div class="card-item">
									<div class="task-status">N</div>
									<div class="task-text">Make huyna</div>
								</div>
							<#--</#list>-->
						</div>
					</div>
				</div>
			</div>
			<div class="content-right">
				<div class="select-project card">
					<div class="card-title">Projects <span></span></div>
					<div class="card-content">
						<#list projects as item>
							<a href="/home?pid=${item.id}">
								<div class="card-item">
									<div class="person-img"><img src="/img/${avatar}"></div>
									<div class="select-project__info">
										<div class="project-name">${item.name}</div>
										<div class="project-description">${item.projectText}</div>
									</div>
								</div>
							</a>
						</#list>
					</div>
				</div>
			</div>
		</div>
		<!--------------------------- content --------------------------->

		<!--------------------------- modal --------------------------->
		<div class="modal-window" data-close="true">
			<div class="modal-window__wrap">
				<button class="close-modal" data-close="true">&times;</button>
				<h2 class="modal-title">Создание проекта</h2>
				<form class="modal-form" action="/createProject" method="post">
					<div class="input-wrap">
						<input class="input input-name" type="text" name="name" placeholder="Название проекта">
						<i class="fa fa-times" aria-hidden="true" onclick="clearInput('input-name')"></i>
					</div>
					<div class="input-wrap">
						<input class="input input-description" name="text" placeholder="Описание проекта">
						<i class="fa fa-times" aria-hidden="true" onclick="clearInput('input-description')"></i>
					</div>
					<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					<input class="submit disable project-submit" type="submit" value="Добавить проект"/>
				</form>
			</div>
		</div>
		<!--------------------------- modal --------------------------->

		<!--------------------------- user --------------------------->
		<div class="modal-user" data-close="true">
			<div class="modal-user__wrap">
				<button class="close-modal" data-close="true">&times;</button>
				<h2 class="modal-title">Изменение профиля</h2>
				<form class="modal-form" enctype="multipart/form-data" action="/settings" method="post">
					<div class="input-wrap">
						<input class="input input-email" type="text" name="email" placeholder="Изменить маил">
						<i class="fa fa-times" aria-hidden="true" onclick="clearInput('input-email')"></i>
					</div>
					<div class="input-wrap">
						<input class="input input-password" name="password" placeholder="Изменить пароль">
						<i class="fa fa-times" aria-hidden="true" onclick="clearInput('input-password')"></i>
					</div>
					<div class="change-avatar">
						<p>Изменить аватар:</p>
						<input type="file" name="file">
					</div>
					<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					<input class="submit disable" type="submit" value="Сохранить"/>
				</form>
				${changePasswordMessage!}
				${changeEmailMessage!}
				${changeAvatarMessage!}
			</div>
		</div>
		<!--------------------------- user --------------------------->
	</div>
	<script src="../static/js/main.js"></script>
	<script src="../static/js/home.js"></script>
	<script src="../static/js/add-project.js"></script>
	<script src="../static/js/change-profile.js"></script>
</body>
</html>
