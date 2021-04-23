insert into usr(id, username, password, active, name, surname, avatar, email, profile_address)
    values(1, 'admin', 'admin', true, 'Тома', 'Рокмин', 'defaultAvatar.jpg', 'tomarokmin@yandex.ru', 'admin');

insert into user_role (user_id, roles)
    values (1, 'USER'), (1, 'ADMIN');