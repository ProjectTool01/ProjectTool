insert into usr(username, password, active, name, surname, avatar, email)
values ('Komrad', '111', true, 'Карл', 'Никитин', 'defaultAvatar.jpg', 'test@test.ru'),
       ('Kondrat', '111', true, 'Кондратьев', 'Игорь', 'defaultAvatar.jpg', 'test1@test.ru');

insert into user_role (user_id, roles)
values (2, 'USER'), (3, 'USER');