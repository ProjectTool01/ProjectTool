insert into usr(username, password, active, name, surname, avatar, email, profile_address)
values ('VladimirLenin', '1', true, 'Владимир', 'Ленин', 'defaultAvatar.jpg', 'test@test.ru', 'test1'),
       ('Kondrat', '1', true, 'КОндратьев', 'НеПомню', 'defaultAvatar.jpg', 'test1@test.ru', 'test2');

insert into user_role (user_id, roles)
values (2, 'USER'), (3, 'USER');