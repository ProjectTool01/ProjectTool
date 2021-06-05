<#include "parts/security.ftlh">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../static/css/main.css">
    <link rel="stylesheet" type="text/css" href="../static/css/modal.css">
    <link rel="stylesheet" type="text/css" href="../static/css/add-project.css">
    <link rel="stylesheet" type="text/css" href="../static/css/change-profile.css">
    <link rel="stylesheet" type="text/css" href="../static/css/select-project.css">
    <link rel="stylesheet" type="text/css" href="../static/css/enter-project.css">
    <link rel="stylesheet" type="text/css" href="../static/css/my-profile.css">
    <link rel="stylesheet" type="text/css" href="../static/css/user-list.css">
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
                <div class="header-button enter_project">Вступить в проект</div>
                <div class="header-button add_project">Добавить Проект</div>
                <div class="user__block">
                    <div class="user"><img src="/img/${avatar}" alt=""></div>
                    <div class="user__dropdown-menu" id="dropdown">
                        <a class="dropdown-menu__item my-profile">Мой профиль</a>
                        <hr class="dropdown-menu__line">
                        <a class="dropdown-menu__item settings">Настройки</a>
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
            <div class="users card">
                <div class="card-title">Список пользователей <span>2</span></div>
                <div class="card-content">
                    <#list users as user>
                        <div class="card-item">
                            <a href="/userlist?un=${user.username}">${user.username}</a>
                        </div>
                    </#list>
                </div>
                <div class="card-footer">
                    <form method="get" action="/userlist">
                        <div class="input-wrap">
                            <input class="input" type="text" name="username" value="${username!}" placeholder="Имя пользователя">
                        </div>
                        <button class="send-button" type="submit">></button>
                    </form>
                </div>
            </div>
            <#if usercard?has_content>
                <div class="user-profile card">
                    <div class="card-title">Информация о пользователе:</div>
                    <div class="card-content">
                        <div class="user-avatar"><img src="/img/${usercard.avatar}" alt=""></div>
                        <div class="user-bio">
                            <div class="user-username">${usercard.username}</div>
                            <div class="user-name">${usercard.name}</div>
                            <div class="user-lastname">${usercard.surname}</div>
                            <div class="user-mail">${usercard.email}</div>
                        </div>
                    </div>
                </div>
            </#if>
        </div>
        <!--------------------------- content --------------------------->

        <!--------------------------- create project --------------------------->
        <div class="modal create-project__modal" data-close="true">
            <div class="modal-wrap create-project__wrap">
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
        <!--------------------------- create project --------------------------->

        <!--------------------------- user --------------------------->
        <div class="modal user-modal" data-close="true">
            <div class="modal-wrap user-modal__wrap">
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
                        <input class="file-input" type="file" name="file">
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

        <!--------------------------- create project --------------------------->
        <div class="modal enter-project__modal" data-close="true">
            <div class="modal-wrap enter-project__wrap">
                <button class="close-modal" data-close="true">&times;</button>
                <h2 class="modal-title">Вступить в проект</h2>
                <form class="modal-form" action="/addProject" method="post">
                    <div class="input-wrap">
                        <input class="input project-identifier" name="projectIdentifier" placeholder="Идентификатор проекта">
                        <i class="fa fa-times" aria-hidden="true" onclick="clearInput('project-identifier')"></i>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input class="submit disable project-submit" type="submit" value="Вступить в проект"/>
                </form>
            </div>
        </div>
        <!--------------------------- create project --------------------------->

        <!--------------------------- my profile --------------------------->
        <div class="modal my-profile__modal" data-close="true">
            <div class="modal-wrap my-profile__wrap">
                <button class="close-modal" data-close="true">&times;</button>
                <h2 class="modal-title">Данные пользователя</h2>
                Электронная почта: ${email!}<br/>
                Имя пользователя: ${name!}<br/>
                Фамилия пользователя: ${lastname!}<br/>
                Никнейм: ${username!}<br/>
            </div>
        </div>
        <!--------------------------- my profile --------------------------->
    </div>
    <script src="../static/js/main.js"></script>
    <script src="../static/js/user-list.js"></script>
    <script src="../static/js/my-profile.js"></script>
    <script src="../static/js/change-profile.js"></script>
    <script src="../static/js/enter-project.js"></script>
    <script src="../static/js/add-project.js"></script>
</body>
</html>
