insert into usr(username, password, active, name, surname, avatar, email)
values ('VladimirLenin', '1', true, 'Владимир', 'Ленин', 'defaultAvatar.jpg', 'test@test.ru'),
       ('Kondrat', '1', true, 'КОндратьев', 'НеПомню', 'defaultAvatar.jpg', 'test1@test.ru');

insert into user_role (user_id, roles)
values (2, 'USER'), (3, 'USER');