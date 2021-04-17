insert into usr(id, username, password, active, name, surname, avatar, email)
values (2, 'VladimirLenin', '1', true, 'Владимир', 'Ленин', 'defaultAvatar.jpg', 'test@test.ru'),
       (3, 'Kondrat', '1', true, 'КОндратьев', 'НеПомню', 'defaultAvatar.jpg', 'test1@test.ru');

insert into user_role (user_id, roles)
values (2, 'USER'), (3, 'USER');