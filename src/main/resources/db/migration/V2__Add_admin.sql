insert into usr(username, password, active, name, surname, avatar, email)
    values('admin', 'admin', true, 'Тома', 'Рокмин', 'defaultAvatar.jpg', 'tomarokmin@yandex.ru');

insert into user_role (user_id, roles)
    values (1, 'USER'), (1, 'ADMIN');