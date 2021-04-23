create table project
(
    id               serial8 not null,
    project_owner_id int8    not null,
    project_text     text    not null,
    deleted          boolean not null,
    primary key (id),
    foreign key (project_owner_id) references usr
);

create table task
(
    id            serial8      not null,
    task_owner_id int8         not null,
    project_id    int8         not null,
    task_text     text         not null,
    status        varchar(255) not null,
    deleted       boolean      not null,
    primary key (id),
    foreign key (task_owner_id) references usr,
    foreign key (project_id) references project
);

create table user_project
(
    project_id int8 not null,
    user_id    int8 not null,
    primary key (project_id, user_id),
    foreign key (project_id) references project,
    foreign key (user_id) references usr
);