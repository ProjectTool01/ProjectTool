<#include "parts/security.ftlh">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../static/css/main.css">
    <link rel="stylesheet" type="text/css" href="../static/css/select-project.css">
    <link rel="stylesheet" type="text/css" href="../static/css/add-project.css">
    <link rel="stylesheet" type="text/css" href="../static/css/change-profile.css">
    <link rel="stylesheet" type="text/css" href="../static/css/tasks.css">
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
        <div class="select-project card">
            <div class="card-title">Projects <span></span></div>
            <div class="card-content">
                <#list projects as item>
                    <a href="/tasks?pid=${item.id}">
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
        <div class="tasks card">
            <div class="new-tasks">
                <div class="card-title">NEW<span>1</span></div>
                <div class="card-content">
                    <#if tasks?has_content>
                        <#list tasks as task>
                            <#if task.status?substring(0,1)='N'>
                                <div class="card-item">
                                    <div class="person-img"><img src="/img/${avatar}"></div>
                                    <div class="card-item__right">
                                        <div class="card-item__left-header">
                                            <div class="task-name">${task.name}</div>
                                        </div>
                                        <div class="card-item__left-footer">
                                            <div class="task-text">
                                                ${task.taskText}
                                            </div>
                                            <form method="post" action="/takeTask">
                                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                                <input type="hidden" name="projectId" value="<#if project?has_content>${project.id}</#if>"/>
                                                <input type="hidden" name="taskId" value="<#if project?has_content>${task.id}</#if>"/>
                                                <div><input class="take-button" type="submit" value="+"/></div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </#if>
                        </#list>
                    </#if>
                </div>
            </div>
            <div class="taken-tasks">
                <div class="card-title">TAKEN<span>1</span></div>
                <div class="card-content">
                    <#if tasks?has_content>
                        <#list tasks as task>
                            <#if task.status?substring(0,1)='T'>
                                <div class="card-item">
                                    <div class="person-img"><img src="/img/${avatar}"></div>
                                    <div class="card-item__right">
                                        <div class="card-item__left-header">
                                            <div class="task-name">${task.name}</div>
                                            <div class="task-owner">${task.taskOwner.username!}</div>
                                        </div>
                                        <div class="card-item__left-footer">
                                            <div class="task-text">
                                                ${task.taskText}
                                            </div>
                                            <div class="buttons">
                                                <form method="post" action="/takeTask">
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                                    <input type="hidden" name="projectId" value="<#if project?has_content>${project.id}</#if>"/>
                                                    <input type="hidden" name="taskId" value="<#if project?has_content>${task.id}</#if>"/>
                                                    <div><input class="take-button" type="submit" value="+"/></div>
                                                </form>
                                                <form method="post" action="/doneTask">
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                                    <input type="hidden" name="projectId" value="<#if project?has_content>${project.id}</#if>"/>
                                                    <input type="hidden" name="taskId" value="<#if project?has_content>${task.id}</#if>"/>
                                                    <div><input class="take-button complete" type="submit" value="&#10004;"/></div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </#if>
                        </#list>
                    </#if>
                </div>
            </div>
            <div class="done-tasks">
                <div class="card-title">DONE<span>1</span></div>
                <div class="card-content">
                    <#if tasks?has_content>
                        <#list tasks as task>
                            <#if task.status?substring(0,1)='D'>
                                <div class="card-item">
                                    <div class="person-img"><img src="/img/${avatar}"></div>
                                    <div class="card-item__right">
                                        <div class="card-item__left-header">
                                            <div class="task-name">${task.name}</div>
                                            <div class="task-owner">
                                                <#if task.taskOwner?has_content>
                                                    ${task.taskOwner.username!}
                                                <#else>
                                                    Нету
                                                </#if>
                                            </div>
                                        </div>
                                        <div class="card-item__left-footer">
                                            <div class="task-text">
                                                ${task.taskText}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </#if>
                        </#list>
                    </#if>
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
<script src="../static/js/add-project.js"></script>
<script src="../static/js/change-profile.js"></script>
</body>
</html>
